<?

    abstract class AbstractTable
    {
        public ?int $id = null;

        /**
         * Название (желательно кешированной) таблицы с минимальными актуальными данными
         * @return string
         */
        abstract static function get_minimized_table_cache_name(): string;

        /**
         * Название (желательно кешированной) таблицы с расширенными данными
         * @return string
         */
        abstract static function get_extended_table_cache_name(): string;

        /**
         * Исходное название таблицы
         * @return string
         */
        abstract static function get_table_name(): string;

        /**
         * Сортировка для таблицы
         * @return array
         */
        abstract static function get_order_by(): array;

        /**
         * Table constructor.
         * @param array $row
         */
        function __construct(array $row)
        {
            $this->id = $row["ID_" . static::get_table_name()];
        }

        /**
         * Получает одну запись из таблицы по запросу
         * @param string $query
         * @return mixed|null
         * @throws Exception
         */
        protected static function get_one_by_query(string $query)
        {
            $res = db_query($query);
            if ($res && db_num_rows($res)) {
                $row = db_fetch_assoc($res);
                return new static($row);
            } else {
                return null;
            }
        }

        /**
         * Получает все записи из таблицы по запросу. !! В запрос необходимо добавить get_order_by()
         * @param string $query
         * @return array
         * @throws Exception
         */
        protected static function get_all_by_query(string $query): array
        {
            $return = [];
            $res = db_query($query);
            if ($res && db_num_rows($res)) {
                while ($row = db_fetch_assoc($res)) {
                    array_push($return, new static($row));
                }
            }
            return $return;
        }

        /**
         * @param bool $with_sold
         * @return string
         */
        protected static function get_table_cache_name(bool $with_sold): string
        {
            if ($with_sold) {
                return static::get_extended_table_cache_name();
            } else {
                return static::get_minimized_table_cache_name();
            }
        }

        /**
         * @param int $id
         * @param bool $with_sold
         * @return mixed|null
         * @throws Exception
         */
        public static function get_by_id(int $id, bool $with_sold = false)
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            return static::get_one_by_query("SELECT * FROM $table_cache_name WHERE ID_$table_name = $id LIMIT 1");
        }

        /**
         * @param int[] $id_array
         * @param bool $with_sold
         * @return array
         * @throws Exception
         */
        public static function get_by_id_array(array $id_array, bool $with_sold = false): array
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $db_ids = implode(", ", $id_array);
            return static::get_all_by_query("SELECT * FROM $table_cache_name WHERE ID_$table_name IN ($db_ids) ORDER BY " . implode(",", static::get_order_by()));
        }

        /**
         * @param string $eng
         * @param bool $with_sold
         * @return mixed|null
         * @throws Exception
         */
        public static function get_by_eng(string $eng, bool $with_sold = false)
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            return static::get_one_by_query("SELECT * FROM $table_cache_name WHERE {$table_name}_ENG = '$eng' LIMIT 1");
        }

        /**
         * @param string[] $eng_array
         * @param bool $with_sold
         * @return array
         * @throws Exception
         */
        public static function get_by_eng_array(array $eng_array, bool $with_sold = false): array
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $db_engs = implode("', '", $eng_array);
            return static::get_all_by_query("SELECT * FROM $table_cache_name WHERE {$table_name}_ENG IN ('$db_engs') ORDER BY " . implode(",", static::get_order_by()));
        }

        /**
         * @param Filter[] $filters
         * @param bool $with_sold
         * @param array $order_by
         * @return array
         * @throws Exception
         */
        public static function get_all(array $filters = [], bool $with_sold = false, array $order_by = []): array
        {
            $table_cache_name = static::get_table_cache_name($with_sold);
            $query = "SELECT * FROM $table_cache_name WHERE (1 = 1)";
            foreach ($filters as $filter) {
                $query .= $filter->get_where();
            }
            if ($order_by) {
                $query .= " ORDER BY " . implode(",", $order_by);
            } else {
                $query .= " ORDER BY " . implode(",", static::get_order_by());
            }
            //if ($table_cache_name == "AV_OBJECT_TYPE") {
            //    die($query);
            //}
            return static::get_all_by_query($query);
        }

        /**
         * @param Filter[] $filters
         * @param bool $with_sold
         * @return int
         * @throws Exception
         */
        public static function get_count(array $filters = [], bool $with_sold = false): int
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $query = "SELECT COUNT(*) as {$table_name}_COUNT FROM $table_cache_name WHERE (1 = 1)";
            foreach ($filters as $filter) {
                $query .= $filter->get_where();
            }
            $res = db_query($query);
            if ($res && db_num_rows($res)) {
                $row = db_fetch_assoc($res);
                return $row["{$table_name}_COUNT"];
            } else {
                return 0;
            }
        }

        /**
         * @param int $limit
         * @param int $offset
         * @param Filter[] $filters
         * @param bool $with_sold
         * @param array $order_by
         * @return array
         * @throws Exception
         */
        public static function get_by_limit(int $limit, int $offset = 0, array $filters = [], bool $with_sold = false, array $order_by = []): array
        {
            $table_cache_name = static::get_table_cache_name($with_sold);
            $query = "SELECT * FROM $table_cache_name WHERE (1 = 1)";
            foreach ($filters as $filter) {
                $query .= $filter->get_where();
            }
            if ($order_by) {
                $query .= " ORDER BY " . implode(",", $order_by) . " LIMIT $offset, $limit";
            } else {
                $query .= " ORDER BY " . implode(",", static::get_order_by()) . " LIMIT $offset, $limit";
            }
            //if ($table_cache_name == "AA_CACHE_OBJECT_ACTIVE") {
            //    die($query);
            //}
            return static::get_all_by_query($query);
        }
    }

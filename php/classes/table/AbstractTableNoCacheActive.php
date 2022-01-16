<?

    abstract class AbstractTableNoCacheActive extends AbstractTableNoCache
    {

        public ?bool $is_active = null;

        /**
         * Promo constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);

            $table_name = static::get_table_name();
            $this->is_active = bool_from_db($row["{$table_name}_IS_ACTIVE"]);
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
            return static::get_one_by_query("SELECT * FROM $table_cache_name WHERE (ID_$table_name = $id) AND ({$table_name}_IS_ACTIVE = 'Да') LIMIT 1");
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
            return static::get_all_by_query("SELECT * FROM $table_cache_name WHERE (ID_$table_name IN ($db_ids)) AND ({$table_name}_IS_ACTIVE = 'Да') ORDER BY " . implode(",", static::get_order_by()));
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
            return static::get_one_by_query("SELECT * FROM $table_cache_name WHERE ({$table_name}_ENG = '$eng') AND ({$table_name}_IS_ACTIVE = 'Да') LIMIT 1");
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
            return static::get_all_by_query("SELECT * FROM $table_cache_name WHERE ({$table_name}_ENG IN ('$db_engs')) AND ({$table_name}_IS_ACTIVE = 'Да') ORDER BY " . implode(",", static::get_order_by()));
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
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $query = "SELECT * FROM $table_cache_name WHERE (1 = 1)";
            foreach ($filters as $filter) {
                $query .= $filter->get_where();
            }
            $query .= " AND ({$table_name}_IS_ACTIVE = 'Да')";
            if ($order_by) {
                $query .= " ORDER BY " . implode(",", $order_by);
            } else {
                $query .= " ORDER BY " . implode(",", static::get_order_by());
            }
            /*if ($table_cache_name == "AV_CACHE_BUSINESS_ACTIVE") {
                die($query);
            }*/
            return static::get_all_by_query($query);
        }

        /**
         * @param Filter[] $filters
         * @param bool $with_sold
         * @return mixed|null
         * @throws Exception
         */
        public static function get_random(array $filters = [], bool $with_sold = false)
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $query = "SELECT *, RAND() as rnd FROM $table_cache_name WHERE (1 = 1)";
            foreach ($filters as $filter) {
                $query .= $filter->get_where();
            }
            $query .= " AND ({$table_name}_IS_ACTIVE = 'Да') ORDER BY rnd LIMIT 1";
            /*if ($table_cache_name == "AV_CACHE_BUSINESS_ACTIVE") {
                die($query);
            }*/
            return static::get_one_by_query($query);
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
            $query .= " AND ({$table_name}_IS_ACTIVE = 'Да')";
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
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $query = "SELECT * FROM $table_cache_name WHERE (1 = 1)";
            if ($filters) {
                foreach ($filters as $filter) {
                    $query .= $filter->get_where();
                }
            }
            $query .= " AND ({$table_name}_IS_ACTIVE = 'Да')";
            if ($order_by) {
                $query .= " ORDER BY " . implode(",", $order_by) . " LIMIT $offset, $limit";
            } else {
                $query .= " ORDER BY " . implode(",", static::get_order_by()) . " LIMIT $offset, $limit";
            }
            /*if ($table_cache_name == "AA_CACHE_OBJECT_ACTIVE") {
                die($query);
            }*/
            return static::get_all_by_query($query);
        }
    }

<?

    /**
     * Класс таблицы количества комнат
     */
    class Rooms extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_ROOMS";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["AV_ROOMS_COUNT"];
        }

        public ?string $short = null;
        public ?string $full = null;
        public ?string $code = null;
        public ?int $count = null;

        /**
         * Rooms constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->short = $row["AV_ROOMS_SHORT"];
            $this->full = $row["AV_ROOMS_FULL"];
            $this->code = $row["AV_ROOMS_CODE"];
            $this->count = $row["AV_ROOMS_COUNT"];
        }

        /**
         * @param string $code
         * @param bool $with_sold
         * @return mixed|null
         * @throws Exception
         */
        public static function get_by_code(string $code, bool $with_sold = false)
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            return static::get_one_by_query("SELECT * FROM $table_cache_name WHERE {$table_name}_CODE = '$code' LIMIT 1");
        }

        /**
         * @param string[] $code_array
         * @param bool $with_sold
         * @return array
         * @throws Exception
         */
        public static function get_by_code_array(array $code_array, bool $with_sold = false): array
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $db_codes = implode("', '", $code_array);
            return static::get_all_by_query("SELECT * FROM $table_cache_name WHERE {$table_name}_CODE IN ('$db_codes') ORDER BY " . implode(",", static::get_order_by()));
        }

        /**
         * @param int $count
         * @param bool $with_sold
         * @return mixed|null
         * @throws Exception
         */
        public static function get_by_count(int $count, bool $with_sold = false)
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            return static::get_one_by_query("SELECT * FROM $table_cache_name WHERE {$table_name}_COUNT = '$count' LIMIT 1");
        }

        /**
         * @param int[] $count_array
         * @param bool $with_sold
         * @return array
         * @throws Exception
         */
        public static function get_by_count_array(array $count_array, bool $with_sold = false): array
        {
            $table_name = static::get_table_name();
            $table_cache_name = static::get_table_cache_name($with_sold);
            $db_counts = implode("', '", $count_array);
            return static::get_all_by_query("SELECT * FROM $table_cache_name WHERE {$table_name}_COUNT IN ('$db_counts') ORDER BY " . implode(",", static::get_order_by()));
        }

        /**
         * Получает массив количества комнат на основе массива id объектов
         * @param bool|null $is_arenda
         * @param bool $with_sold
         * @return Rooms[]
         * @throws Exception
         */
        public static function get_rooms_in_objects(?bool $is_arenda = null, bool $with_sold = false): array
        {
            $table_object_flat_cache_name = Object::get_table_cache_name($with_sold);
            $query = "SELECT ar.ID_AV_ROOMS, MIN(ar.AV_ROOMS_SHORT) AS AV_ROOMS_SHORT, MIN(ar.AV_ROOMS_FULL) AS AV_ROOMS_FULL, MIN(ar.AV_ROOMS_CODE) AS AV_ROOMS_CODE, MIN(ar.AV_ROOMS_COUNT) AS AV_ROOMS_COUNT FROM {$table_object_flat_cache_name} aco LEFT JOIN AV_ROOMS ar on aco.ID_AV_ROOMS = ar.ID_AV_ROOMS";
            if ($is_arenda !== null) {
                $is_arenda_db = bool_to_db($is_arenda);
                $query .= " WHERE aco.AV_OBJECT_IS_ARENDA = '$is_arenda_db'";
            }
            $query .= " GROUP BY ar.ID_AV_ROOMS ORDER BY " . implode(",", static::get_order_by());
            return static::get_all_by_query($query);
        }
    }

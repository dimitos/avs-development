<?

    /**
     * Класс таблицы городов
     */
    class City extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_CITY";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_CITY"];
        }

        public ?string $full = null;

        /**
         * City constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_CITY_FULL"];
        }
    }

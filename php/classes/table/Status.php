<?

    /**
     * Класс таблицы статусов
     */
    class Status extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_STATUS";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["AV_STATUS_SORT"];
        }

        public ?string $full = null;
        public ?int $sort = null;
        public ?string $eng = null;

        /**
         * Status constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_STATUS_FULL"];
            $this->sort = $row["AV_STATUS_SORT"];
            $this->eng = $row["AV_STATUS_ENG"];
        }
    }

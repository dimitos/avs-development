<?

    /**
     * Класс таблицы акционных бейджей
     */
    class Badge extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_BADGE";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_BADGE"];
        }

        public ?string $full = null;
        public ?string $eng = null;

        /**
         * Badge constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_BADGE_FULL"];
            $this->eng = $row["AV_BADGE_ENG"];
        }
    }

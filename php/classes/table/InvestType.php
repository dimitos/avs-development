<?

    /**
     * Класс таблицы типов площадей участков
     */
    class InvestType extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_INVEST_TYPE";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_INVEST_TYPE"];
        }

        public ?string $full = null;
        public ?string $sale_text = null;

        /**
         * InvestType constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_INVEST_TYPE_FULL"];
            $this->sale_text = $row["AV_INVEST_TYPE_SALE_TEXT"];
        }
    }

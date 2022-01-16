<?

    /**
     * Класс таблицы типов площадей участков
     */
    class AreaLandType extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_AREA_LAND_TYPE";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_AREA_LAND_TYPE"];
        }

        public ?string $full = null;

        /**
         * AreaLandType constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_AREA_LAND_TYPE_FULL"];
        }
    }

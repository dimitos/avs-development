<?

    /**
     * Класс таблицы типов объектов
     */
    class ObjectType extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_OBJECT_TYPE";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_OBJECT_TYPE"];
        }

        public ?string $full = null;
        public ?string $eng = null;

        /**
         * ObjectType constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_OBJECT_TYPE_FULL"];
            $this->eng = $row["AV_OBJECT_TYPE_ENG"];
        }
    }

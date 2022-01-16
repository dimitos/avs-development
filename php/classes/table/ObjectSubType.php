<?

    /**
     * Класс таблицы подтипов объектов
     */
    class ObjectSubType extends AbstractTableNoCache
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_OBJECT_SUBTYPE";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_OBJECT_SUBTYPE"];
        }

        public ?ObjectType $type = null;
        public ?string $full = null;
        public ?string $eng = null;

        /**
         * ObjectSubType constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->type = new ObjectType($row);
            $this->full = $row["AV_OBJECT_SUBTYPE_FULL"];
            $this->eng = $row["AV_OBJECT_SUBTYPE_ENG"];
        }
    }

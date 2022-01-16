<?

    /**
     * Класс таблицы промо баннеров
     */
    class Promo extends AbstractTableNoCacheActive
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_PROMO";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_PROMO"];
        }

        public ?string $full = null;
        public ?string $subtitle = null;
        public ?string $photo = null;
        public ?string $url = null;
        public ?string $button = null;

        /**
         * Promo constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_PROMO_FULL"];
            $this->subtitle = $row["AV_PROMO_SUBTITLE"];
            $this->photo = db_photo_urls_to_one_img($row["AV_PROMO_PHOTO"]);
            $this->url = $row["AV_PROMO_URL"];
            $this->button = $row["AV_PROMO_BUTTON"];
        }
    }

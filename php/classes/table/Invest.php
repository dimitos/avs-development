<?

    /**
     * Класс таблицы промо баннеров
     */
    class Invest extends AbstractTable
    {

        /**
         * Название (желательно кешированной) таблицы с минимальными актуальными данными
         * @return string
         */
        static function get_minimized_table_cache_name(): string
        {
            return "AA_CACHE_INVEST_ACTIVE";
        }

        /**
         * Название (желательно кешированной) таблицы с расширенными данными
         * @return string
         */
        static function get_extended_table_cache_name(): string
        {
            return "AA_CACHE_INVEST_ALL";
        }

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_INVEST";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["ID_AV_INVEST_TYPE", "ID_AV_INVEST"];
        }

        public ?InvestType $type = null;
        public ?Badge $badge = null;
        public ?string $full = null;
        public ?string $preview = null;
        public ?string $star_text = null;
        public ?string $photo = null;
        public ?string $url = null;
        public ?bool $is_active = null;

        /**
         * Invest constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->type = new InvestType($row);
            $this->badge = new Badge($row);
            $this->full = $row["AV_INVEST_FULL"];
            $this->preview = $row["AV_INVEST_PREVIEW"];
            $this->star_text = $row["AV_INVEST_STAR"];
            $this->photo = db_photo_urls_to_one_img($row["AV_INVEST_PHOTO"]);
            $this->url = $row["AV_INVEST_URL"];
            $this->is_active = bool_from_db($row["AV_INVEST_IS_ACTIVE"]);
        }
    }

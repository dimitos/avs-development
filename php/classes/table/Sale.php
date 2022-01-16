<?

    /**
     * Класс таблицы промо баннеров
     */
    class Sale extends AbstractTableNoCacheActive
    {

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_SALE";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["AV_SALE_SORT", "AV_SALE_DATE_START DESC"];
        }

        public ?string $full = null;
        public ?string $eng = null;
        public ?string $preview = null;
        public ?string $description = null;

        public ?string $photo_preview = null;
        public ?string $photo_detail = null;
        public ?array $photos = null;

        public ?DateTime $date_start = null;
        public ?DateTime $date_end = null;

        public ?bool $is_arenda = null;

        public ?int $sort = null;

        // Переменные для отображения
        public ?string $url = null;

        public ?string $date_start_display = null;
        public ?string $date_end_display = null;

        /**
         * Sale constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);
            $this->full = $row["AV_SALE_FULL"];
            $this->eng = $row["AV_SALE_ENG"];
            $this->preview = $row["AV_SALE_PREVIEW"];

            if ($row["AV_SALE_DESCRIPTION"]) {
                if (mb_strpos($row["AV_SALE_DESCRIPTION"], "%7B%22ops") !== false) {
                    $this->description = quill_decode($row["AV_SALE_DESCRIPTION"]);
                } else {
                    $this->description = $row["AV_SALE_DESCRIPTION"];
                }
            }

            $this->photo_preview = db_photo_urls_to_one_img($row["AV_SALE_PHOTO_PREVIEW"]);
            $this->photo_detail = db_photo_urls_to_one_img($row["AV_SALE_PHOTO_DETAIL"]);
            $this->photos = db_photo_urls_to_array($row["AV_SALE_PHOTOS"], false);

            $this->date_start = new DateTime($row["AV_SALE_DATE_START"]);
            $this->date_start_display = $this->date_start->format("d.m.Y");
            if ($this->date_end) {
                $this->date_end = new DateTime($row["AV_SALE_DATE_END"]);
                $this->date_end_display = $this->date_end->format("d.m.Y");
            }

            $this->is_arenda = bool_from_db($row["AV_SALE_IS_ARENDA"]);

            $this->sort = $row["AV_SALE_SORT"];

            if ($this->is_arenda) {
                $this->url = "/promotions/arenda/{$row["AV_SALE_ENG"]}";
            } else {
                $this->url = "/promotions/prodazha/{$row["AV_SALE_ENG"]}";
            }
        }
    }

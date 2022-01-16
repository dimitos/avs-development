<?

    /**
     * Класс таблицы объектов
     */
    class ObjectA extends AbstractTable
    {

        /**
         * Название (желательно кешированной) таблицы с минимальными актуальными данными
         * @return string
         */
        static function get_minimized_table_cache_name(): string
        {
            return "AA_CACHE_OBJECT_ACTIVE";
        }

        /**
         * Название (желательно кешированной) таблицы с расширенными данными
         * @return string
         */
        static function get_extended_table_cache_name(): string
        {
            return "AA_CACHE_OBJECT_ALL";
        }

        /**
         * Исходное название таблицы
         * @return string
         */
        static function get_table_name(): string
        {
            return "AV_OBJECT";
        }

        /**
         * Сортировка для таблицы
         * @return array
         */
        static function get_order_by(): array {
            return ["AV_OBJECT_COST", "AV_OBJECT_COST_M2", "AV_OBJECT_COST_LAND"];
        }

        public ?Status $status = null;
        public ?ObjectSubType $sub_type = null;
        public ?Rooms $rooms = null;
        public ?Badge $badge = null;
        public ?City $city = null;
        public ?AreaLandType $area_land_type = null;

        public ?string $full = null;
        public ?string $description = null;
        public ?string $eng = null;
        public ?string $address = null;
        public ?string $coordinates = null;
        public ?string $phone = null;
        public ?string $file = null;

        public ?array $photos = null;

        public ?bool $is_arenda = null;
        public ?bool $is_active = null;

        public ?float $cost = null;
        public ?float $cost_old = null;
        public ?float $cost_m2 = null;
        public ?float $cost_land = null;

        public ?float $area_full = null;
        public ?float $area_land = null;

        public ?string $benefit_h1 = null;
        public ?string $benefit_desc1 = null;
        public ?string $benefit_h2 = null;
        public ?string $benefit_desc2 = null;
        public ?string $benefit_h3 = null;
        public ?string $benefit_desc3 = null;

        // Переменные для отображения
        public ?string $url = null;

        public ?string $cost_display = null;
        public ?string $cost_old_display = null;
        public ?string $cost_m2_display = null;
        public ?string $cost_land_display = null;

        public ?string $area_full_display = null;
        public ?string $area_land_display = null;

        public ?string $phone_display = null;

        /**
         * HouseFlat constructor.
         * @param array $row
         * @throws Exception
         */
        function __construct(array $row)
        {
            parent::__construct($row);

            $this->status = new Status($row);
            $this->sub_type = new ObjectSubType($row);
            $this->rooms = new Rooms($row);
            $this->badge = new Badge($row);
            $this->city = new City($row);
            $this->area_land_type = new AreaLandType($row);

            $this->full = $row["AV_OBJECT_FULL"];
            if (mb_strpos($row["AV_OBJECT_DESCRIPTION"], "%7B%22ops") !== false) {
                $this->description = quill_decode($row["AV_OBJECT_DESCRIPTION"]);
            } else {
                $this->description = $row["AV_OBJECT_DESCRIPTION"];
            }
            $this->eng = $row["AV_OBJECT_ENG"];
            $this->address = $row["AV_OBJECT_ADDRESS"];
            $this->coordinates = $row["AV_OBJECT_COORDINATES"];
            $this->phone = $row["AV_OBJECT_PHONE"];
            $this->file = db_photo_urls_to_one_img($row["AV_OBJECT_FILE"]);

            $this->photos = db_photo_urls_to_array($row["AV_OBJECT_PHOTOS"]);
            $this->is_arenda = bool_from_db($row["AV_OBJECT_IS_ARENDA"]);
            $this->is_active = bool_from_db($row["AV_OBJECT_IS_ACTIVE"]);
            $this->cost = $row["AV_OBJECT_COST"];
            $this->cost_old = $row["AV_OBJECT_COST_OLD"];
            $this->cost_m2 = $row["AV_OBJECT_COST_M2"];
            $this->cost_land = $row["AV_OBJECT_COST_LAND"];
            $this->area_full = $row["AV_OBJECT_AREA_FULL"];
            $this->area_land = $row["AV_OBJECT_AREA_LAND"];

            $this->benefit_h1 = $row["AV_OBJECT_BENEFIT_H1"];
            $this->benefit_desc1 = $row["AV_OBJECT_BENEFIT_DESC1"];
            $this->benefit_h2 = $row["AV_OBJECT_BENEFIT_H2"];
            $this->benefit_desc2 = $row["AV_OBJECT_BENEFIT_DESC2"];
            $this->benefit_h3 = $row["AV_OBJECT_BENEFIT_H3"];
            $this->benefit_desc3 = $row["AV_OBJECT_BENEFIT_DESC3"];

            if ($this->is_arenda) {
                $url_part = "arenda";
            } else {
                $url_part = "prodazha";
            }
            $this->url = "/nedvizhimost/$url_part/{$this->sub_type->type->eng}/{$this->eng}";
            if ($this->cost) {
                $this->cost_display = currency_format($this->cost, true);
            }
            if ($this->cost_old) {
                $this->cost_old_display = currency_format($this->cost_old, true);
            }
            if ($this->cost_m2) {
                $this->cost_m2_display = currency_format($this->cost_m2, true);
            }
            if ($this->cost_land) {
                $this->cost_land_display = currency_format($this->cost_land, true);
                if ($this->area_land_type->full) {
                    $this->cost_land_display .= $this->area_land_type->full;
                }
            }
            if ($this->area_full) {
                $this->area_full_display = float_format($this->area_full, true) . " м²";
            }
            if ($this->area_land) {
                $this->area_land_display = float_format($this->area_land, true);
            }
            if ($this->phone) {
                $this->phone_display = format_phone($this->phone);
            }
        }
    }

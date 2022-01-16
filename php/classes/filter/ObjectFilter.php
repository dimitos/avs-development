<?

    /**
     * Класс для фильтрации объектов
     */
    class ObjectFilter extends Filter
    {
        public ?float $min_area = null;
        public ?float $max_area = null;
        public ?float $min_cost = null;
        public ?float $max_cost = null;

        /**
         * @var Rooms[]|null
         */
        public ?array $rooms = null;

        public ?bool $is_arenda = null;

        public ?bool $have_badge = null;

        public ?string $type = null;

        public ?string $search = null;


        /**
         * Получает условия AND для where части запроса
         * @return string
         * @throws Exception
         */
        function get_where(): string
        {
            $query = "";

            // Фильтр поиска
            if ($this->search) {
                $search = db_real_escape_string($this->search);
                $query .= " AND (
                    (AV_OBJECT_FULL LIKE '%$search%') OR
                    (AV_OBJECT_DESCRIPTION LIKE '%$search%') OR
                    (AV_OBJECT_ADDRESS LIKE '%$search%') OR
                    (AV_OBJECT_BENEFIT_H1 LIKE '%$search%') OR
                    (AV_OBJECT_BENEFIT_H2 LIKE '%$search%') OR
                    (AV_OBJECT_BENEFIT_H3 LIKE '%$search%') OR
                    (AV_OBJECT_BENEFIT_DESC1 LIKE '%$search%') OR
                    (AV_OBJECT_BENEFIT_DESC2 LIKE '%$search%') OR
                    (AV_OBJECT_BENEFIT_DESC3 LIKE '%$search%') OR
                    (AV_OBJECT_SUBTYPE_FULL LIKE '%$search%') OR
                    (AV_OBJECT_TYPE_FULL LIKE '%$search%') OR
                    (AV_ROOMS_SHORT LIKE '%$search%') OR
                    (AV_ROOMS_FULL LIKE '%$search%') OR
                    (AV_BADGE_FULL LIKE '%$search%') OR
                    (AV_CITY_FULL LIKE '%$search%')
                )";
            }

            // Фильтр типа объекта
            if ($this->type) {
                $type = db_real_escape_string($this->type);
                $query .= " AND (AV_OBJECT_TYPE_ENG = '$type')";
            }

            // Фильтр площади
            if ($this->min_area) {
                $query .= " AND (AV_OBJECT_AREA_FULL >= {$this->min_area})";
            }
            if ($this->max_area) {
                $query .= " AND (AV_OBJECT_AREA_FULL <= {$this->max_area})";
            }

            // Фильтр стоимости
            if ($this->min_cost) {
                $query .= " AND (AV_OBJECT_COST >= {$this->min_cost})";
            }
            if ($this->max_cost) {
                $query .= " AND (AV_OBJECT_COST <= {$this->max_cost})";
            }

            // Фильтр аренды/продажи
            if ($this->is_arenda !== null) {
                $is_arenda = bool_to_db($this->is_arenda);
                $query .= " AND (AV_OBJECT_IS_ARENDA = '$is_arenda')";
            }

            // Фильтр по наличию бейджа
            if ($this->have_badge !== null) {
                $have_badge = bool_to_db($this->have_badge);
                if ($have_badge) {
                    $query .= " AND (ID_AV_BADGE IS NOT NULL)";
                } else {
                    $query .= " AND (ID_AV_BADGE IS NULL)";
                }
            }

            // Фильтр по кол-ву комнат
            if ($this->rooms) {
                $rooms_id_array = [];
                foreach ($this->rooms as $room) {
                    $rooms_id_array[] = $room->id;
                }
                $rooms_id_string = implode(", ", $rooms_id_array);
                $query .= " AND (ID_AV_ROOMS IN ($rooms_id_string))";
            }

            return $query;
        }

        /**
         * Получает фильтр на основе get параметров
         * @return ObjectFilter
         * @throws Exception
         */
        static function get_by_get(): ObjectFilter
        {
            $object_filter = new ObjectFilter();

            if (isset($_GET["rooms"]) && $_GET["rooms"]) {
                $object_filter->rooms = Rooms::get_by_code_array($_GET["rooms"]);
            }

            if (isset($_GET["price"]) && $_GET["price"]) {
                $max_price_index = count($_GET["price"]) - 1;
                $cost = $_GET["price"][$max_price_index] * 1000000;
                $object_filter->max_cost = $cost;
            } else {
                if (isset($_GET["min_cost"]) && $_GET["min_cost"]) {
                    $object_filter->min_cost = $_GET["min_cost"];
                }
                if (isset($_GET["max_cost"]) && $_GET["max_cost"]) {
                    $object_filter->max_cost = $_GET["max_cost"];
                }
            }
            if (isset($_GET["min_area"]) && $_GET["min_area"]) {
                $object_filter->min_area = $_GET["min_area"];
            }
            if (isset($_GET["max_area"]) && $_GET["max_area"]) {
                $object_filter->max_area = $_GET["max_area"];
            }

            if (isset($_GET["search"]) && $_GET["search"]) {
                $object_filter->search = $_GET["search"];
            }

            $url = get_url_lvls();
            if (($url->lvl2 == "prodazha") || (isset($_GET["form"]) && ($_GET["form"] == "prodazha"))) {
                $object_filter->is_arenda = false;
            } elseif (($url->lvl2 == "arenda") || (isset($_GET["form"]) && ($_GET["form"] == "arenda"))) {
                $object_filter->is_arenda = true;
            }

            if ($url->lvl3) {
                $object_filter->type = $url->lvl3;
            }

            return $object_filter;
        }

        /**
         * Получает сортировку на основе get параметров
         * @return array
         * @throws Exception
         */
        static function get_order_by_get(): array
        {
            $order_by = [];
            if (isset($_GET["sort"]) && ($_GET["sort"])) {
                switch ($_GET["sort"]) {
                    case "cost_min":
                        $order_by = ["AV_OBJECT_COST", "AV_OBJECT_COST_M2", "AV_OBJECT_COST_LAND"];
                        break;
                    case "cost_max":
                        $order_by = ["AV_OBJECT_COST DESC", "AV_OBJECT_COST_M2 DESC", "AV_OBJECT_COST_LAND DESC"];
                        break;
                    case "area_min":
                        $order_by = ["AV_OBJECT_AREA_FULL", "AV_OBJECT_AREA_LAND"];
                        break;
                    case "area_max":
                        $order_by = ["AV_OBJECT_AREA_FULL DESC", "AV_OBJECT_AREA_LAND DESC"];
                        break;
                }
            }
            return $order_by;
        }
    }

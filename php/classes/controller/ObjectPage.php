<?

    /**
     * Класс данных для страницы объектов
     */
    class ObjectPage extends PaginatorPage
    {

        /**
         * @var ObjectA[]
         */
        public array $objects = [];

        /**
         * @var Sale[]
         */
        public array $sale = [];

        /**
         * @param int $code
         * @param string $name
         * @throws Exception
         */
        public function __construct(int $code, string $name)
        {
            parent::__construct($code, $name, "Акции");

            $url = get_url_lvls();
            //die(json_encode($url, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
            if (!$url->lvl2) {
                redirect("/nedvizhimost/prodazha");
            }

            $object_order = ObjectFilter::get_order_by_get();
            $object_filter = ObjectFilter::get_by_get();
            $this->fill_paginator(ObjectA::get_count([$object_filter]), 14);
            $this->objects = ObjectA::get_by_limit($this->limit, ($this->page_num - 1) * $this->limit, [$object_filter], false, $object_order);

            $sale_filter = SaleFilter::get_by_get();
            $this->sale = Sale::get_by_limit(2, 0, [$sale_filter]);

            $this->breadcrumbs = [
                new Breadcrumb("/", "Главная"),
                new Breadcrumb("/nedvizhimost", "Объекты недвижимости")
            ];
            if ($url->lvl2 == "arenda") {
                array_push($this->breadcrumbs, new Breadcrumb("/nedvizhimost/arenda", "Аренда"));
            } elseif ($url->lvl2 == "prodazha") {
                array_push($this->breadcrumbs, new Breadcrumb("/nedvizhimost/prodazha", "Продажа"));
            }
            if ($url->lvl3) {
                $type = ObjectType::get_by_eng($url->lvl3);
                array_push($this->breadcrumbs, new Breadcrumb("/nedvizhimost/{$url->lvl2}/{$url->lvl3}", $type->full));
            }
        }

        /**
         * @return ObjectPage
         * @throws Exception
         */
        public static function code200(): ObjectPage
        {
            return new ObjectPage(200, "nedvizhimost");
        }
    }

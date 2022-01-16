<?

    /**
     * Класс данных для страницы акций
     */
    class SalePage extends PaginatorPage
    {

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

            $this->breadcrumbs = [
                new Breadcrumb("/", "Главная"),
                new Breadcrumb("/promotions", "Акции")
            ];

            $url = get_url_lvls();
            if ($url->lvl2) {
                $sale_filter = new SaleFilter();
                if ($url->lvl2 == "arenda") {
                    $sale_filter->is_arenda = true;
                    array_push($this->breadcrumbs, new Breadcrumb("/promotions/arenda", "Акции по аренде"));
                } elseif ($url->lvl2 == "prodazha") {
                    $sale_filter->is_arenda = false;
                    array_push($this->breadcrumbs, new Breadcrumb("/promotions/prodazha", "Акции по продаже"));
                }
                $this->fill_paginator(Sale::get_count([$sale_filter]), 12);
                $this->sale = Sale::get_by_limit($this->limit, ($this->page_num - 1) * $this->limit, [$sale_filter]);
            } else {
                $this->fill_paginator(Sale::get_count(), 12);
                $this->sale = Sale::get_by_limit($this->limit, ($this->page_num - 1) * $this->limit);
            }
        }

        /**
         * @return SalePage
         * @throws Exception
         */
        public static function code200(): SalePage
        {
            return new SalePage(200, "promotions");
        }
    }

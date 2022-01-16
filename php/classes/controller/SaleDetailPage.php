<?

    /**
     * Класс данных для детальной страницы акции
     */
    class SaleDetailPage extends Page
    {
        public Sale $sale;

        /**
         * @var Sale[]
         */
        public array $sale_other = [];

        /**
         * @param int $code
         * @param string $name
         * @throws Exception
         */
        public function __construct(int $code, string $name)
        {
            $url = get_url_lvls();
            $this->sale = Sale::get_by_eng($url->lvl3);
            $this->sale_other = Sale::get_all();
            foreach ($this->sale_other as $key => $value) {
                if ($value->id == $this->sale->id) {
                    unset($this->sale_other[$key]);
                    break;
                }
            }

            parent::__construct($code, $name, $this->sale->full);

            if ($url->lvl2 == "prodazha") {
                $breadcrumb_type = new Breadcrumb("/promotions/prodazha", "Акции по продаже");
            } else {
                $breadcrumb_type = new Breadcrumb("/promotions/arenda", "Акции по аренде");
            }

            $this->breadcrumbs = [
                new Breadcrumb("/", "Главная"),
                new Breadcrumb("/promotions", "Акции"),
                $breadcrumb_type,
                new Breadcrumb($this->sale->url, $this->sale->preview)
            ];
        }

        /**
         * @return SaleDetailPage
         * @throws Exception
         */
        public static function code200(): SaleDetailPage
        {
            return new SaleDetailPage(200, "promotion");
        }
    }

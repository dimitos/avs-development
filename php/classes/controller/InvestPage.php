<?

    /**
     * Класс данных для страницы инвесторы
     */
    class InvestPage extends Page
    {

        public array $invest = [];

        /**
         * @param int $code
         * @param string $name
         * @throws Exception
         */
        public function __construct(int $code, string $name)
        {
            parent::__construct($code, $name, "Инвесторам");

            $invest_all = Invest::get_all([], false, ["ID_AV_INVEST_TYPE", "ID_AV_INVEST"]);
            foreach ($invest_all as $invest_one) {
                if (!isset($this->invest[$invest_one->type->full])) {
                    $this->invest[$invest_one->type->full] = [
                        "full" => $invest_one->type->full,
                        "sale_text" => $invest_one->type->sale_text,
                        "invest" => []
                    ];
                }
                array_push($this->invest[$invest_one->type->full]["invest"], $invest_one);
            }

            $this->breadcrumbs = [
                new Breadcrumb("/", "Главная"),
                new Breadcrumb("/investors", "Инвесторам")
            ];
        }

        /**
         * @return InvestPage
         * @throws Exception
         */
        public static function code200(): InvestPage
        {
            return new InvestPage(200, "investors");
        }
    }

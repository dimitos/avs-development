<?

    /**
     * Класс данных для страницы объектов
     */
    class HomePage extends Page
    {

        /**
         * @var Sale[]
         */
        public array $sale = [];

        /**
         * @var ObjectA[]
         */
        public array $objects_with_badge_prodazha = [];

        /**
         * @var ObjectA[]
         */
        public array $objects_with_badge_arenda = [];

        /**
         * @var Promo[]
         */
        public array $promo = [];

        /**
         * @param int $code
         * @param string $name
         * @throws Exception
         */
        public function __construct(int $code, string $name)
        {
            parent::__construct($code, $name, "Главная");

            $this->sale = Sale::get_by_limit(16);

            $arenda_filter = new ObjectFilter();
            $arenda_filter->is_arenda = false;
            $arenda_filter->have_badge = true;
            $this->objects_with_badge_prodazha = ObjectA::get_all([$arenda_filter]);

            $arenda_filter->is_arenda = true;
            $this->objects_with_badge_arenda = ObjectA::get_all([$arenda_filter]);

            $this->promo = Promo::get_all();
        }

        /**
         * @return Page
         * @throws Exception
         */
        public static function code200(): Page
        {
            return new HomePage(200, "home");
        }
    }

<?

    /**
     * Класс данных для страницы
     */
    class Page
    {
        public int $code;
        public string $name;
        public string $scripts;
        public string $styles;
        public string $view;

        /**
         * @var ObjectType[]
         */
        public array $types = [];
        public array $types_count_prodazha = [];
        public array $types_count_arenda = [];
        /**
         * @var Breadcrumb[]
         */
        public array $breadcrumbs;

        /**
         * @var Sale|null
         */
        public ?Sale $sale_menu = null;

        /**
         * @param int $code
         * @param string $eng
         * @param string $title
         * @throws Exception
         */
        public function __construct(int $code, string $eng, string $title)
        {
            $this->types = ObjectType::get_all();
            $query_otc = "SELECT aot.ID_AV_OBJECT_TYPE, SUM(CASE WHEN acoa.AV_OBJECT_IS_ARENDA = 'Нет' THEN 1 ELSE 0 END) AS AV_OBJECT_TYPE_COUNT_SELL, SUM(CASE WHEN acoa.AV_OBJECT_IS_ARENDA = 'Да' THEN 1 ELSE 0 END) AS AV_OBJECT_TYPE_COUNT_RENT FROM AV_OBJECT_TYPE aot LEFT JOIN AA_CACHE_OBJECT_ACTIVE acoa ON acoa.ID_AV_OBJECT_TYPE = aot.ID_AV_OBJECT_TYPE GROUP BY aot.ID_AV_OBJECT_TYPE";
            $res_otc = db_query($query_otc);
            while ($row_otc = db_fetch_assoc($res_otc)) {
                $this->types_count_prodazha[$row_otc["ID_AV_OBJECT_TYPE"]] = $row_otc["AV_OBJECT_TYPE_COUNT_SELL"];
                $this->types_count_arenda[$row_otc["ID_AV_OBJECT_TYPE"]] = $row_otc["AV_OBJECT_TYPE_COUNT_RENT"];
            }

            $sale_filter = new SaleFilter();
            $sale_filter->is_menu = true;
            $this->sale_menu = Sale::get_random([$sale_filter]);

            $this->name = $eng;
            $this->code = $code;
            $this->scripts = external_scripts(actual_bundle_path("dist/js", $eng));
            $this->styles = styles_by_mode($eng);
            $this->view = "pages/$eng.tpl";
        }

        /**
         * @return Page
         * @throws Exception
         */
        public static function code404(): Page
        {
            return new Page(404, "404", "Страница не найдена");
        }

        /**
         * @return Page
         * @throws Exception
         */
        public static function code415(): Page
        {
            return new Page(415, "415", "Ошибка");
        }
    }

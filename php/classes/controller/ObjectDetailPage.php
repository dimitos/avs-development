<?

    /**
     * Класс данных для детальной страницы объекта
     */
    class ObjectDetailPage extends Page
    {

        /**
         * @var ObjectA
         */
        public ObjectA $object;

        /**
         * @var ObjectA[]
         */
        public array $objects = [];

        /**
         * @param int $code
         * @param string $name
         * @throws Exception
         */
        public function __construct(int $code, string $name)
        {
            parent::__construct($code, $name, "Акции");

            $url = get_url_lvls();
            $this->object = ObjectA::get_by_eng($url->lvl4);

            $object_filter = new ObjectFilter();
            $object_filter->type = $this->object->sub_type->type->eng;
            $object_filter->is_arenda = $this->object->is_arenda;
            $this->objects = ObjectA::get_all([$object_filter]);

            $this->breadcrumbs = [
                new Breadcrumb("/", "Главная"),
                new Breadcrumb("/nedvizhimost", "Объекты недвижимости")
            ];
            if ($url->lvl2 == "arenda") {
                array_push($this->breadcrumbs, new Breadcrumb("/nedvizhimost/arenda", "Аренда"));
            } elseif ($url->lvl2 == "prodazha") {
                array_push($this->breadcrumbs, new Breadcrumb("/nedvizhimost/prodazha", "Продажа"));
            }
            $type = ObjectType::get_by_eng($url->lvl3);
            array_push($this->breadcrumbs, new Breadcrumb("/nedvizhimost/{$url->lvl2}/{$url->lvl3}", $type->full));
            array_push($this->breadcrumbs, new Breadcrumb("/nedvizhimost/{$url->lvl2}/{$url->lvl3}/{$this->object->eng}", $this->object->full));
        }

        /**
         * @return ObjectDetailPage
         * @throws Exception
         */
        public static function code200(): ObjectDetailPage
        {
            return new ObjectDetailPage(200, "object");
        }
    }

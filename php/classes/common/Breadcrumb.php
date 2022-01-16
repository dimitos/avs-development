<?
    /**
     * Класс данных для хлебной крошки
     */
    class Breadcrumb
    {
        public string $url;
        public string $title;

        /**
         * Breadcrumb constructor
         * @param string $url
         * @param string $title
         */
        public function __construct(string $url, string $title)
        {
            $this->url = $url;
            $this->title = $title;
        }

    }

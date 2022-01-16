<?
    /**
     * Класс данных для метатегов
     */
    class Meta
    {
        public $title = "AVS Девелопмент";
        public $description = "AVS Девелопмент";
        public $keywords = "AVS Девелопмент";
        public $image = "/img/og-image.png";
        public $url;

        /**
         * Meta constructor
         */
        public function __construct()
        {
            $this->url = get_current_url(false);
        }

    }

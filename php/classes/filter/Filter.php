<?

    /**
     * Class Filter
     */
    abstract class Filter
    {
        /**
         * Получает условия AND для where части запроса
         * @return string
         */
        abstract function get_where(): string;

        /**
         * Получает фильтр на основе get параметров
         * @return mixed
         */
        abstract static function get_by_get();
    }

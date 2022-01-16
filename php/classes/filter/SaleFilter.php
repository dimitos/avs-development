<?

    /**
     * Класс для фильтрации объектов
     */
    class SaleFilter extends Filter
    {
        public ?bool $is_arenda = null;

        public ?bool $is_menu = null;

        /**
         * Получает условия AND для where части запроса
         * @return string
         * @throws Exception
         */
        function get_where(): string
        {
            $query = "";

            // Фильтр аренды/продажи
            if ($this->is_arenda !== null) {
                $is_arenda = bool_to_db($this->is_arenda);
                $query .= " AND (AV_SALE_IS_ARENDA = '$is_arenda')";
            }

            // Фильтр "в меню"
            if ($this->is_menu !== null) {
                $is_menu = bool_to_db($this->is_menu);
                $query .= " AND (AV_SALE_IS_MENU = '$is_menu')";
            }

            return $query;
        }

        /**
         * Получает фильтр на основе get параметров
         * @return mixed
         * @throws Exception
         */
        static function get_by_get(): SaleFilter
        {
            $sale_filter = new SaleFilter();

            $url = get_url_lvls();
            if (($url->lvl2 == "prodazha") || (isset($_GET["form"]) && ($_GET["form"] == "prodazha"))) {
                $sale_filter->is_arenda = false;
            } elseif (($url->lvl2 == "arenda") || (isset($_GET["form"]) && ($_GET["form"] == "arenda"))) {
                $sale_filter->is_arenda = true;
            }

            return $sale_filter;
        }
    }

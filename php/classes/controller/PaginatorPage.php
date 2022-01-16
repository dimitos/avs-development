<?

    /**
     * Класс данных для страницы с пагинацией
     */
    abstract class PaginatorPage extends Page
    {

        public int $count = 0;
        public int $limit = 12;
        public int $page_num = 1;
        public int $total_pages = 1;
        public string $query_without_page = "";
        public string $query_without_page_sort = "";

        public function fill_paginator(int $count, int $limit)
        {
            $this->limit = $limit;
            $this->count = $count;
            if (isset($_GET) && isset($_GET["page"])) {
                $this->page_num = intval($_GET["page"]);
            }
            $this->total_pages = ceil($this->count / $this->limit);
            if ($this->page_num > $this->total_pages) {
                $this->page_num = $this->total_pages;
            }
            $this->query_without_page = remove_query_param(get_current_url(), "page");
            $this->query_without_page_sort = remove_query_param($this->query_without_page, "sort");
        }
    }

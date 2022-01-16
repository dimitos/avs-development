<?

    abstract class AbstractTableNoCache extends AbstractTable
    {
        /**
         * Название (желательно кешированной) таблицы с минимальными актуальными данными
         * @return string
         */
        static function get_minimized_table_cache_name(): string
        {
            return static::get_table_name();
        }

        /**
         * Название (желательно кешированной) таблицы с расширенными данными
         * @return string
         */
        static function get_extended_table_cache_name(): string
        {
            return static::get_table_name();
        }
    }
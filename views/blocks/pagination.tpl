{if $page->total_pages > 1}
<div class="pagination-block">
    <div class="pagination__txt no-wrap">Всего <span class="pagination__cnt-pages">{$page->total_pages}</span> страниц</div>
    <div class="pagination">
        {* КНОПКА НАЗАД *}
        {if ($page->page_num == 1)}
        <span class="pagination__btn pagination__btn-prev">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M16 4L8 12L16 20"  stroke-width="1.5"/>
            </svg>
        </span>
        {else}
        <a class="pagination__btn pagination__btn-prev" href="{$page->query_without_page}">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M16 4L8 12L16 20"  stroke-width="1.5"/>
            </svg>
        </a>
        {/if}

        {* ПАГИНАЦИЯ *}
        {if strpos($page->query_without_page, "?") === false}
            {$url_page_amp = "?"}
        {else}
            {$url_page_amp = "&"}
        {/if}
        {$page_start = $page->page_num - 11}
        {$page_end = $page->page_num + 11}
        {if ($page_start < 1)}{$page_start = 1}{/if}
        {if ($page_end > $page->total_pages)}{$page_end = $page->total_pages}{/if}
        {$counter = 1}
        {while (($page_end - $page_start) > 11)}
            {if (($counter % 2) == 1)}
                {$page_start = $page_start + 1}
            {else}
                {$page_end = $page_end - 1}
            {/if}
            {$counter = $counter + 1}
        {/while}

        {for $i = $page_start to $page_end}
            {$class = ""}
            {$tag = "a"}
            {if ($i == $page->page_num)}
                {$class = "active"}
                {$tag = "span"}
            {/if}
        <{$tag} class="pagination__item {$class}" href="{$page->query_without_page}{if ($i != 1)}{$url_page_amp}page={$i}{/if}">{$i}</{$tag}>
        {/for}

        {* КНОПКА ВПЕРЕД *}
        {if ($page->page_num == $page->total_pages)}
            <span class="pagination__btn pagination__btn-next">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8 4L16 12L8 20"  stroke-width="1.5"/>
                </svg>
            </span>
        {else}
            <a class="pagination__btn pagination__btn-next" href="{$page->query_without_page}{$url_page_amp}page={$page->total_pages}">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8 4L16 12L8 20"  stroke-width="1.5"/>
                </svg>
            </a>
        {/if}
    </div>
</div>
{/if}

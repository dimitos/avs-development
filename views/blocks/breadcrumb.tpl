{if ($page->breadcrumbs)}
<div class="breadcrumb">
    <ul class="breadcrumb__list">
        {foreach $page->breadcrumbs as $breadcrumb}
            {if $breadcrumb@iteration != $breadcrumb@last}
                <li class="breadcrumb__item"><a class="breadcrumb__link" href="{$breadcrumb->url}">{$breadcrumb->title}</a></li>
            {else}
                <li class="breadcrumb__item"><p class="breadcrumb__text">{$breadcrumb->title}</p></li>
            {/if}
        {/foreach}
    </ul>
</div>
{/if}

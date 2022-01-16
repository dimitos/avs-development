{$sale = $page->sale}
<section class="promotion">
    <div class="container promotion__container">
        {include "blocks/breadcrumb.tpl"}
        <a href="/promotions" class="back-page">
            <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M15.9998 21.0002C15.7438 21.0002 15.4877 20.9023 15.2928 20.7073L7.29275 12.7072C6.90175 12.3162 6.90175 11.6843 7.29275 11.2933L15.2928 3.29325C15.6838 2.90225 16.3158 2.90225 16.7068 3.29325C17.0978 3.68425 17.0978 4.31625 16.7068 4.70725L9.41375 12.0002L16.7068 19.2932C17.0978 19.6842 17.0978 20.3163 16.7068 20.7073C16.5118 20.9023 16.2558 21.0002 15.9998 21.0002"/>
            </svg>
            <span>Назад</span>
        </a>
        <div class="promotion__wrapper">
            <h1 class="title title-2 promotion__title">{$sale->full}</h1>
            {if $sale->photo_detail}
            <div class="promotion__banner">
                <picture>
                    <img class="image cover"
                        src="{$sale->photo_detail}"
                        alt="{$sale->full}"
                        width="285"
                        height="190"
                        loading="lazy"
                        decoding="async" />
                </picture>
            </div>
            {/if}
            <div class="list__item-trig-wr">
                {if $sale->is_arenda}
                    <div class="list__item-trig" data-list="list-arenda">Акция по аренде</div>
                {else}
                    <div class="list__item-trig" data-list="list-prodazha">Акция по продаже</div>
                {/if}
            </div>
        </div>
    </div>
</section>

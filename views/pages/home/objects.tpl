<section class="objects">
    <div class="container objects__container">
        <h2 class="title title-2 objects__title">Наши объекты</h2>
        <div class="objects__block active-tab-1">
            <div class="objects__tab-nav">
                <div class="objects__tab-nav-wrapper">
                    <div class="objects__tab-nav-item objects__tab-nav-item-1">
                        <button class="btn btn-default btn-transparent-main1" type="button">
                            <span class="btn__arrow-long"></span>
                            <span class="btn__text">ПРОДАЖА</span>
                        </button>
                    </div>
                    <div class="objects__tab-nav-item objects__tab-nav-item-2">
                        <button class="btn btn-default btn-transparent-main1" type="button">
                            <span class="btn__arrow-long"></span>
                            <span class="btn__text">АРЕНДА</span>
                        </button>
                    </div>
                </div>
                {*<div class="objects-map__link">
                    <button class="link objects-map__link-item" data-modal="map-radar" type="button">Показать на карте</button>
                </div>*}
            </div>
            <div class="objects__tab objects__tab-1">
                <div class="objects__wrapper">
                    {foreach $page->types as $type}
                        {if ($page->types_count_prodazha[$type->id] > 0)}
                        <a class="objects__item" href="/nedvizhimost/prodazha/{$type->eng}">
                            <span class="objects__item-wr">
                                <span class="objects__item-title">{$type->full}</span>
                                <span class="section-text"></span>
                                <span class="objects__item-link">{$page->types_count_prodazha[$type->id]} объектов</span>
                            </span>
                        </a>
                        {/if}
                    {/foreach}
                    {*<div class="objects__item">
                        <div class="objects__item-wr">
                            <h4 class="objects__item-title">Коттеджи, таунхаусы</h4>
                            <p class="section-text"></p>
                            <button class="objects__item-link" data-modal="transition" type="button">20 объектов</button>
                        </div>
                    </div>*}
                    <div class="objects__item objects__item-banner">
                        <div class="objects__item-wr">
                            <button class="objects__item-title-mob" type="button" data-modal="request">Оставить заявку</button>
                            <h4 class="objects__item-title-big">Не нашли то, что искали?</h4>
                            <p class="section-text">Оставьте заявку, мы перезвоним</p>
                            <button class="btn btn-default btn-main2-main2" type="button" data-modal="request">
                                <span class="btn__text">оставить заявку</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="objects__tab objects__tab-2">
                <div class="objects__wrapper">
                    {foreach $page->types as $type}
                        {if ($page->types_count_arenda[$type->id] > 0)}
                            <a class="objects__item" href="/nedvizhimost/arenda/{$type->eng}">
                                <span class="objects__item-wr">
                                    <span class="objects__item-title">{$type->full}</span>
                                    <span class="section-text"></span>
                                    <span class="objects__item-link">{$page->types_count_arenda[$type->id]} объектов</span>
                                </span>
                            </a>
                        {/if}
                    {/foreach}
                </div>
                <div class="objects__search objects__search-open">
                    <div class="objects__search-closer">
                        Фильтр по аренде
                    </div>
                    {include "blocks/search.tpl"}
                </div>
            </div>
        </div>
    </div>
</section>

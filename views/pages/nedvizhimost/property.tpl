<section class="property">
    <div class="container property__container">
        <div class="property__header-wr">
            <h2 class="title title-2 property__title">{if ($url->lvl2 == "arenda")}Аренда недвижимости{else}Продажа недвижимости{/if} - результаты поиска</h2>
            <p class="property__header-txt">{$page->count} объекта</p>
        </div>
        {*<div class="swiper filter-choice__slider">
            <div class="swiper-wrapper">
                <a class="swiper-slide filter-choice__reset" href="">Сбросить фильтр</a>
                <div class="swiper-slide">от 1 000 000 до 1 000 000<i data-link=""></i></div>
                <div class="swiper-slide">Арендовать<i data-link=""></i></div>
                <div class="swiper-slide">Складские и производственные помещения<i data-link=""></i></div>
                <div class="swiper-slide">Загородная недвижимость<i data-link=""></i></div>
            </div>
        </div>*}
        <div class="inner-sorter">
            <div class="inner-sorter__icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M19.7905 18.6128L19.7073 18.707L16.7072 21.707C16.6802 21.734 16.6517 21.7595 16.6217 21.7833L16.5005 21.866L16.4272 21.9044L16.3401 21.9406L16.2337 21.9725L16.1167 21.9932L16.0331 21.9993L15.9411 21.9982L15.8253 21.9846L15.688 21.9501L15.5769 21.9062L15.4794 21.8539L15.3833 21.7871L15.293 21.707L12.2929 18.707C11.9024 18.3165 11.9024 17.6833 12.2929 17.2928C12.6534 16.9323 13.2206 16.9046 13.6129 17.2096L13.7072 17.2928L15 18.5849L15.0001 8.99989C15.0001 8.48705 15.3861 8.06438 15.8835 8.00661L16.0001 7.99989C16.5524 7.99989 17.0001 8.4476 17.0001 8.99989L17 18.5849L18.2931 17.2928C18.6535 16.9323 19.2208 16.9046 19.6131 17.2096L19.7073 17.2928C20.0378 17.6232 20.0886 18.1274 19.8598 18.5113L19.7905 18.6128ZM4.2929 5.29262L7.29297 2.29262L7.40492 2.19605L7.5158 2.12461L7.62902 2.07084L7.73424 2.03545L7.8253 2.01503L7.94107 2.00146L8.05925 2.00147L8.17476 2.015L8.31285 2.0496L8.36681 2.06912L8.45396 2.10839L8.52079 2.1458L8.60181 2.20086L8.66558 2.25328L8.70724 2.29262L11.7073 5.29262L11.7905 5.38683C12.0701 5.74643 12.0701 6.25303 11.7905 6.61263L11.7073 6.70684L11.6131 6.79003C11.2535 7.06963 10.7469 7.06963 10.3873 6.79003L10.2931 6.70684L9 5.41473L9.00013 14.9997C9.00013 15.5126 8.61409 15.9352 8.11675 15.993L8.00013 15.9997L7.88346 15.993C7.42437 15.9397 7.06013 15.5754 7.00681 15.1164L7.00008 14.9997L7 5.41473L5.70715 6.70684L5.61294 6.79003C5.22064 7.09505 4.65339 7.06732 4.2929 6.70684C3.93241 6.34635 3.90468 5.77912 4.20971 5.38683L4.2929 5.29262Z" fill="#17722C"/>
                </svg>
            </div>
            <div class="sort sort-mobile">
                <span class="inner-sorter__title">Сортировать по:</span>
                {if strpos($page->query_without_page_sort, "?") === false}
                    {$url_page_amp = "?"}
                {else}
                    {$url_page_amp = "&"}
                {/if}
                <a href="{$page->query_without_page_sort}{$url_page_amp}sort=cost_min" class="sort__item {if (!isset($smarty.get.sort) || ($smarty.get.sort == "cost_min"))}sort-select{/if}"><span>Min цена</span></a>
                <a href="{$page->query_without_page_sort}{$url_page_amp}sort=cost_max" class="sort__item {if (isset($smarty.get.sort) && ($smarty.get.sort == "cost_max"))}sort-select{/if}"><span>Max цена</span></a>
                <a href="{$page->query_without_page_sort}{$url_page_amp}sort=area_min" class="sort__item {if (isset($smarty.get.sort) && ($smarty.get.sort == "area_min"))}sort-select{/if}"><span>Min площадь</span></a>
                <a href="{$page->query_without_page_sort}{$url_page_amp}sort=area_max" class="sort__item {if (isset($smarty.get.sort) && ($smarty.get.sort == "area_max"))}sort-select{/if}"><span>Max площадь</span></a>
            </div>
            <div class="sort-list">
                <div class="sort-list__item sort-tab-list">
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19 13C20.6569 13 22 14.3431 22 16V19C22 20.6569 20.6569 22 19 22H5C3.34315 22 2 20.6569 2 19V16C2 14.3431 3.34315 13 5 13H19ZM19 15H5C4.44772 15 4 15.4477 4 16V19C4 19.5523 4.44772 20 5 20H19C19.5523 20 20 19.5523 20 19V16C20 15.4477 19.5523 15 19 15ZM19 2C20.6569 2 22 3.34315 22 5V8C22 9.65685 20.6569 11 19 11H5C3.34315 11 2 9.65685 2 8V5C2 3.34315 3.34315 2 5 2H19ZM19 4H5C4.44772 4 4 4.44772 4 5V8C4 8.55228 4.44772 9 5 9H19C19.5523 9 20 8.55228 20 8V5C20 4.44772 19.5523 4 19 4Z"/>
                    </svg>
                </div>
                <div class="sort-list__item sort-tab-pane active">
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19 13C20.6569 13 22 14.3431 22 16V19C22 20.6569 20.6569 22 19 22H16C14.3431 22 13 20.6569 13 19V16C13 14.3431 14.3431 13 16 13H19ZM8 13C9.65685 13 11 14.3431 11 16V19C11 20.6569 9.65685 22 8 22H5C3.34315 22 2 20.6569 2 19V16C2 14.3431 3.34315 13 5 13H8ZM19 15H16C15.4477 15 15 15.4477 15 16V19C15 19.5523 15.4477 20 16 20H19C19.5523 20 20 19.5523 20 19V16C20 15.4477 19.5523 15 19 15ZM8 15H5C4.44772 15 4 15.4477 4 16V19C4 19.5523 4.44772 20 5 20H8C8.55228 20 9 19.5523 9 19V16C9 15.4477 8.55228 15 8 15ZM8 2C9.65685 2 11 3.34315 11 5V8C11 9.65685 9.65685 11 8 11H5C3.34315 11 2 9.65685 2 8V5C2 3.34315 3.34315 2 5 2H8ZM19 2C20.6569 2 22 3.34315 22 5V8C22 9.65685 20.6569 11 19 11H16C14.3431 11 13 9.65685 13 8V5C13 3.34315 14.3431 2 16 2H19ZM8 4H5C4.44772 4 4 4.44772 4 5V8C4 8.55228 4.44772 9 5 9H8C8.55228 9 9 8.55228 9 8V5C9 4.44772 8.55228 4 8 4ZM19 4H16C15.4477 4 15 4.44772 15 5V8C15 8.55228 15.4477 9 16 9H19C19.5523 9 20 8.55228 20 8V5C20 4.44772 19.5523 4 19 4Z"/>
                    </svg>
                </div>
            </div>
        </div>
        <div class="list">
            {if !$page->objects}
                <div class="list__empty">Не найдено объектов по указанным критериям. Выберите другие фильтры.</div>
            {/if}
            {foreach $page->objects as $object}
            <div class="list__item">
                <div class="list__item-wr">
                    <a class="object-list__item-img" href="{$object->url}">
                        <picture>
                            <img class="image cover" src="{$object->photos[0]}" alt="{$object->full}" width="277" height="190" loading="lazy" decoding="async">
                        </picture>
                        {if ($object->badge && $object->badge->full)}
                        <span class="list__item-img-flag">{$object->badge->full}</span>
                        {/if}
                    </a>
                    <div class="list-content">
                        <div class="list__item-title">
                        <h4 class="title title-4">{$object->full}</h4>
                    </div>
                    <div class="list__item-data">
                        <p class="list__item-data-item">{$object->sub_type->full}</p>
                        {if $object->area_full}
                        <p class="list__item-data-item">{$object->area_full_display}</p>
                        {/if}
                        {if $object->area_land}
                        <p class="list__item-data-item">участок {$object->area_land_display}</p>
                        {/if}
                    </div>
                    <p class="list__item-description">{$object->address}</p>
                    <div class="list__item-price">
                        <p class="list__item-real-price no-wrap">{$object->cost_display}</p>
                    </div>
                    <a class="btn btn-default btn-main1-main1" href="{$object->url}"><span class="btn__text">Подробнее</span></a>
                    </div>
                </div>
            </div>
            {if (($object@iteration == 3) || ($object@iteration == 11) || (count($page->objects) < 3))}
            {if ($object@iteration == 3) || (count($page->objects) < 3)}
                {$sale = $page->sale[0]}
            {else}
                {$sale = $page->sale[1]}
            {/if}
            <div class="list__item list__item-promotion">
                <div class="list__item-wr">
                    <a class="list__item-img" href="{$sale->url}">
                        <picture>
                            <img class="image cover" src="{$sale->photo_preview}" alt="{$sale->full}" width="285" height="190" loading="lazy" decoding="async">
                        </picture>
                    </a>
                    <div class="list-content">
                        <div class="list__item-title" style="height: 95px;">
                            <h4 class="title-4">{$sale->full}</h4>
                        </div>
                        <div class="list__item-trig-wr">
                            {if $sale->is_arenda}
                                <div class="list__item-trig" data-list="list-arenda">Акция по аренде</div>
                            {else}
                                <div class="list__item-trig" data-list="list-prodazha">Акция по продаже</div>
                            {/if}
                        </div>
                        <div class="list__item-date">
                            <p class="section-text">Действует c <span>{$sale->date_start_display}</span></p>
                            {if $sale->date_end}
                                <p class="section-text">до <span>{$sale->date_end_display}</span></p>
                            {/if}
                        </div>
                        <a class="btn btn-default btn-main2-main2" href="{$sale->url}">
                            <span class="btn__text">Подробнее</span>
                        </a>
                    </div>
                </div>
            </div>
            {/if}
            {/foreach}
            {*<div class="list__item">
                <div class="list__item-wr">
                    <div class="object-list__item-img">
                        <picture>
                            <source srcset="/img/objects/object_06-420.webp" media="(max-width: 420px)" type="image/webp">
                            <source srcset="/img/objects/object_06-767.webp" media="(max-width: 767px)" type="image/webp">
                            <source srcset="/img/objects/object_06-1240.webp" type="image/webp">
                            <source srcset="/img/objects/object_06-420.jpg" media="(max-width: 420px)">
                            <source srcset="/img/objects/object_06-767.jpg" media="(max-width: 767px)">
                            <img class="image cover" src="/img/objects/object_06-1240.jpg" alt="Продажа. Строящийся складской комплекс, ЕКАД" width="277" height="190" loading="lazy" decoding="async">
                        </picture>
                    </div>
                    <div class="list-content">
                        <div class="list__item-title">
                            <h4 class="title title-4">Строящийся складской комплекс, ЕКАД</h4>
                        </div>
                        <div class="list__item-data">
                            <p class="list__item-data-item">Склад</p>
                            <p class="list__item-data-item">1000 м²</p>
                        </div>
                        <p class="list__item-description">
                            Адрес: Березовский, земельный комплекс «Александровский»
                        </p>
                        <div class="list__item-price">
                            <p class="list__item-old-price no-wrap"><span class="capacity">42000000</span> <span class="measure">₽</span></p>
                            <p class="list__item-real-price no-wrap"><span class="capacity">37000000</span> <span class="measure">₽</span></p>
                        </div>
                        <a class="btn btn-default btn-main1-main1" href="object"><span class="btn__text">Подробнее</span></a>
                    </div>
                </div>
            </div>
            <div class="list__item list__item-promotion">
                <div class="list__item-wr">
                    <div class="list__item-img">
                        <picture>
                            <source srcset="/img/promotion/promo_02-420.webp" media="(max-width: 420px)" type="image/webp">
                            <source srcset="/img/promotion/promo_02-767.webp" media="(max-width: 767px)" type="image/webp">
                            <source srcset="/img/promotion/promo_02-1239.webp" media="(max-width: 1239px)" type="image/webp">
                            <source srcset="/img/promotion/promo_02-1920.webp" type="image/webp">
                            <source srcset="/img/promotion/promo_02-420.jpg" media="(max-width: 420px)">
                            <source srcset="/img/promotion/promo_02-767.jpg" media="(max-width: 767px)">
                            <source srcset="/img/promotion/promo_02-1239.jpg" media="(max-width: 1239px)">
                            <img class="image cover" src="/img/promotion/promo_02-1920.jpg" alt="Акция. Акция для новых арендаторов офисных помещений на Уралмаше!" width="285" height="190" loading="lazy" decoding="async">
                        </picture>
                    </div>
                    <div class="list-content">
                        <div class="list__item-title" style="height: 95px;">
                            <h4 class="title-4">Акция для новых арендаторов офисных помещений на Уралмаше!</h4>
                        </div>
                        <div class="list__item-trig-wr">
                            <div class="list__item-trig" data-list="list-arenda">Акция по аренде</div>
                        </div>
                        <div class="list__item-date">
                            <p class="section-text">Действует до <span>31.12.2021</span></p>
                        </div>
                        <a class="btn btn-default btn-main2-main2" href="promotion">
                            <span class="btn__text">Подробнее</span>
                        </a>
                    </div>
                </div>
            </div>*}
        </div>
        {include "blocks/pagination.tpl"}
    </div>
</section>

<section class="sl-prodazha">
    <div class="container sl-prodazha__container">
        <h2 class="title title-2 sl__title">Похожие объявления</h2>
        <div class="slider-wr sl-slider sl-prodazha-slider">
            <div class="swiper sl-swiper sl-prodazha__swiper">
                <div class="swiper-wrapper">
                    {foreach $page->objects as $object}
                        <div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <a class="sl-swiper-slide__img" href="{$object->url}">
                                    <picture>
                                        <img class="image cover"
                                             src="{$object->photos[0]}"
                                             alt="{$object->full}"
                                             width="277"
                                             height="190"
                                             loading="lazy"
                                             decoding="async" />
                                    </picture>
                                    {if ($object->badge && $object->badge->full)}
                                    <div class="sl-swiper-slide__img-flag">{$object->badge->full}</div>
                                    {/if}
                                </a>
                                <div class="sl-swiper-slide__title">
                                    <h4 class="title title-4 sl__title">{$object->full}</h4>
                                </div>
                                <div class="sl-swiper-slide__data">
                                    <p class="sl-swiper-slide__data-item">{$object->sub_type->full}</p>
                                    {if $object->area_full}
                                        <p class="sl-swiper-slide__data-item">{$object->area_full_display}</p>
                                    {/if}
                                    {if $object->area_land}
                                        <p class="sl-swiper-slide__data-item">участок {$object->area_land_display}</p>
                                    {/if}
                                </div>
                                <p class="sl-swiper-slide__description">{$object->address}</p>
                                <div class="sl-swiper-slide__price">
                                    <p class="sl-swiper-slide__real-price no-wrap">{$object->cost_display}</p>
                                </div>
                                <a class="btn btn-default btn-main1-main1" href="{$object->url}"><span class="btn__text">Подробнее</span></a>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
            <div class="slider-nav">
                <button class="slider-btn__prev slider-btn__circle-white" type="button"></button>
                <button class="slider-btn__next slider-btn__circle-white" type="button"></button>
            </div>
        </div>
    </div>
</section>

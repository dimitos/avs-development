<section class="sl-prodazha" id="sl-prodazha">
    <div class="container sl-prodazha__container">
        <h2 class="title title-2 sl__title">Спецпредложения по <span class="color-main">ПРОДАЖЕ</span></h2>
        <div class="slider-wr sl-slider sl-prodazha-slider">
            <div class="swiper sl-swiper sl-prodazha__swiper">
                <div class="swiper-wrapper">
                    {foreach $page->objects_with_badge_prodazha as $object}
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
                                <div class="sl-swiper-slide__img-flag">{$object->badge->full}</div>
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
                    {*<div class="swiper-slide">
                        <div class="swiper-slide__wr">
                            <div class="sl-swiper-slide__img">
                                <picture>
                                    <source srcset="/img/objects/object_06-420.webp" media="(max-width: 420px)" type="image/webp" />
                                    <source srcset="/img/objects/object_06-767.webp" media="(max-width: 767px)" type="image/webp" />
                                    <source srcset="/img/objects/object_06-1240.webp" media="(max-width: 1240px)" type="image/webp" />
                                    <source srcset="/img/objects/object_06-420.jpg" media="(max-width: 420px)" />
                                    <source srcset="/img/objects/object_06-767.jpg" media="(max-width: 767px)" />
                                    <source srcset="/img/objects/object_06-1240.jpg" media="(max-width: 1240px)" />
                                    <img class="image cover"
                                        src="/img/objects/object_06-1240.jpg"
                                        alt="Продажа. Строящийся складской комплекс, ЕКАД"
                                        width="277"
                                        height="190"
                                        loading="lazy"
                                        decoding="async" />
                                </picture>
                            </div>
                            <div class="sl-swiper-slide__title">
                                <h4 class="title title-4 sl__title">Строящийся складской комплекс, ЕКАД</h4>
                            </div>
                            <div class="sl-swiper-slide__data">
                                <p class="sl-swiper-slide__data-item">Склад</p>
                                <p class="sl-swiper-slide__data-item">1000 м²</p>
                            </div>
                            <p class="sl-swiper-slide__description">
                                Адрес: Березовский, земельный комплекс «Александровский»
                            </p>
                            <div class="sl-swiper-slide__price">
                                <p class="sl-swiper-slide__old-price no-wrap"><span class="capacity">45000000</span> <span class="measure">₽</span></p>
                                <p class="sl-swiper-slide__real-price no-wrap"><span class="capacity">42000000</span> <span class="measure">₽</span></p>
                            </div>
                            <a class="btn btn-default btn-main1-main1" href="object"><span class="btn__text">Подробнее</span></a>
                        </div>
                    </div>*}
                </div>
            </div>
            <div class="slider-nav">
                <button class="slider-btn__prev slider-btn__circle-white" type="button"></button>
                <button class="slider-btn__next slider-btn__circle-white" type="button"></button>
            </div>
        </div>
        <div class="btn-wrap">
            <a class="btn btn-default sl-btn btn-transparent-main2" href="/nedvizhimost/prodazha">
                <span class="btn__text">все предложения по продаже</span>
                <span class="btn__arrow btn__arrow-right"></span>
            </a>
        </div>
    </div>
</section>

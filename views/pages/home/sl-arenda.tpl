<section class="sl-arenda" id="sl-arenda">
    <div class="container sl-arenda__container">
        <h2 class="title title-2 sl__title">Спецпредложения по <span class="color-main">АРЕНДЕ</span></h2>
        <div class="slider-wr sl-slider sl-arenda-slider">
            <div class="swiper sl-swiper sl-arenda__swiper">
                <div class="swiper-wrapper">
                    {foreach $page->objects_with_badge_rent as $object}
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
                                {*<p class="sl-swiper-slide__old-price no-wrap"><span class="capacity">14000</span> <span class="measure">₽/мес</span></p>*}
                                <p class="sl-swiper-slide__real-price no-wrap">{$object->cost_display}/мес</p>
                            </div>
                            <a class="btn btn-default btn-main1-main1" href="{$object->url}"><span class="btn__text">Подробнее</span></a>
                        </div>
                    </div>
                    {/foreach}
                    {*<div class="swiper-slide">
                        <div class="swiper-slide__wr">
                            <div class="sl-swiper-slide__img">
                                <picture>
                                    <source srcset="/img/objects/object_02-420.webp" media="(max-width: 420px)" type="image/webp" />
                                    <source srcset="/img/objects/object_02-767.webp" media="(max-width: 767px)" type="image/webp" />
                                    <source srcset="/img/objects/object_02-1240.webp" media="(max-width: 1240px)" type="image/webp" />
                                    <source srcset="/img/objects/object_02-420.jpg" media="(max-width: 420px)" />
                                    <source srcset="/img/objects/object_02-767.jpg" media="(max-width: 767px)" />
                                    <source srcset="/img/objects/object_02-1240.jpg" media="(max-width: 1240px)" />
                                    <img class="image cover"
                                        src="/img/objects/object_02-1240.jpg"
                                        alt="Аренда. Открытая площадка – земельный комплекс «Александровский». Выгодное расположение."
                                        width="277"
                                        height="190"
                                        loading="lazy"
                                        decoding="async" />
                                </picture>
                            </div>
                            <div class="sl-swiper-slide__title">
                                <h4 class="title title-4 sl__title">Открытая площадка – земельный комплекс «Александровский». Выгодное расположение.</h4>
                            </div>
                            <div class="sl-swiper-slide__data">
                                <p class="sl-swiper-slide__data-item">Склад</p>
                                <p class="sl-swiper-slide__data-item">от 100 до 3 000 кв. м</p>
                            </div>
                            <p class="sl-swiper-slide__description">
                                Адрес: Березовский, земельный комплекс «Александровский» (рядом с развязкой ЕКАД/Березовский тракт, ул. Овощное отделение, 16)
                            </p>
                            <div class="sl-swiper-slide__price">
                                <p class="sl-swiper-slide__real-price no-wrap"><span class="capacity">25000</span> <span class="measure">₽/мес</span></p>
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
            <a class="btn btn-default sl-btn btn-transparent-main2" href="/nedvizhimost/arenda">
                <span class="btn__text">все предложения по аренде</span>
                <span class="btn__arrow btn__arrow-right"></span>
            </a>
        </div>
    </div>
</section>

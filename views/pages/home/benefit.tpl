<section class="benefit">
    <div class="container benefit__container">
        <div class="slider-wr benefit-slider">
            <div class="swiper benefit__swiper">
                <div class="swiper-wrapper">
                    {foreach $page->promo as $promo}
                    <div class="swiper-slide">
                        <picture>
                            <img class="image cover"
                                src="{$promo->photo}"
                                alt="{$promo-full}"
                                width="1168"
                                height="395"
                                loading="lazy"
                                decoding="async" />
                        </picture>
                        <div class="swiper-slide__wr">
                            <h2 class="title title-2 benefit__title">{$promo->full}</h2>
                            {if $promo->subtitle}
                            <p class="section-text">{$promo->subtitle}</p>
                            {/if}
                            {if $promo->url}
                                <a class="btn btn-default btn-main1-main1" href="{$promo->url}" type="button">
                                    <span class="btn__text">Подробнее</span>
                                    <span class="btn__arrow btn__arrow-right"></span>
                                </a>
                            {else}
                                <button class="btn btn-default btn-main1-main1 js-request" data-h="{$promo->full}" data-btn="Узнать подробнее" data-from="Кнопка: {$promo->full}" type="button">
                                    <span class="btn__text">{if $promo->button}{$promo->button}{else}Подробнее{/if}</span>
                                    <span class="btn__arrow btn__arrow-right"></span>
                                </button>
                            {/if}
                        </div>
                    </div>
                    {/foreach}
                    {*<div class="swiper-slide">
                        <picture>
                            <source srcset="/img/images/img_03-420.webp" media="(max-width: 420px)" type="image/webp" />
                            <source srcset="/img/images/img_03-767.webp" media="(max-width: 767px)" type="image/webp" />
                            <source srcset="/img/images/img_03-1240.webp" media="(max-width: 1240px)" type="image/webp" />
                            <source srcset="/img/images/img_03-420.jpg" media="(max-width: 420px)" />
                            <source srcset="/img/images/img_03-767.jpg" media="(max-width: 767px)" />
                            <source srcset="/img/images/img_03-1240.jpg" media="(max-width: 1240px)" />
                            <img class="image cover"
                                src="/img/images/img_03-1240.jpg"
                                alt="Продажа земельных участков коммерческого назначения возле Екатеринбурга и в Челябинской области"
                                width="1168"
                                height="395"
                                loading="lazy"
                                decoding="async" />
                        </picture>
                        <div class="swiper-slide__wr">
                            <h2 class="title title-2 benefit__title">Продажа земельных участков коммерческого назначения возле Екатеринбурга и в Челябинской области</h2>
                            <p class="section-text">Все коммуникации есть в поселке и возможны к подведению на участок</p>
                            <button class="btn btn-default btn-main1-main1 js-request" data-from="Кнопка ПОДРОБНЕЕ в блоке Бенефис" type="button">
                                <span class="btn__text">Подробнее</span>
                                <span class="btn__arrow btn__arrow-right"></span>
                            </button>
                        </div>
                    </div>*}
                </div>
            </div>
            <div class="slider-nav">
                <button class="slider-btn__prev slider-btn__circle-white" type="button"></button>
                <button class="slider-btn__next slider-btn__circle-white" type="button"></button>
            </div>
            <div class="slider-pagination"></div>
        </div>
    </div>
</section>

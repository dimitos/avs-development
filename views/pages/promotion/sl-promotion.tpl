<section class="sl-promotion sl-promotion__promo">
    <div class="container sl-promotion__container">
        <div class="sl-promotion__header">
            <h2 class="title title-2 sl-promotion__title">Другие акции</h2>
            <div class="promo-link__wr">
                <a href="/promotions" class="promo-link">Смотреть все акции</a>
            </div>
        </div>
        <div class="slider-wr sl-slider sl-promotion-slider">
            <div class="swiper sl-swiper sl-promotion__swiper">
                <div class="swiper-wrapper">
                    {foreach $page->sale_other as $sale}
                    <div class="swiper-slide">
                        <div class="swiper-slide__wr">
                            <a class="sl-swiper-slide__img" href="{$sale->url}">
                                <picture>
                                    <img class="image cover"
                                         src="{$sale->photo_preview}"
                                         alt="{$sale->full}"
                                         width="285"
                                         height="190"
                                         loading="lazy"
                                         decoding="async" />
                                </picture>
                            </a>
                            <div class="sl-swiper-slide__title">
                                <h4 class="title-4 sl__title">{$sale->full}</h4>
                            </div>
                            <div class="sl-swiper-slide__trig-wr">
                                {if $sale->is_arenda}
                                    <div class="sl-swiper-slide__trig" data-sl-promotion="sl-promotion-arenda">Акция по аренде</div>
                                {else}
                                    <div class="sl-swiper-slide__trig" data-sl-promotion="sl-promotion-prodazha">Акция по продаже</div>
                                {/if}
                            </div>
                            <div class="sl-swiper-slide__date">
                                <p class="section-text">Действует c <span>{$sale->date_start_display}</span></p>
                                {if $sale->date_end}
                                    <p class="section-text">до <span>{$sale->date_end_display}</span></p>
                                {/if}
                            </div>
                            <a class="btn btn-default btn-main2-main2" href="{$sale->url}"><span class="btn__text">Подробнее</span></a>
                        </div>
                    </div>
                    {/foreach}
                    {*<div class="swiper-slide">
                        <div class="swiper-slide__wr">
                            <div class="sl-swiper-slide__img">
                                <picture>
                                    <source srcset="/img/promotion/promo_02-420.webp" media="(max-width: 420px)" type="image/webp" />
                                    <source srcset="/img/promotion/promo_02-767.webp" media="(max-width: 767px)" type="image/webp" />
                                    <source srcset="/img/promotion/promo_02-1239.webp" media="(max-width: 1239px)" type="image/webp" />
                                    <source srcset="/img/promotion/promo_02-1920.webp" type="image/webp" />
                                    <source srcset="/img/promotion/promo_02-420.jpg" media="(max-width: 420px)" />
                                    <source srcset="/img/promotion/promo_02-767.jpg" media="(max-width: 767px)" />
                                    <source srcset="/img/promotion/promo_02-1239.jpg" media="(max-width: 1239px)" />
                                    <img class="image cover"
                                        src="/img/promotion/promo_02-1920.jpg"
                                        alt="Акция. ДЕВЕЛОПМЕНТ ЖИЛОЙ И КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ"
                                        width="285"
                                        height="190"
                                        loading="lazy"
                                        decoding="async" />
                                </picture>
                            </div>
                            <div class="sl-swiper-slide__title">
                                <h4 class="title-4 sl__title">Акция для новых арендаторов офисных помещений на Уралмаше!</h4>
                            </div>
                            <div class="sl-swiper-slide__trig-wr">
                                <div class="sl-swiper-slide__trig" data-sl-promotion="sl-promotion-arenda">Акция по аренде</div>
                            </div>
                            <div class="sl-swiper-slide__date">
                                <p class="section-text">Действует c <span>31.12.2021</span></p>
                                <p class="section-text">до <span>12.01.2022</span></p>
                            </div>
                            <a class="btn btn-default btn-main2-main2" href="promotion"><span class="btn__text">Подробнее</span></a>
                        </div>
                    </div>*}
                </div>
            </div>
            <div class="slider-nav">
                <button class="slider-btn__prev slider-btn__circle-white" type="button"></button>
                <button class="slider-btn__next slider-btn__circle-white" type="button"></button>
            </div>
        </div>
    </div>
</section>

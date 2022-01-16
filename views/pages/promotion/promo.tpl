{$sale = $page->sale}
<section class="promo">
    <div class="container promo__container">
        <div class="promo__wrapper">
            <div class="promo__part">
                {if $sale->date_end}
                <h4 class="title title-3 promo__title">Акция действует до {$sale->date_end_display} г.</h4>
                {/if}
                {$sale->description}
                {*<p class="section-text">
                    Не упустите возможность получить скидки на покупку объектов недвижимости в «Николином Ключе» и бытовой техники в магазинах наших партнеров!
                </p>
                <p class="section-text">Записывайтесь на просмотр участков и таунхаусов в период действия акции и получайте сразу два подарочных сертификата:</p>
                <ul class="promo-advantage">
                    <li>Сертификат на скидку 5 000 рублей при покупке любого объекта в «Николином Ключе»</li>
                    <li>Сертификат со скидкой 20% на покупку бытовой техники в магазинах наших партнеров.</li>
                </ul>
                <p class="section-text">
                    Все о Коттеджном Поселке «Николин Ключ» и объектах недвижимости можно узнать на сайте, перейдя по <a href="#" class="promo-link" onclick="return false">ссылке</a>
                </p>
                <p class="section-text">
                    Ждем Вас и Вашу семью!
                </p>*}
            </div>
            {if $sale->photos}
            <div class="promo__part">
                <div class="slider-wr sl-slider sl-promo-slider">
                    <div class="swiper sl-swiper sl-promo__swiper">
                        {if count($sale->photos) > 1}<div class="swiper-wrapper">{/if}
                            {foreach $sale->photos as $photo}
                            <div class="swiper-slide">
                                <div class="swiper-slide__wr">
                                    <div class="sl-swiper-slide__img">
                                        <picture>
                                            <img class="image cover"
                                                src="{$photo}"
                                                alt="{$sale->full}"
                                                width="285"
                                                height="190"
                                                loading="lazy"
                                                decoding="async" />
                                        </picture>
                                    </div>
                                </div>
                            </div>
                            {/foreach}
                            {*<div class="swiper-slide">
                                <div class="swiper-slide__wr">
                                    <div class="sl-swiper-slide__img">
                                        <picture>
                                            <source srcset="/img/objects/object_15-420.webp" media="(max-width: 420px)" type="image/webp" />
                                            <source srcset="/img/objects/object_15-1920.webp" type="image/webp" />
                                            <source srcset="/img/objects/object_15-420.jpg" media="(max-width: 420px)" />
                                            <img class="image cover"
                                                src="/img/objects/object_15-1920.jpg"
                                                alt="Акция. ДЕВЕЛОПМЕНТ ЖИЛОЙ И КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ"
                                                width="285"
                                                height="190"
                                                loading="lazy"
                                                decoding="async" />
                                        </picture>
                                    </div>
                                </div>
                            </div>*}
                        {if count($sale->photos) > 1}</div>{/if}
                    </div>
                    {if count($sale->photos) > 1}
                    <div class="slider-nav">
                        <button class="slider-btn__prev slider-btn__circle-white" type="button"></button>
                        <button class="slider-btn__next slider-btn__circle-white" type="button"></button>
                    </div>
                    {/if}
                </div>
                {if count($sale->photos) > 1}
                <div class="swiper sl-swiper sl-mini-promo__swiper">
                    <div class="swiper-wrapper">
                        {foreach $sale->photos as $photo}
                        <div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <div class="sl-swiper-slide__img">
                                    <picture>
                                        <img class="image cover"
                                            src="{$photo}"
                                            alt="{$sale->full}"
                                            width="285"
                                            height="190"
                                            loading="lazy"
                                            decoding="async" />
                                    </picture>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                        {*<div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <div class="sl-swiper-slide__img">
                                    <picture>
                                        <source srcset="/img/objects/object_15-1920-mini.webp" type="image/webp" />
                                        <img class="image cover"
                                            src="/img/objects/object_15-1920-mini.jpg"
                                            alt="Акция. ДЕВЕЛОПМЕНТ ЖИЛОЙ И КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ"
                                            width="285"
                                            height="190"
                                            loading="lazy"
                                            decoding="async" />
                                    </picture>
                                </div>
                            </div>
                        </div>*}
                    </div>
                </div>
                {/if}
            </div>
            {/if}
        </div>
    </div>
</section>

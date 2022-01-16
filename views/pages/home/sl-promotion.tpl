<section class="sl-promotion">
    <div class="container sl-promotion__container">
        <div class="sl-promotion__header">
            <h2 class="title title-2 sl-promotion__title">Акции</h2>
            <div class="sl-promotion__tabs-icon">
                <svg width="20" height="21" viewBox="0 0 20 21" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M6 10.7809C6 12.0634 5.16515 13.1543 3.99991 13.5586L4 19.6167C4 20.1589 3.55228 20.5985 3 20.5985C2.44772 20.5985 2 20.1589 2 19.6167L1.9991 13.5583C0.834377 13.1537 0 12.063 0 10.7809C0 9.49888 0.834377 8.40814 1.9991 8.00357L2 1.94513C2 1.40293 2.44772 0.963379 3 0.963379C3.55228 0.963379 4 1.40293 4 1.94513L3.99991 8.00323C5.16515 8.40753 6 9.49851 6 10.7809ZM4 10.7809C4 10.2387 3.55228 9.79918 3 9.79918C2.44772 9.79918 2 10.2387 2 10.7809C2 11.3231 2.44772 11.7627 3 11.7627C3.55228 11.7627 4 11.3231 4 10.7809ZM13 17.6532C13 19.2799 11.6569 20.5985 10 20.5985C8.34315 20.5985 7 19.2799 7 17.6532C7 16.3712 7.83438 15.2804 8.9991 14.8759L9 1.94513C9 1.40293 9.44772 0.963379 10 0.963379C10.5523 0.963379 11 1.40293 11 1.94513L10.9999 14.8755C12.1651 15.2798 13 16.3708 13 17.6532ZM11 17.6532C11 17.111 10.5523 16.6715 10 16.6715C9.44772 16.6715 9 17.111 9 17.6532C9 18.1954 9.44772 18.635 10 18.635C10.5523 18.635 11 18.1954 11 17.6532ZM20 3.90865C20 5.19651 19.158 6.29132 17.985 6.69147C17.9953 6.74394 18 6.79839 18 6.85391V19.6167C18 20.1589 17.5523 20.5985 17 20.5985C16.4477 20.5985 16 20.1589 16 19.6167V6.85391C16 6.79839 16.0047 6.74394 16.0137 6.69093C14.842 6.29132 14 5.19651 14 3.90865C14 2.28202 15.3431 0.963379 17 0.963379C18.6569 0.963379 20 2.28202 20 3.90865ZM18 3.90865C18 3.36644 17.5523 2.92689 17 2.92689C16.4477 2.92689 16 3.36644 16 3.90865C16 4.45085 16.4477 4.8904 17 4.8904C17.5523 4.8904 18 4.45085 18 3.90865Z"/>
                </svg>
            </div>
            <div class="sl-promotion__tabs sl-promotion__tabs-mobile">
                <p class="sl-promotion__txt">Показать:</p>
                <button class="sl-promotion__tab sl-promotion__tab-active" data-sl-promotion="1" type="button">Все</button>
                <a class="sl-promotion__tab" data-sl-promotion="2" type="button" href="/promotions/prodazha">Продажа</a>
                <a class="sl-promotion__tab" data-sl-promotion="3" type="button" href="/promotions/arenda">Аренда</a>
            </div>
        </div>
        <!-- {*print_r($page->sale)*} -->
        <div class="slider-wr sl-slider sl-promotion-slider">
            <div class="swiper sl-swiper sl-promotion__swiper">
                <div class="swiper-wrapper">
                    {foreach $page->sale as $sale}
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
        <div class="btn-wrap">
            <a class="btn btn-default sl-btn btn-transparent-main2" href="/promotions">
                <span class="btn__text">смотреть все акции</span>
                <span class="btn__arrow btn__arrow-right"></span>
            </a>
        </div>
    </div>
</section>

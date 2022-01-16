<section class="options">
    <div class="container options__container">
        <h2 class="title title-2 options__title">Основные варианты инвестиций</h2>
        {foreach $page->invest as $invest_type}
            <p class="block-text">
                {$invest_type@iteration}. {$invest_type["full"]}
                {if $invest_type["sale_text"]}
                    <br><br>
                    <span class="options-block__sale">{$invest_type["sale_text"]}</span>
                {/if}
            </p>
            {if $invest_type["invest"]|count < 5}
                <div class="options-block__inner">
                    {foreach $invest_type["invest"] as $invest}
                        <div class="options-block__item">
                            <div class="options-block__item-left">
                                <div class="options-block__item-img">
                                    <picture>
                                        <img class="image cover"
                                             src="{$invest->photo}"
                                             alt="{$invest->full}"
                                             width="387"
                                             height="285"
                                             loading="lazy"
                                             decoding="async"/>
                                    </picture>
                                    {if ($invest->badge && $invest->badge->full)}
                                    <div class="sl-swiper-slide__img-flag">{$invest->badge->full}</div>
                                    {/if}
                                </div>
                            </div>
                            <div class="options-block__item-right">
                                <h3 class="title title-3 options__title-3">{$invest->full}</h3>
                                <div class="options-block__item-text">
                                    {$invest->preview}
                                    {if $invest->star_text}
                                        <br><br>
                                        <span class="options-block__star-text">* {$invest->star_text}</span>
                                    {/if}
                                </div>
                                <div class="options-block__item-btn">
                                    {if $invest->url}
                                        <a class="btn btn-default btn-transparent-main2" href="{$invest->url}">
                                            <span class="btn__text">подробнее</span>
                                            <span class="btn__arrow btn__arrow-right"></span>
                                        </a>
                                    {else}
                                        <span class="btn btn-default btn-transparent-main2 js-request" data-h="Узнать подробнее об инвестировании" data-btn="Узнать подробнее" data-from="Кнопка: Инвестиции. {$invest->full}">
                                            <span class="btn__text">подробнее</span>
                                            <span class="btn__arrow btn__arrow-right"></span>
                                        </span>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {else}
                <div class="slider-wr sl-slider sl-options-slider">
                    <div class="swiper sl-swiper sl-options__swiper">
                        <div class="swiper-wrapper">
                            {foreach $invest_type["invest"] as $invest}
                                <div class="swiper-slide">
                                    <div class="swiper-slide__wr">
                                        <div class="sl-swiper-slide__img">
                                            <picture>
                                                <img class="image cover"
                                                     src="{$invest->photo}"
                                                     alt="{$invest->full}"
                                                     width="285"
                                                     height="230"
                                                     loading="lazy"
                                                     decoding="async"/>
                                            </picture>
                                            {if ($invest->badge && $invest->badge->full)}
                                                <div class="sl-swiper-slide__img-flag">{$invest->badge->full}</div>
                                            {/if}
                                        </div>
                                        <div class="sl-swiper-slide__title">
                                            <h4 class="title title-4 sl__title">{$invest->full}</h4>
                                        </div>
                                        <div class="sl-swiper-slide__date">
                                            {$invest->preview}
                                            {if $invest->star_text}
                                                <br><br>
                                                <span class="options-block__star-text">* {$invest->star_text}</span>
                                            {/if}
                                        </div>
                                        <div>
                                            {if $invest->url}
                                                <a href="{$invest->url}" class="link sl-swiper-slide__link">Узнать подробнее</a>
                                            {else}
                                                <span class="link sl-swiper-slide__link js-request" data-h="Узнать подробнее об инвестировании" data-btn="Узнать подробнее" data-from="Кнопка: Инвестиции. {$invest->full}">Узнать подробнее</span>
                                            {/if}
                                        </div>
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
            {/if}
        {/foreach}
        {*<div class="options-block">
            <p class="block-text">
                1. Совместное строительство объектов недвижимости, как жилой, так и коммерческой. Например:
            </p>
            <div class="options-block__inner">
                <div class="options-block__item">
                    <div class="options-block__item-left">
                        <div class="options-block__item-img">
                            <picture>
                                <source srcset="/img/objects/object_09-420.webp" media="(max-width: 420px)" type="image/webp" />
                                <source srcset="/img/objects/object_09-768.webp" media="(max-width: 767px)" type="image/webp" />
                                <source srcset="/img/objects/object_09-1239.webp" media="(max-width: 1239px)" type="image/webp" />
                                <source srcset="/img/objects/object_09-1920.webp" type="image/webp" />
                                <source srcset="/img/objects/object_09-420.jpg" media="(max-width: 420px)" />
                                <source srcset="/img/objects/object_09-768.jpg" media="(max-width: 767px)" />
                                <source srcset="/img/objects/object_09-1240.jpg" media="(max-width: 1240px)" />
                                <img class="image cover"
                                    src="/img/objects/object_09-1920.jpg"
                                    alt="Земельный комплекс «Александровский»"
                                    width="387"
                                    height="285"
                                    loading="lazy"
                                    decoding="async"/>
                            </picture>
                            <div class="sl-swiper-slide__img-flag">Бизнес-ипотека 6,5%!</div>
                        </div>
                    </div>
                    <div class="options-block__item-right">
                        <h3 class="title title-3 options__title-3">Земельный комплекс «Александровский»</h3>
                        <div class="options-block__item-text">
                            <p class="block-text">
                                Земельный комплекс «Александровский» расположен между городами Екатеринбург и Березовский. Имеет свой собственный съезд с ЕКАД. Месторасположение данного земельного комплекса, обеспечит высокую конверсию и востребованность услуг.
                            </p>
                            <p class="block-text">
                                В данном проекте возможно инвестиционное участие в строительстве складского или жилого комплексов.
                            </p>
                        </div>
                        <div class="options-block__item-btn">
                            <a class="btn btn-default btn-transparent-main2" href="object">
                                <span class="btn__text">подробнее</span>
                                <span class="btn__arrow btn__arrow-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="options-block__item">
                    <div class="options-block__item-left">
                        <div class="options-block__item-img">
                            <picture>
                                <source srcset="/img/objects/object_10-420.webp" media="(max-width: 420px)" type="image/webp" />
                                <source srcset="/img/objects/object_10-768.webp" media="(max-width: 767px)" type="image/webp" />
                                <source srcset="/img/objects/object_10-1239.webp" media="(max-width: 1239px)" type="image/webp" />
                                <source srcset="/img/objects/object_10-1920.webp" type="image/webp" />
                                <source srcset="/img/objects/object_10-420.jpg" media="(max-width: 420px)" />
                                <source srcset="/img/objects/object_10-768.jpg" media="(max-width: 767px)" />
                                <source srcset="/img/objects/object_10-1239.jpg" media="(max-width: 1239px)" />
                                <img class="image cover"
                                    src="/img/objects/object_10-1920.jpg"
                                    alt="Коттеджный поселок «Николин Ключ»"
                                    width="387"
                                    height="285"
                                    loading="lazy"
                                    decoding="async"/>
                            </picture>
                            <div class="sl-swiper-slide__img-flag">Бизнес-ипотека 6,5%!</div>
                        </div>
                    </div>
                    <div class="options-block__item-right">
                        <h3 class="title title-3 options__title-3">Коттеджный поселок «Николин Ключ»</h3>
                        <div class="options-block__item-text">
                            <p class="block-text">
                                Коттеджный поселок   «Николин Ключ» пользуется популярностью клиентов, благодаря возможности приобрести как готовое жилье, так и земельный участок для строительства.
                            </p>
                            <p class="block-text">
                                В данном проекте возможно инвестиционное участие при строительстве коттеджей или тайнхаусов.
                            </p>
                        </div>
                        <div class="options-block__item-btn">
                            <a class="btn btn-default btn-transparent-main2" href="object">
                                <span class="btn__text">подробнее</span>
                                <span class="btn__arrow btn__arrow-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="options-block">
            <p class="block-text">
                2. Инвестиции в готовый арендный бизнес:
            </p>
            <div class="slider-wr sl-slider sl-options-slider">
                <div class="swiper sl-swiper sl-options__swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <div class="sl-swiper-slide__img">
                                    <picture>
                                        <source srcset="/img/objects/object_11-420.webp" media="(max-width: 420px)" type="image/webp" />
                                        <source srcset="/img/objects/object_11-768.webp" media="(max-width: 767px)" type="image/webp" />
                                        <source srcset="/img/objects/object_11-1239.webp" media="(max-width: 1239px)" type="image/webp" />
                                        <source srcset="/img/objects/object_11-1920.webp" type="image/webp" />
                                        <source srcset="/img/objects/object_11-420.jpg" media="(max-width: 420px)" />
                                        <source srcset="/img/objects/object_11-768.jpg" media="(max-width: 767px)" />
                                        <source srcset="/img/objects/object_11-1239.jpg" media="(max-width: 1239px)" />
                                        <img class="image cover"
                                            src="/img/objects/object_11-1920.jpg"
                                            alt="Складской комплекс Альпинистов, 77"
                                            width="285"
                                            height="230"
                                            loading="lazy"
                                            decoding="async"/>
                                    </picture>
                                    <div class="sl-swiper-slide__img-flag">Скидка 5 %</div>
                                </div>
                                <div class="sl-swiper-slide__title">
                                    <h4 class="title title-4 sl__title">Складской комплекс<br>Альпинистов, 77</h4>
                                </div>
                                <div class="sl-swiper-slide__date">
                                    <p class="section-text">Складской комплекс Альпинистов,
                                        77 с прямым выездом на Кольцовский тракт, Помещения различного назначения: склады для хранения, производственные склады, склады с территорией. На территории комплекса: железнодорожные...
                                    </p>
                                </div>
                                <div>
                                    <a href="object" class="link sl-swiper-slide__link">Узнать подробнее</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <div class="sl-swiper-slide__img">
                                    <picture>
                                        <source srcset="/img/objects/object_12-420.webp" media="(max-width: 420px)" type="image/webp" />
                                        <source srcset="/img/objects/object_12-768.webp" media="(max-width: 767px)" type="image/webp" />
                                        <source srcset="/img/objects/object_12-1239.webp" media="(max-width: 1239px)" type="image/webp" />
                                        <source srcset="/img/objects/object_12-1920.webp" type="image/webp" />
                                        <source srcset="/img/objects/object_12-420.jpg" media="(max-width: 420px)" />
                                        <source srcset="/img/objects/object_12-768.jpg" media="(max-width: 767px)" />
                                        <source srcset="/img/objects/object_12-1239.jpg" media="(max-width: 1239px)" />
                                        <img class="image cover"
                                            src="/img/objects/object_12-1920.jpg"
                                            alt="Складской комплекс Альпинистов, 77"
                                            width="285"
                                            height="230"
                                            loading="lazy"
                                            decoding="async"/>
                                    </picture>
                                    <div class="sl-swiper-slide__img-flag">Скидка 5 %</div>
                                </div>
                                <div class="sl-swiper-slide__title">
                                    <h4 class="title title-4 sl__title">Складской комплекс<br>Альпинистов, 77</h4>
                                </div>
                                <div class="sl-swiper-slide__date">
                                    <p class="section-text">Складской комплекс Альпинистов,
                                        77 с прямым выездом на Кольцовский тракт, Помещения различного назначения: склады для хранения, производственные склады, склады с территорией. На территории комплекса: железнодорожные...
                                    </p>
                                </div>
                                <div>
                                    <a href="object" class="link sl-swiper-slide__link">Узнать подробнее</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <div class="sl-swiper-slide__img">
                                    <picture>
                                        <source srcset="/img/objects/object_13-420.webp" media="(max-width: 420px)" type="image/webp" />
                                        <source srcset="/img/objects/object_13-768.webp" media="(max-width: 767px)" type="image/webp" />
                                        <source srcset="/img/objects/object_13-1239.webp" media="(max-width: 1239px)" type="image/webp" />
                                        <source srcset="/img/objects/object_13-1920.webp" type="image/webp" />
                                        <source srcset="/img/objects/object_13-420.jpg" media="(max-width: 420px)" />
                                        <source srcset="/img/objects/object_13-768.jpg" media="(max-width: 767px)" />
                                        <source srcset="/img/objects/object_13-1239.jpg" media="(max-width: 1239px)" />
                                        <img class="image cover"
                                            src="/img/objects/object_13-1920.jpg"
                                            alt="Складской комплекс Альпинистов, 77"
                                            width="285"
                                            height="230"
                                            loading="lazy"
                                            decoding="async"/>
                                    </picture>
                                    <div class="sl-swiper-slide__img-flag">Скидка 5 %</div>
                                </div>
                                <div class="sl-swiper-slide__title">
                                    <h4 class="title title-4 sl__title">Складской комплекс<br>Альпинистов, 77</h4>
                                </div>
                                <div class="sl-swiper-slide__date">
                                    <p class="section-text">Складской комплекс Альпинистов,
                                        77 с прямым выездом на Кольцовский тракт, Помещения различного назначения: склады для хранения, производственные склады, склады с территорией. На территории комплекса: железнодорожные...
                                    </p>
                                </div>
                                <div>
                                    <a href="object" class="link sl-swiper-slide__link">Узнать подробнее</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <div class="sl-swiper-slide__img">
                                    <picture>
                                        <source srcset="/img/objects/object_14-420.webp" media="(max-width: 420px)" type="image/webp" />
                                        <source srcset="/img/objects/object_14-768.webp" media="(max-width: 767px)" type="image/webp" />
                                        <source srcset="/img/objects/object_14-1239.webp" media="(max-width: 1239px)" type="image/webp" />
                                        <source srcset="/img/objects/object_14-1920.webp" type="image/webp" />
                                        <source srcset="/img/objects/object_14-420.jpg" media="(max-width: 420px)" />
                                        <source srcset="/img/objects/object_14-768.jpg" media="(max-width: 767px)" />
                                        <source srcset="/img/objects/object_14-1239.jpg" media="(max-width: 1239px)" />
                                        <img class="image cover"
                                            src="/img/objects/object_14-1920.jpg"
                                            alt="Складской комплекс Альпинистов, 77"
                                            width="285"
                                            height="230"
                                            loading="lazy"
                                            decoding="async"/>
                                    </picture>
                                    <div class="sl-swiper-slide__img-flag">Скидка 5 %</div>
                                </div>
                                <div class="sl-swiper-slide__title">
                                    <h4 class="title title-4 sl__title">Складской комплекс<br>Альпинистов, 77</h4>
                                </div>
                                <div class="sl-swiper-slide__date">
                                    <p class="section-text">Складской комплекс Альпинистов,
                                        77 с прямым выездом на Кольцовский тракт, Помещения различного назначения: склады для хранения, производственные склады, склады с территорией. На территории комплекса: железнодорожные...
                                    </p>
                                </div>
                                <div>
                                    <a href="object" class="link sl-swiper-slide__link">Узнать подробнее</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="slider-nav">
                    <button class="slider-btn__prev slider-btn__circle-white" type="button"></button>
                    <button class="slider-btn__next slider-btn__circle-white" type="button"></button>
                </div>
            </div>
        </div>*}
        <p class="block-text">
            Мы перечислили лишь часть объектов недвижимости, готовы рассказать больше и подобрать вариант под ваши пожелания! Закажите консультацию любым удобным для Вас способом.
        </p>
    </div>
</section>

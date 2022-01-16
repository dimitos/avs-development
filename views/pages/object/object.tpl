{$object = $page->object}
<div class="container">
    {include "blocks/breadcrumb.tpl"}
</div>
<section class="object">
    <div class="container object__container">
        <div class="object-part object-slider">
            <h1 class="title title-2 object__title">{$object->full}</h1>
            <div class="slider-wr sl-object-slider">
                {if count($object->photos) > 1}
                <div class="swiper sl-object__swiper">
                    <div class="swiper-wrapper">
                {/if}
                        {foreach $object->photos as $photo}
                        <div class="swiper-slide">
                            <div class="swiper-slide__wr">
                                <div class="sl-swiper-slide__img">
                                    <picture>
                                        <img class="image cover"
                                            src="{$photo}"
                                            alt="{$object->full}"
                                            width="714"
                                            height="400"
                                            decoding="async" />
                                    </picture>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                    {if count($object->photos) > 1}</div>{/if}
                </div>
                {if count($object->photos) > 1}
                <div class="slider-nav">
                    <button class="slider-btn__prev slider-btn__circle-white" type="button"></button>
                    <button class="slider-btn__next slider-btn__circle-white" type="button"></button>
                </div>
                <div class="slider-pagination"></div>
            </div>
            {/if}
            {if count($object->photos) > 1}
            <div class="swiper sl-mini-object__swiper">
                <div class="swiper-wrapper">
                    {foreach $object->photos as $photo}
                    <div class="swiper-slide">
                        <div class="swiper-slide__wr">
                            <div class="sl-swiper-slide__img">
                                <picture>
                                    <img class="image cover"
                                        src="{$photo}"
                                        alt="{$object->full}"
                                        width="165"
                                        height="96"
                                        loading="lazy"
                                        decoding="async" />
                                </picture>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
            {/if}
        </div>
        <div class="object-part object-aside">
            {if $object->cost}<p class="object-aside__price no-wrap">{$object->cost_display}</p>{/if}
            {if $object->cost_land}<p class="object-aside__price no-wrap">{$object->cost_land_display}</p>{/if}
            {if $object->cost_old}<p class="object-aside__oldprice no-wrap">{$object->cost_old_display}</p>{/if}
            <div class="object-aside__data">
                {if $object->cost_m2}
                <div class="object-aside__data-item">
                    <div class="object-aside__data-item-name">Цена за м²:</div>
                    <div class="object-aside__data-item-text">{$object->cost_m2_display}</div>
                </div>
                {/if}
                {if $object->area_full}
                <div class="object-aside__data-item">
                    <div class="object-aside__data-item-name">Площадь:</div>
                    <div class="object-aside__data-item-text">{$object->area_full_display}</div>
                </div>
                {/if}
                {if $object->area_land}
                <div class="object-aside__data-item">
                    <div class="object-aside__data-item-name">Площадь участка:</div>
                    <div class="object-aside__data-item-text">{$object->area_land_display}</div>
                </div>
                {/if}
                {if $object->phone}
                <div class="object-aside__data-item">
                    <div class="object-aside__data-item-name">Телефон менеджера:</div>
                    <div class="object-aside__data-item-text">{$object->phone_display}</div>
                </div>
                {/if}
            </div>
            {if $object->address}
            <p>Адрес: {$object->address}</p>
            {/if}
            {*<div class="objects-map__link">
                <a class="link objects-map__link-item" href="#" data-modal="" onclick="return false">Показать на карте</a>
            </div>*}
            <button class="object-aside__btn btn btn-default btn-main1-main1 js-request" data-from="Кнопка: Заказать консультацию. {$object->full}"><span class="btn__text">Заказать консультацию</span></button>
            <p class="section-text">Подробности в офисе продаж. Не оферта.</p>
            <p class="section-text">Звоните! <a href="{$phone->link}" class="link-phone">{$phone->title}</a></p>
            {*<p class="object-aside__description section-text">Условия приобретения в собственность:</p>*}
            {if $benefit_h1 || $benefit_h2 || $benefit_h3 || $benefit_desc1 || $benefit_desc2 || $benefit_desc3}
            <ul class="object-aside__description-list">
                {if $benefit_h1 || $benefit_desc1}<li>{if $benefit_h1}{$benefit_h1}{/if}{if $benefit_h1 && $benefit_desc1}: {/if}{if $benefit_desc1}{$benefit_desc1}{/if}</li>{/if}
                {if $benefit_h2 || $benefit_desc2}<li>{if $benefit_h2}{$benefit_h2}{/if}{if $benefit_h2 && $benefit_desc2}: {/if}{if $benefit_desc2}{$benefit_desc2}{/if}</li>{/if}
                {if $benefit_h3 || $benefit_desc3}<li>{if $benefit_h3}{$benefit_h3}{/if}{if $benefit_h3 && $benefit_desc3}: {/if}{if $benefit_desc3}{$benefit_desc3}{/if}</li>{/if}
            </ul>
            {/if}
        </div>
        <div class="object-part object-description close">
            <h2 class="title title-2 object-aside__title">Описание</h2>
            <div class="block-text">
                {$object->description}
            </div>
            <div class="object-description__closer">Подробнее</div>
        </div>
        {if $object->file}
        <a class="object-info-download" href="{$object->file}" target="_blank">
            <span class="object-info-download__txt">Скачать подробную информацию об объекте</span>
            <span class="object-info-download__icon">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M17.5 16.6666C17.9602 16.6666 18.3333 17.0397 18.3333 17.5C18.3333 17.9602 17.9602 18.3333 17.5 18.3333H2.49996C2.03972 18.3333 1.66663 17.9602 1.66663 17.5C1.66663 17.0397 2.03972 16.6666 2.49996 16.6666H17.5ZM9.99996 15L9.93163 14.9966L9.83269 14.9831L9.73984 14.9585L9.64727 14.9219L9.56603 14.8783L9.50399 14.8364L9.4107 14.7559L6.07737 11.4225C5.75193 11.0971 5.75193 10.5695 6.07737 10.244C6.37777 9.94363 6.85047 9.92053 7.17737 10.1747L7.25588 10.244L9.16663 12.1541V2.49996C9.16663 2.03972 9.53972 1.66663 9.99996 1.66663C10.4602 1.66663 10.8333 2.03972 10.8333 2.49996V12.1541L12.744 10.244C13.0444 9.94363 13.5171 9.92053 13.844 10.1747L13.9225 10.244C14.223 10.5444 14.2461 11.0171 13.9919 11.344L13.9225 11.4225L10.5892 14.7559L10.5526 14.7904L10.496 14.8363L10.4033 14.8961L10.3525 14.9219L10.2847 14.9501L10.2216 14.9701L10.0979 14.9943L9.99996 15Z" fill="#209C3C"/>
                </svg>
            </span>
        </a>
        {/if}
    </div>
</section>

{extends "modal/modal.tpl"}

{block main}
    <div class="modal__inner">
        <div class="map-radar">
            <div class="map-radar__map" id="map-radar"></div>
        </div>
        <div class="map-radar-content">
            <h3 class="title modal-title map-radar-title">Показать на карте</h3>
            <div class="filter-sale active-tab-1">
                <div class="filter-sale__nav">
                    <div class="filter-sale__nav-item filter-sale__nav-item-1">
                        <button class="btn btn-default btn-transparent-main2" type="button">
                            <span class="btn__text">ПРОДАЖА</span>
                        </button>
                    </div>
                    <div class="filter-sale__nav-item filter-sale__nav-item-2">
                        <button class="btn btn-default btn-transparent-main2" type="button">
                            <span class="btn__text">АРЕНДА</span>
                        </button>
                    </div>
                </div>
                <div class="filter-sale__tab filter-sale__tab-1">
                    <div class="swiper filter-swiper-1">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Все объекты</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox selected">Жилая недвижимость</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Офисы и торговые площади</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Загородная недвижимость</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Склады и производственные помещения</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Участки под ИЖС</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Участки для бизнеса</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="filter-sale__tab filter-sale__tab-2">
                    <div class="swiper filter-swiper-2">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Все объекты</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox selected">Участки для бизнеса</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Участки под ИЖС</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Склады и производственные помещения</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Загородная недвижимость</label>
                            </div>
                            <div class="swiper-slide">
                                <label class="filter__item filter__item-checkbox">Офисы и торговые площади</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}

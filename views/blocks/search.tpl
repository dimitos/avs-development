<div class="search__inner">
    <div class="search-reset" data-type="{if $url->lvl2 == "arenda"}arenda{else}prodazha{/if}"><span>Сбросить фильтр</span>
        <svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M8.41425 7.00025L13.7072 1.70725C14.0982 1.31625 14.0982 0.68425 13.7072 0.29325C13.3162 -0.09775 12.6842 -0.09775 12.2933 0.29325L7.00025 5.58625L1.70725 0.29325C1.31625 -0.09775 0.68425 -0.09775 0.29325 0.29325C-0.09775 0.68425 -0.09775 1.31625 0.29325 1.70725L5.58625 7.00025L0.29325 12.2933C-0.09775 12.6842 -0.09775 13.3162 0.29325 13.7072C0.48825 13.9022 0.74425 14.0002 1.00025 14.0002C1.25625 14.0002 1.51225 13.9022 1.70725 13.7072L7.00025 8.41425L12.2933 13.7072C12.4882 13.9022 12.7443 14.0002 13.0002 14.0002C13.2562 14.0002 13.5122 13.9022 13.7072 13.7072C14.0982 13.3162 14.0982 12.6842 13.7072 12.2933L8.41425 7.00025Z"/>
        </svg>
    </div>
    <div class="search-form">
        <div class="search-form__top">
            <div class="filters">
                <div class="filter__list">
                    <div class="filter filter-block filter-method">
                        <div class="filter__title">
                            <span class="filter__name"><span class="filter__label">Тип сделки</span> <span class="filter__chosen">&nbsp;</span></span>
                        </div>
                        <div class="filter__content">
                            <fieldset class="filter__fieldset">
                                <label class="filter__item filter__item-checkbox {if (!$url->lvl2) || ($url->lvl2 == "arenda")}selected{/if}" data-type="form" data-value="arenda">Арендовать</label>
                                <label class="filter__item filter__item-checkbox {if $url->lvl2 == "prodazha"}selected{/if}" data-type="form" data-value="prodazha">Купить</label>
                                {*<label class="filter__item filter__item-checkbox">Все</label>*}
                            </fieldset>
                        </div>
                    </div>
                    <div class="filter filter-block filter-type">
                        <div class="filter__title">
                            <span class="filter__name"><span class="filter__label">Тип объекта</span> <span class="filter__chosen">&nbsp;</span></span>
                        </div>
                        <div class="filter__content">
                            <fieldset class="filter__fieldset">
                                {foreach $page->types as $type}
                                    <label class="filter__item filter__item-checkbox {if ($url->lvl3 == $type->eng)}selected{/if}" data-type="type" data-value="{$type->eng}">{$type->full}</label>
                                {/foreach}
                                <label class="filter__item filter__item-checkbox {if (!$url->lvl3)}selected{/if}" data-type="type" data-value="">Все</label>
                            </fieldset>
                        </div>
                    </div>
                    <div class="filter filter-block">
                        <div class="filter__title">
                            <span class="filter__name"><span class="filter__label">Площадь</span> <span class="filter__chosen">&nbsp;</span></span>
                        </div>
                        <div class="filter__content">
                            <div class="filter__content-title">Площадь, м²</div>
                            <div class="selectors-block range range-search" data-unit="м²">
                                <div class="range__item range__start">
                                    <input class="range__input range__input-from range__input-search" type="number" placeholder="От" name="min_area" value="{$smarty.get.min_area}">
                                </div>
                                <div class="range__item range__end">
                                    <input class="range__input range__input-to range__input-search" type="number" placeholder="До" name="max_area" value="{$smarty.get.max_area}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="filter filter-block">
                        <div class="filter__title">
                            <span class="filter__name"><span class="filter__label">Цена</span> <span class="filter__chosen">&nbsp;</span></span>
                        </div>
                        <div class="filter__content">
                            {*<div class="selectors-block__wr">
                                <div class="price__square selected">₽ за м²</div>
                                <div class="price__square">₽ за все</div>
                            </div>*}
                            <div class="selectors-block range range-search" data-unit="₽">
                                <div class="range__item range__start">
                                    <input class="range__input range__input-from range__input-search" type="number" placeholder="От" name="min_cost" value="{$smarty.get.min_cost}">
                                </div>
                                <div class="range__item range__end">
                                    <input class="range__input range__input-to range__input-search" type="number" placeholder="До" name="max_cost" value="{$smarty.get.max_cost}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="filter__place">
                    <input class="filter__place-input" name="text" type="text" placeholder="Введите город, адрес, район, метро или Жилищный Комплекс" value="{$smarty.get.search}">
                </div>
            </div>
        </div>
    </div>
    <div class="search-form__buttons">
        <div class="button-item">
            <a class="search-form__link btn btn-default btn-main2-main2" href="/nedvizhimost/prodazha"><span class="btn__text">Найти</span></a>
        </div>
        {*<div class="button-item">
            <div class="search-map__link">
                <a class="link search-map__link-item" href="#" onclick="return false">Показать на карте</a>
            </div>
        </div>*}
    </div>
</div>

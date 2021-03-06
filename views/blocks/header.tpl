<div class="header-area"></div>
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="header__wrap">
                <div class="header__place section-text"><b>Екатеринбург</b>, ул. Розы Люксембург, 25</div>
                <button class="btn btn-default btn-main1-main1" type="button" data-modal="question">
                    <span class="btn__text">Арендаторам</span>
                </button>
            </div>
        </div>
    </div>
    <div class="header__main">
        <div class="container">
            <div class="header__wrap">
                <a href="/" class="logo header-logo">
                    <picture class="about__item-img">
                        <source srcset="/img/images/logo-header.webp" type="image/webp" />
                        <img class="image" src="/img/images/logo-header.png" width="115" height="43" alt="Логотип AVS" />
                    </picture>
                </a>
                <div class="header__content">
                    <nav class="header__menu">
                        <ul class="menu__list">
                            <li class="menu__item menu__item-submenu">
                                <a href="#" class="menu__item-link no-wrap" onclick="return false"><span class="menu-icon">Недвижимость</span></a>
                                <div class="submenu">
                                    <div class="submenu__inner container">
                                        <div class="submenu__block"><div class="submenu__block-title">Продажа</div>
                                            <ul class="submenu__list">
                                                {foreach $page->types as $type}
                                                    {if ($page->types_count_prodazha[$type->id] > 0)}
                                                        <li class="submenu__item"><a class="submenu__item-link" href="/nedvizhimost/prodazha/{$type->eng}">{$type->full}</a></li>
                                                    {/if}
                                                {/foreach}
                                            </ul>
                                        </div>
                                        <div class="submenu__block"><div class="submenu__block-title">Аренда</div>
                                            <ul class="submenu__list">
                                                {foreach $page->types as $type}
                                                    {if ($page->types_count_arenda[$type->id] > 0)}
                                                        <li class="submenu__item"><a class="submenu__item-link" href="/nedvizhimost/arenda/{$type->eng}">{$type->full}</a></li>
                                                    {/if}
                                                {/foreach}
                                            </ul>
                                        </div>
                                        {if $page->sale_menu}
                                        <div class="submenu__block submenu__item-promo"><div class="submenu__block-title">Акция</div>
                                            <div class="submenu__list">
                                                {$sale = $page->sale_menu}
                                                <div class="list__item-wr">
                                                    <a class="list__item-img" href="{$sale->url}">
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
                                                    <div class="list__item-title">
                                                        <h4 class="title-4 sl__title">{$sale->full}</h4>
                                                    </div>
                                                    <div class="list__item-trig-wr">
                                                        {if $sale->is_arenda}
                                                            <div class="list__item-trig" data-list="list-arenda">Акция по аренде</div>
                                                        {else}
                                                            <div class="list__item-trig" data-list="list-prodazha">Акция по продаже</div>
                                                        {/if}
                                                    </div>
                                                    <div class="list__item-date">
                                                        <p class="section-text">Действует c <span>{$sale->date_start_display}</span></p>
                                                        {if $sale->date_end}
                                                            <p class="section-text">до <span>{$sale->date_end_display}</span></p>
                                                        {/if}
                                                    </div>
                                                    <a class="btn btn-default btn-main2-main2" href="{$sale->url}">
                                                        <span class="btn__text">Подробнее</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        {/if}
                                    </div>
                                </div>
                            </li>
                            <li class="menu__item"><a class="menu__item-link no-wrap hash" href="/promotions">Акции</a></li>
                            <li class="menu__item"><a class="menu__item-link no-wrap hash" href="/investors">Инвесторам</a></li>
                            <li class="menu__item"><a class="menu__item-link no-wrap hash" href="/partners">Партнерам</a></li>
                            <li class="menu__item"><a class="menu__item-link no-wrap hash" href="/about">О компании</a></li>
                            <li class="menu__item"><a class="menu__item-link no-wrap hash" href="/contacts">Контакты</a></li>
                        </ul>
                        <div class="soc-block">
                            <ul class="soc-block__list">
                                <li class="soc-block__item">
                                    <a class="soc-block__link" href="https://vk.com/avs_development" target="_blank">
                                        <svg class="soc-block__img" width="36" height="36" viewBox="0 0 36 36" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="36" height="36"/>
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M29.4493 12.4009C29.6163 11.8446 29.4494 11.4358 28.6553 11.4358H26.0297C25.362 11.4358 25.0544 11.7889 24.8875 12.1785C24.8875 12.1785 23.5522 15.4329 21.6607 17.5469C21.0487 18.1589 20.7706 18.3533 20.4367 18.3533C20.2698 18.3533 20.0283 18.1589 20.0283 17.6026V12.4009C20.0283 11.7332 19.8345 11.4358 19.2781 11.4358H15.1521C14.735 11.4358 14.4841 11.7456 14.4841 12.0393C14.4841 12.6723 15.4297 12.8182 15.5272 14.5983V18.4649C15.5272 19.3126 15.3742 19.4664 15.0404 19.4664C14.1503 19.4664 11.9853 16.1972 10.701 12.4566C10.4493 11.7295 10.1969 11.4358 9.52582 11.4358H6.90021C6.15003 11.4358 6 11.7889 6 12.1785C6 12.8739 6.89027 16.3232 10.1447 20.885C12.3146 24.0001 15.3712 25.6891 18.1528 25.6891C19.822 25.6891 20.0283 25.314 20.0283 24.6679V22.3133C20.0283 21.5632 20.1864 21.4135 20.7147 21.4135C21.1044 21.4135 21.7719 21.6082 23.3298 23.1102C25.11 24.8902 25.4033 25.6891 26.4048 25.6891H29.0304C29.7806 25.6891 30.1556 25.314 29.9392 24.5738C29.7025 23.836 28.8526 22.7659 27.7247 21.497C27.1127 20.7736 26.1947 19.9947 25.9168 19.6054C25.5272 19.1046 25.6385 18.8822 25.9168 18.4374C25.9168 18.4374 29.1155 13.9311 29.4493 12.4011V12.4009Z" fill="white"/>
                                        </svg>
                                    </a>
                                </li>
                                <li class="soc-block__item">
                                    <a class="soc-block__link" href="https://instagram.com/_u/development_avs/" target="_blank">
                                        <svg class="soc-block__img" width="36" height="36" viewBox="0 0 36 36" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="36" height="36"/>
                                            <path d="M14.2511 18C14.2511 15.929 15.9295 14.2497 18.0005 14.2497C20.0714 14.2497 21.7508 15.929 21.7508 18C21.7508 20.071 20.0714 21.7503 18.0005 21.7503C15.9295 21.7503 14.2511 20.071 14.2511 18ZM12.2237 18C12.2237 21.1905 14.81 23.7767 18.0005 23.7767C21.191 23.7767 23.7772 21.1905 23.7772 18C23.7772 14.8095 21.191 12.2233 18.0005 12.2233C14.81 12.2233 12.2237 14.8095 12.2237 18ZM22.6559 11.9942C22.6558 12.2612 22.7349 12.5223 22.8831 12.7443C23.0314 12.9664 23.2421 13.1395 23.4888 13.2418C23.7354 13.3441 24.0068 13.3709 24.2687 13.3189C24.5306 13.2669 24.7712 13.1385 24.9601 12.9497C25.149 12.761 25.2776 12.5205 25.3298 12.2587C25.382 11.9968 25.3554 11.7253 25.2533 11.4786C25.1513 11.2319 24.9783 11.021 24.7564 10.8726C24.5344 10.7241 24.2734 10.6449 24.0064 10.6447H24.0059C23.648 10.6449 23.3048 10.7871 23.0517 11.0401C22.7985 11.2932 22.6562 11.6363 22.6559 11.9942ZM13.4555 27.1572C12.3586 27.1073 11.7625 26.9246 11.3663 26.7702C10.841 26.5657 10.4663 26.3222 10.0723 25.9287C9.67825 25.5352 9.43435 25.1608 9.23077 24.6356C9.07633 24.2396 8.89363 23.6433 8.84377 22.5464C8.78923 21.3606 8.77834 21.0044 8.77834 18.0001C8.77834 14.9958 8.79013 14.6406 8.84377 13.4537C8.89372 12.3569 9.07777 11.7617 9.23077 11.3646C9.43525 10.8393 9.67879 10.4646 10.0723 10.0705C10.4657 9.67653 10.8401 9.43263 11.3663 9.22905C11.7623 9.07461 12.3586 8.89191 13.4555 8.84205C14.6413 8.78751 14.9975 8.77662 18.0005 8.77662C21.0034 8.77662 21.36 8.78841 22.5468 8.84205C23.6436 8.892 24.2388 9.07605 24.636 9.22905C25.1612 9.43263 25.536 9.67707 25.93 10.0705C26.324 10.464 26.567 10.8393 26.7715 11.3646C26.9259 11.7606 27.1086 12.3569 27.1585 13.4537C27.213 14.6406 27.2239 14.9958 27.2239 18.0001C27.2239 21.0044 27.213 21.3596 27.1585 22.5464C27.1085 23.6433 26.9249 24.2394 26.7715 24.6356C26.567 25.1608 26.3235 25.5356 25.93 25.9287C25.5365 26.3218 25.1612 26.5657 24.636 26.7702C24.24 26.9247 23.6436 27.1074 22.5468 27.1572C21.361 27.2118 21.0047 27.2227 18.0005 27.2227C14.9962 27.2227 14.6409 27.2118 13.4555 27.1572ZM13.3623 6.81813C12.1647 6.87267 11.3463 7.06257 10.6316 7.34067C9.89146 7.62786 9.26488 8.01315 8.63875 8.63829C8.01262 9.26343 7.62832 9.891 7.34113 10.6312C7.06303 11.3463 6.87313 12.1642 6.81859 13.3618C6.76315 14.5614 6.75046 14.9449 6.75046 18C6.75046 21.0551 6.76315 21.4386 6.81859 22.6381C6.87313 23.8359 7.06303 24.6537 7.34113 25.3688C7.62832 26.1085 8.01271 26.7368 8.63875 27.3617C9.26479 27.9866 9.89146 28.3713 10.6316 28.6593C11.3477 28.9374 12.1647 29.1273 13.3623 29.1819C14.5625 29.2364 14.9453 29.25 18.0005 29.25C21.0556 29.25 21.4391 29.2373 22.6386 29.1819C23.8363 29.1273 24.6542 28.9374 25.3693 28.6593C26.109 28.3713 26.736 27.9868 27.3622 27.3617C27.9883 26.7366 28.3718 26.1085 28.6598 25.3688C28.9379 24.6537 29.1287 23.8358 29.1823 22.6381C29.2369 21.4377 29.2496 21.0551 29.2496 18C29.2496 14.9449 29.2369 14.5614 29.1823 13.3618C29.1278 12.1641 28.9379 11.3458 28.6598 10.6312C28.3718 9.89145 27.9873 9.26442 27.3622 8.63829C26.737 8.01216 26.109 7.62786 25.3702 7.34067C24.6542 7.06257 23.8362 6.87177 22.6395 6.81813C21.44 6.76359 21.0565 6.75 18.0014 6.75C14.9462 6.75 14.5625 6.76269 13.3623 6.81813Z" fill="white"/>
                                        </svg>
                                    </a>
                                </li>
                                <li class="soc-block__item">
                                    <a class="soc-block__link" href="https://fb.com/n/?AVS-Development-465571587154732" target="_blank">
                                        <svg class="soc-block__img" width="36" height="36" viewBox="0 0 36 36" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="36" height="36"/>
                                            <path d="M19.2018 29.9999V19.0523H22.8765L23.4267 14.7859H19.2018V12.0619C19.2018 10.8267 19.5449 9.98482 21.3163 9.98482L23.5756 9.98377V6.16793C23.1847 6.11613 21.8437 6 20.2835 6C17.0262 6 14.7961 7.98818 14.7961 11.6396V14.786H11.1119V19.0524H14.796V30L19.2018 29.9999Z" fill="white"/>
                                        </svg>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="header__mob-btn">
                            <button class="btn btn-default btn-main1-main1" type="button" data-modal="question">
                                <span class="btn__text">Арендаторам</span>
                            </button>
                        </div>
                    </nav>
                    <a href="{$phone->link}" class="header__phone no-wrap">
                        <svg width="18" height="17" viewBox="0 0 18 17" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6.96224 6.69346C7.19407 6.5389 7.33332 6.27871 7.33332 6.00008V2.66675C7.33332 1.28604 6.21404 0.166748 4.83332 0.166748H1.49999C1.03975 0.166748 0.666656 0.539844 0.666656 1.00008C0.666656 9.28435 8.21572 16.8334 16.5 16.8334C16.9602 16.8334 17.3333 16.4603 17.3333 16.0001V12.6667C17.3333 11.286 16.214 10.1667 14.8333 10.1667H11.5C11.2214 10.1667 10.9612 10.306 10.8066 10.5378L9.21883 12.9195C7.48948 11.8013 5.97436 10.3244 4.80894 8.62422L4.58056 8.28124L6.96224 6.69346ZM11.946 11.8334H14.8334C15.2936 11.8334 15.6667 12.2065 15.6667 12.6667V15.1379C14.0523 15.0261 12.4768 14.5944 11.0073 13.9097L10.6701 13.7473L11.946 11.8334ZM2.36222 1.83341H4.83332C5.29356 1.83341 5.66666 2.20651 5.66666 2.66675V5.55409L3.75281 6.83C2.97401 5.26546 2.48252 3.57197 2.36222 1.83341Z" />
                        </svg>
                        <span>{$phone->title}</span>
                    </a>
                </div>
            </div>
            <div class="header__btn-menu">
                <div class="header__btn-menu-img"></div>
            </div>
        </div>
    </div>
</header>

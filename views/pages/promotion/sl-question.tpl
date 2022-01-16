{$sale = $page->sale}
<section class="sl-question">
    <div class="container">
        <div class="slider-wr sl-question-slider">
            <div class="swiper sl-question__swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="swiper-slide__wr">
                            <div class="question__container sl-question__slide-1">
                                <h3 class="title title-2 question__title">Хотите узнать <span class="c-main">подробнее об акции?</span> Оставьте заявку и мы перезвоним</h3>
                                <p class="section-text">Оставьте заявку, мы свяжемся с вами и подробно на них ответим.</p>
                                <form class="question__form">
                                    <div class="question__fields">
                                        <div class="input__item">
                                            <input class="input__default question__input question__input-name" type="text" id="question-input-name">
                                            <label class="question__field question__field-name" for="question-input-name">Ваше имя</label>
                                        </div>
                                        <div class="input__item">
                                            <input class="input__default question__input question__input-phone" type="tel" name="phone" id="question-input-phone">
                                            <label class="question__field question__field-name" for="question-input-phone">Телефон
                                                <span> *</span>
                                            </label>
                                        </div>
                                        <div class="question__btn">
                                            <button class="question__submit btn btn-default btn-main1-main1" type="button">
                                                <span class="btn__text">Оставить заявку</span>
                                            </button>
                                        </div>
                                        <div class="question__privacy">
                                            <span class="question__agreement"> Нажимая «Оставить заявку», вы соглашаетесь с
                                                <span class="link question__privacy-link no-wrap" data-modal="privacy"> политикой конфиденциальности</span>
                                            </span>
                                        </div>
                                        <input type="hidden" class="question__from" value="Форма захвата: Узнать об акции. {$sale->full}" />
                                    </div>
                                </form>
                                <div class="question__img">
                                    <picture>
                                        <source srcset="/img/images/img_05-420.webp" media="(max-width: 420px)" type="image/webp" />
                                        <source srcset="/img/images/img_05-767.webp" type="image/webp" />
                                        <source srcset="/img/images/img_05-767.png" media="(max-width: 420px)" />
                                        <img class="image cover"
                                            src="/img/images/img_05-767.png"
                                            alt="Остались вопросы?"
                                            width="767"
                                            height="418"
                                            loading="lazy"
                                            decoding="async" />
                                    </picture>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="swiper-slide__wr">
                            <div class="question__container sl-question__slide-2">
                                <h3 class="title title-2 question__title">У нас доступен <span class="c-main">онлайн-просмотр и проведение сделок онлайн.</span>  Оставьте заявку,чтобы узнать подробней</h3>
                                <p class="section-text">Оставьте заявку, мы свяжемся с Вами и детально обо всем расскажем</p>
                                <form class="question__form">
                                    <div class="question__fields">
                                        <div class="input__item">
                                            <input class="input__default question__input question__input-name" type="text" id="question-input-name2">
                                            <label class="question__field question__field-name" for="question-input-name2">Ваше имя</label>
                                        </div>
                                        <div class="input__item">
                                            <input class="input__default question__input question__input-phone" type="tel" name="phone" id="question-input-phone2">
                                            <label class="question__field question__field-name" for="question-input-phone2">Телефон
                                                <span> *</span>
                                            </label>
                                        </div>
                                        <div class="question__btn">
                                            <button class="question__submit btn btn-default btn-main1-main1" type="button">
                                                <span class="btn__text">Оставить заявку</span>
                                            </button>
                                        </div>
                                        <div class="question__privacy">
                                            <span class="question__agreement"> Нажимая «Оставить заявку», вы соглашаетесь с
                                                <span class="link question__privacy-link no-wrap" data-modal="privacy"> политикой конфиденциальности</span>
                                            </span>
                                        </div>
                                        <input type="hidden" class="question__from" value="Форма захвата: Онлайн-просмотр. {$sale->full}" />
                                    </div>
                                </form>
                                <div class="question__img">
                                    <picture>
                                        <source srcset="/img/images/img_10-420.webp" media="(max-width: 420px)" type="image/webp" />
                                        <source srcset="/img/images/img_10-767.webp" type="image/webp" />
                                        <source srcset="/img/images/img_10-767.png" media="(max-width: 420px)" />
                                        <img class="image cover"
                                            src="/img/images/img_10-767.png"
                                            alt="Остались вопросы?"
                                            width="767"
                                            height="418"
                                            loading="lazy"
                                            decoding="async" />
                                    </picture>
                                </div>
                            </div>
                        </div>
                    </div>

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
<div class="container question-footer">
    <p class="question-footer__text">
        Не хотите ждать звонка? Вы можете связаться с менеджером, позвонив <span class="c-main">прямо сейчас!</span>
    </p>
    <div class="question-footer__link">
        <a href="{$phone->link}" class="question-footer__phone no-wrap">
            <svg width="18" height="17" viewBox="0 0 18 17" xmlns="http://www.w3.org/2000/svg">
                <path d="M6.96224 6.69346C7.19407 6.5389 7.33332 6.27871 7.33332 6.00008V2.66675C7.33332 1.28604 6.21404 0.166748 4.83332 0.166748H1.49999C1.03975 0.166748 0.666656 0.539844 0.666656 1.00008C0.666656 9.28435 8.21572 16.8334 16.5 16.8334C16.9602 16.8334 17.3333 16.4603 17.3333 16.0001V12.6667C17.3333 11.286 16.214 10.1667 14.8333 10.1667H11.5C11.2214 10.1667 10.9612 10.306 10.8066 10.5378L9.21883 12.9195C7.48948 11.8013 5.97436 10.3244 4.80894 8.62422L4.58056 8.28124L6.96224 6.69346ZM11.946 11.8334H14.8334C15.2936 11.8334 15.6667 12.2065 15.6667 12.6667V15.1379C14.0523 15.0261 12.4768 14.5944 11.0073 13.9097L10.6701 13.7473L11.946 11.8334ZM2.36222 1.83341H4.83332C5.29356 1.83341 5.66666 2.20651 5.66666 2.66675V5.55409L3.75281 6.83C2.97401 5.26546 2.48252 3.57197 2.36222 1.83341Z" />
            </svg>
            <span>{$phone->title}</span>
        </a>
    </div>
</div>

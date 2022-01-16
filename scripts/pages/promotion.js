// инициализация слайдера Sl-question
if ($(".sl-question__swiper").length > 0) {
    new Swiper(".sl-question__swiper", {
        roundLengths: true,
        watchOverflow: true,
        loop: true,
        slidesPerView: 1,
        slidesPerGroup: 1,
        speed: 800,
        spaceBetween: 30,
        autoHeight: true,
        navigation: {
            nextEl: ".sl-question-slider .slider-btn__next",
            prevEl: ".sl-question-slider .slider-btn__prev",
        },
        pagination: {
            el: ".sl-question-slider .slider-pagination",
            clickable: true,
        },
    });
}

// инициализация слайдера Promo
if ($(".sl-promo__swiper").length > 0) {
    new Swiper(".sl-promo__swiper", {
        roundLengths: true,
        watchOverflow: true,
        loop: true,
        slidesPerView: 1,
        slidesPerGroup: 1,
        speed: 800,
        spaceBetween: 26,
        navigation: {
            nextEl: ".sl-promo-slider .slider-btn__next",
            prevEl: ".sl-promo-slider .slider-btn__prev",
        },
        pagination: {
            el: ".sl-promo-slider .slider-pagination",
            clickable: true,
        },
        thumbs: {
            swiper: {
                el: ".sl-mini-promo__swiper",
                slidesPerView: 3,
                slidesPerGroup: 3,
                loop: true,
                slideToClickedSlide: true,
                centeredSlides: true,
                spaceBetween: 26,
                speed: 800,
                touchRatio: 0.3,
                watchSlidesProgress: true,
            }
        }
    });
}

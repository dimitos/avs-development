// инициализация слайдера "Спецпредложения по ПРОДАЖЕ" sl-prodazha
if ($(".sl-prodazha__swiper").length > 0) {
    new Swiper(".sl-prodazha__swiper", {
        roundLengths: true,
        watchOverflow: true,
        loop: true,
        slidesPerView: 1,
        slidesPerGroup: 1,
        speed: 800,
        spaceBetween: 20,
        navigation: {
            nextEl: ".sl-prodazha-slider .slider-btn__next",
            prevEl: ".sl-prodazha-slider .slider-btn__prev",
        },
        breakpoints: {
            768: {
                slidesPerView: 3,
                slidesPerGroup: 3,
            },
            1240: {
                slidesPerView: 4,
                slidesPerGroup: 4,
            },
        },
    });
}

// открытие / закрытие описания объекъта в мобильной версии
$(".object-description__closer").on("click", ()=> $(".object-description").toggleClass("close"))

// инициализация слайдера Promo
if ($(".sl-object__swiper").length > 0) {
    new Swiper(".sl-object__swiper", {
        roundLengths: true,
        watchOverflow: true,
        loop: true,
        slidesPerView: 1,
        slidesPerGroup: 1,
        speed: 800,
        spaceBetween: 26,
        navigation: {
            nextEl: ".sl-object-slider .slider-btn__next",
            prevEl: ".sl-object-slider .slider-btn__prev",
        },
        pagination: {
            el: ".sl-object-slider .slider-pagination",
            clickable: true,
        },
        thumbs: {
            swiper: {
                el: ".sl-mini-object__swiper",
                slidesPerView: 4,
                slidesPerGroup: 4,
                loop: true,
                slideToClickedSlide: true,
                spaceBetween: 18,
                speed: 800,
                touchRatio: 0.3,
                watchSlidesProgress: true,
            }
        }
    });
}

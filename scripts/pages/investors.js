import { scrollToBlock } from "../common/helpers";

$(document).ready(function () {

    /**
     * Delete anchor hash
     */
    const hash = document.querySelectorAll('.hash');
    if (document.querySelectorAll('.hash')) {
        hash.forEach((el) => el.addEventListener('click', () => setTimeout(() => history.replaceState(null, null, ' '), 1), { passive: true }));
    }

    // инициализация слайдера Партнеры
    if ($(".partners__slider").length > 0) {
        new Swiper(".partners__slider", {
            roundLengths: true,
            loop: true,
            slidesPerView: "auto",
            slidesPerGroup: 1,
            speed: 800,
            spaceBetween: 30,
            breakpoints: {
                768: {
                    slidesPerView: "auto",
                    slidesPerGroup: 1,
                    spaceBetween: 45,
                },
                1230: {
                    slidesPerView: "auto",
                    slidesPerGroup: 1,
                    spaceBetween: 60,
                },
            },
        });
    }

    // инициализация слайдера Акции sl-options
    if($(".sl-options__swiper").length > 0) {
        new Swiper(".sl-options__swiper", {
            roundLengths: true,
            watchOverflow: true,
            loop: true,
            slidesPerView: 1,
            slidesPerGroup: 1,
            speed: 800,
            spaceBetween: 20,
            navigation: {
                nextEl: ".sl-options-slider .slider-btn__next",
                prevEl: ".sl-options-slider .slider-btn__prev",
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
            }
        });
    }

    // задаем в карточках слайдера одинаковые высоты блоков с заголовком
    //if ($(".sl-options__swiper .sl-swiper-slide__title").length > 0) heightTitlSlPromotion(".sl-options__swiper .sl-swiper-slide__title");

    // переопределяем в карточках слайдера одинаковые высоты блоков с заголовком при изменении окна браузера
    //$(window).on("resize", () => { if ($(".sl-options__swiper .sl-swiper-slide__title").length > 0) heightTitlSlPromotion(".sl-options__swiper .sl-swiper-slide__title") });

    /**
     * Функция определие одинаковых высот заголовков карточек слайда
     */
    /*function heightTitlSlPromotion(s) {
        const titles = document.querySelectorAll(s);
        titles.forEach(el => el.style.height = "auto");
        let h = [];
        titles.forEach(el => h.push(el.offsetHeight));
        const max = h.reduce((a, b) => Math.max(a, b));
        titles.forEach(el => el.style.height = `${max}px`);
    }*/

});

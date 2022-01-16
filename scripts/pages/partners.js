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
});

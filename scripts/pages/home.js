import "../common/search";

import { scrollToBlock } from "../common/helpers";

$(document).ready(function () {

    /**
     * Delete anchor hash
     */
    const hash = document.querySelectorAll(".hash");
    if (document.querySelectorAll(".hash")) {
        hash.forEach((el) => el.addEventListener("click", () => setTimeout(() => history.replaceState(null, null, " "), 1), { passive: true }));
    }

    $("a[href^='#']:not([data-modal])").click(function (event) {
        event.preventDefault();
        scrollToBlock($(this).attr("href"));
    });

    // инициализация слайдера First
    if ($(".first__swiper").length > 0) {
        new Swiper(".first__swiper", {
            roundLengths: true,
            watchOverflow: true,
            loop: true,
            slidesPerView: 1,
            slidesPerGroup: 1,
            speed: 800,
            spaceBetween: 0,
            pagination: {
                el: ".first-slider .slider-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".first-slider .slider-btn__next",
                prevEl: ".first-slider .slider-btn__prev",
            },
        });
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

    // инициализация слайдера map-objects
    if ($(".map-objects__swiper").length > 0) {
        new Swiper(".map-objects__swiper", {
            roundLengths: true,
            slidesPerView: "auto",
            slidesPerGroup: 1,
            speed: 800,
            spaceBetween: 20,
            scrollbar: {
                el: ".map-objects-slider .swiper-scrollbar",
                draggable: true,
            },
            768: {
                slidesPerView: "auto",
                slidesPerGroup: 1,
            },
            1230: {
                slidesPerView: "auto",
                slidesPerGroup: 1,
            },
        });
    }
    // переключение пунктов меню слайдера map-objects
    $(".swiper-slide__link-objects").on("click", (e) => {
        $(".swiper-slide__link-objects").removeClass(
            "swiper-slide__link-objects-active"
        );
        $(e.target).addClass("swiper-slide__link-objects-active");
    });

    // инициализация слайдера Benefit
    if ($(".benefit__swiper").length > 0) {
        new Swiper(".benefit__swiper", {
            roundLengths: true,
            watchOverflow: true,
            loop: true,
            slidesPerView: 1,
            slidesPerGroup: 1,
            speed: 800,
            spaceBetween: 30,
            navigation: {
                nextEl: ".benefit-slider .slider-btn__next",
                prevEl: ".benefit-slider .slider-btn__prev",
            },
            pagination: {
                el: ".benefit-slider .slider-pagination",
                clickable: true,
            },
        });
    }

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

    // инициализация слайдера Спецпредложения по АРЕНДЕ sl-arenda
    if ($(".sl-arenda__swiper").length > 0) {
        new Swiper(".sl-arenda__swiper", {
            roundLengths: true,
            watchOverflow: true,
            loop: true,
            slidesPerView: 1,
            slidesPerGroup: 1,
            speed: 800,
            spaceBetween: 20,
            navigation: {
                nextEl: ".sl-arenda-slider .slider-btn__next",
                prevEl: ".sl-arenda-slider .slider-btn__prev",
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

    // задаем в карточках слайдеров одинаковые высоты блоков с заголовком
    if ($(".sl-prodazha__swiper .sl-swiper-slide__title").length > 0)
        heightTitle(".sl-prodazha__swiper .sl-swiper-slide__title");
    if ($(".sl-arenda__swiper .sl-swiper-slide__title").length > 0)
        heightTitle(".sl-arenda__swiper .sl-swiper-slide__title");

    // переопределяем в карточках слайдеров одинаковые высоты блоков с заголовком при изменении окна браузера
    window.onresize = () => {
        if ($(".sl-prodazha__swiper .sl-swiper-slide__title").length > 0)
            heightTitle(".sl-prodazha__swiper .sl-swiper-slide__title");
        if ($(".sl-arenda__swiper .sl-swiper-slide__title").length > 0)
            heightTitle(".sl-arenda__swiper .sl-swiper-slide__title");
    };

    /**
     * Функция определие одинаковых высот заголовков карточек слайда
     */
    function heightTitle(s) {
        const titles = document.querySelectorAll(s);
        titles.forEach((el) => (el.style.height = "auto"));
        let h = [];
        titles.forEach((el) => h.push(el.offsetHeight));
        const max = h.reduce((a, b) => Math.max(a, b));
        titles.forEach((el) => (el.style.height = `${max}px`));
    }

    /* ----------- Переключение табов в блоке КЛИЕНТЫ (clients) ----------*/

    $(".clients__tab-nav-item-1").on("click", () => {
        if (!$(".clients__container").hasClass("clietns__tab-1-active")) {
            $(".clients__container").removeClass("clietns__tab-2-active");
            $(".clients__container").addClass("clietns__tab-1-active");
        }
    });
    $(".clients__tab-nav-item-2").on("click", () => {
        if (!$(".clients__container").hasClass("clietns__tab-2-active")) {
            $(".clients__container").removeClass("clietns__tab-1-active");
            $(".clients__container").addClass("clietns__tab-2-active");
        }
    });

    /* ----------- Переключение табов в блоке НАШИ ОБЪЕКТЫ (objects) ----------*/

    $(".objects__tab-nav-item-1").on("click", () => {
        if (!$(".objects__block").hasClass("active-tab-1")) {
            $(".objects__block").removeClass("active-tab-2");
            $(".objects__block").addClass("active-tab-1");

            $(".search-reset").data("type", "prodazha");
        }
    });
    $(".objects__tab-nav-item-2").on("click", () => {
        if (!$(".objects__block").hasClass("active-tab-2")) {
            $(".objects__block").removeClass("active-tab-1");
            $(".objects__block").addClass("active-tab-2");

            $(".search-reset").data("type", "arenda");
        }
    });
});


/* ----------- Фильтр ----------*/

$(".objects__search-closer").on("click", function(e) {
    $(this).parent().toggleClass("objects__search-open");
    $(".search__inner").slideToggle(300);
});

$(window).on("resize", () => {
    filterPosition();

    $(".filter-block").removeClass("filter-active");
    $(".filter__content").slideUp(300);
});

filterPosition();
/**
 * Функция открывает/закрывает блок фильтра в зависимости от ширины экрана.
 */
function filterPosition() {
    $(".objects__search").removeClass("objects__search-open");
    if($(window).width() >= 768 ) $(".search__inner").css("display", "block")
        else $(".search__inner").css("display", "none");
}

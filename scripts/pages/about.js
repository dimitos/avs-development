$(document).ready(function () {

    /**
     * Delete anchor hash
     */
    const hash = document.querySelectorAll('.hash');
    if (document.querySelectorAll('.hash')) {
        hash.forEach((el) => el.addEventListener('click', () => setTimeout(() => history.replaceState(null, null, ' '), 1), { passive: true }));
    }

    $("a[href^='#']:not([data-modal])").click(function (event) {
        event.preventDefault();
        scrollToBlock($(this).attr("href"));
    });

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
});

/* ----------- Слайд-блок АКЦИИ (sl-promotion) ----------*/

    // инициализация слайдера Акции sl-promotion
    if($(".sl-promotion__swiper").length > 0) {
        new Swiper(".sl-promotion__swiper", {
            roundLengths: true,
            watchOverflow: true,
            loop: true,
            slidesPerView: 1,
            slidesPerGroup: 1,
            speed: 800,
            spaceBetween: 20,
            navigation: {
                nextEl: ".sl-promotion-slider .slider-btn__next",
                prevEl: ".sl-promotion-slider .slider-btn__prev",
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
    //if ($(".sl-promotion__swiper .sl-swiper-slide__title").length > 0) heightTitlSlPromotion(".sl-promotion__swiper .sl-swiper-slide__title");

    // переопределяем в карточках слайдера одинаковые высоты блоков с заголовком при изменении окна браузера
    //$(window).on("resize", () => { if ($(".sl-promotion__swiper .sl-swiper-slide__title").length > 0) heightTitlSlPromotion(".sl-promotion__swiper .sl-swiper-slide__title") });

    // открытие/закрытие меню фильтра в мобильной версии
    $(document).on("click", (e) => {
        if ($(".sl-promotion__tabs-icon").is(e.target) || $(".sl-promotion__tabs-icon svg").is(e.target)) {
            $(".sl-promotion__tabs-mobile").addClass("active");
        } else if ($(".sl-promotion__tab").is(e.target) || !$(".sl-promotion__tabs-mobile").is(e.target)) {
            $(".sl-promotion__tabs-mobile").removeClass("active");
        }
    });

    // отрисовка мобильной/десктопнуой версии Меню фильтра при загрузке страницы
    changeSelectorSlPromotionTabs();

    // закрытие меню фильтра в мобильной версии при переходе на десктоп версию при изменении размера окна браузера
    $(window).on("resize", changeSelectorSlPromotionTabs);

    // переключение пунктов меню
    $(".sl-promotion__tab").on("click", (e) => {
        $(".sl-promotion__tab").removeClass("sl-promotion__tab-active");
        $(e.target).addClass("sl-promotion__tab-active");
    })

    // ------------------ functions ------------------ //

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

    /**
     * Функция переключает Меню фильтра слайд-блока АКЦИИ (sl-promotion) в мобильную/десктопную версию
     */
    function changeSelectorSlPromotionTabs() {
        if($(window).width() >= 768 ) {
            if ($(".sl-promotion__tabs").hasClass("sl-promotion__tabs-mobile")) $(".sl-promotion__tabs").removeClass("sl-promotion__tabs-mobile");
            if ($(".sl-promotion__tabs").hasClass("active")) $(".sl-promotion__tabs").removeClass("active");
        } else if (!$(".sl-promotion__tabs").hasClass("sl-promotion__tabs-mobile")) $(".sl-promotion__tabs").addClass("sl-promotion__tabs-mobile");
    }

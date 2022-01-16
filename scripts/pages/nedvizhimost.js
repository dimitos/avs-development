import "../common/search";

/**
 * Delete anchor hash
 */
const hash = document.querySelectorAll(".hash");
if (document.querySelectorAll(".hash")) {
    hash.forEach((el) => el.addEventListener("click", () => setTimeout(() => history.replaceState(null, null, " "), 1), { passive: true }));
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

// инициализация слайдера Выбор фильтра
if ($(".filter-choice__slider").length > 0) {
    new Swiper(".filter-choice__slider", {
        roundLengths: true,
        slidesPerView: "auto",
        slidesPerGroup: 1,
        speed: 800,
        spaceBetween: 10,
    });
}

/* ----------- Меню фильтра блока property ----------*/
// открытие/закрытие меню фильтра в мобильной версии
$(document).on("click", (e) => {
    if ($(".inner-sorter__icon").is(e.target) || $(".inner-sorter__icon svg").is(e.target)) {
        $(".sort-mobile").addClass("active");
    } else if ($(".sort__item").is(e.target) || !$(".sort-mobile").is(e.target)) {
        $(".sort-mobile").removeClass("active");
    }
});

// отрисовка мобильной/десктопнуой версии Меню фильтра при загрузке страницы
changeSelectorSlPromotionTabs();

// закрытие меню фильтра в мобильной версии при переходе на десктоп версию при изменении размера окна браузера
$(window).on("resize", () => {
    changeSelectorSlPromotionTabs();
    //heightTitlSlPromotion(".list__item-title");
    $(".filter-block").removeClass("filter-active");
    $(".filter__content").slideUp(300);
});

// переключение пунктов меню сортировки
$(".sort__item").on("click", (e) => {
    $(".sort__item").removeClass("sort-select");
    $(e.target).addClass("sort-select");
})

/**
 * Функция переключает Меню сортировки блока property в мобильную/десктопную версию
 */
function changeSelectorSlPromotionTabs() {
    if($(window).width() >= 768 ) {
        if ($(".sort").hasClass("sort-mobile")) $(".sort").removeClass("sort-mobile");
        if ($(".sort").hasClass("active")) $(".sort").removeClass("active");
    } else if (!$(".sort").hasClass("sort-mobile")) $(".sort").addClass("sort-mobile");
}

//heightTitlSlPromotion(".list__item-title");
/**
 * Функция определие одинаковых высот заголовков карточек слайда
 */
/*function heightTitlSlPromotion(s) {
    if ($(".list").hasClass("list-string")) return;
    const titles = document.querySelectorAll(s);
    titles.forEach(el => el.style.height = "auto");
    let h = [];
    titles.forEach(el => h.push(el.offsetHeight));
    const max = h.reduce((a, b) => Math.max(a, b));
    titles.forEach(el => el.style.height = `${max}px`);
}*/

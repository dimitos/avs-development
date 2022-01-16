import { windowHeight } from "./global";

export let arcticmodal_settings = {
    overlay: {
        css: { opacity: 0.3 }
    },
    beforeOpen(data, modal) {
        let modalParent = $(modal).parent();
        let maxHg = windowHeight() - modalParent.padding("top") - modalParent.padding("bottom");
        $(modal).css("max-height", maxHg);
    }
};

$(document).ready(function() {
    window.alert = function(content) {
        $(".intopModal-alert .modal__inner").html(content).parents(".intopModal-alert").arcticmodal(arcticmodal_settings);
    }

    $(window).resize(function () {
        arcticmodal_settings.beforeOpen(null, ".intopModal:visible");
    });

    $("[data-modal]").click(function (event) {
        event.preventDefault();

        let $modal = $(".intopModal-" + $(this).data("modal"));

        if ($modal.length > 0) {
            $modal.arcticmodal(arcticmodal_settings);
        }
    });
});

/* ----------- Переключение табов в модалке Карта ----------*/
$(".filter-sale__nav-item-1").on("click", () => {
    if (!$(".filter-sale").hasClass("active-tab-1")) {
        $(".filter-sale").removeClass("active-tab-2");
        $(".filter-sale").addClass("active-tab-1");
    }
});
$(".filter-sale__nav-item-2").on("click", () => {
    if (!$(".filter-sale").hasClass("active-tab-2")) {
        $(".filter-sale").removeClass("active-tab-1");
        $(".filter-sale").addClass("active-tab-2");
    }
});


/* ----------- Слайдеры Фильтров модалки Карта ----------*/
let swiperFilterSale_1 = null;
let swiperFilterSale_2 = null;

initSliderFilterSale();
$(window).on("resize", initSliderFilterSale);

/**
 *  Функция активации/деактивации слайдеров Фильтра карты модалки
 */
function initSliderFilterSale() {
    if($(window).width() >= 1120 ) {
        // деактивация слайдеров Фильтра карты модалки
        if(swiperFilterSale_1) {
            swiperFilterSale_1.destroy();
            swiperFilterSale_1 = null;
        }

        if(swiperFilterSale_2) {
            swiperFilterSale_2.destroy();
            swiperFilterSale_2 = null;
        }
    } else {
        // активация слайдеров Фильтра карты модалки
        if ($(".filter-swiper-1").length > 0 && !swiperFilterSale_1) swiperFilterSale_1_init()
        if ($(".filter-swiper-2").length > 0 && !swiperFilterSale_2) swiperFilterSale_2_init()
    }
}

// определяем слайдер 1 Фильтра карты модалки
function swiperFilterSale_1_init() {
    swiperFilterSale_1 = new Swiper(".filter-swiper-1", {
        roundLengths: true,
        slidesPerView: "auto",
        slidesPerGroup: 1,
        speed: 800,
    });
}

// определяем слайдер 2 Фильтра карты модалки
function swiperFilterSale_2_init() {
    swiperFilterSale_2 = new Swiper(".filter-swiper-2", {
        roundLengths: true,
        slidesPerView: "auto",
        slidesPerGroup: 1,
        speed: 800,
    });
}


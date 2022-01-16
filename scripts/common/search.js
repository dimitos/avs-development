$(document).on("click", (e) => {
    // если клик не на общий блок фильтров и его дочерние элементы, то закрываем открытый блок фильтра
    if (!$(".filters").is(e.target) && $(".filters").has(e.target).length === 0) {
        $(".filter-block").removeClass("filter-active");
        $(".filter__content").slideUp(300);
    }
});

// при клике на отдельный блок фильтра
$(".filter__title").on("click", function(e) {
    e.preventDefault();
    var el = $(this).closest(".filter-block");

    // если кликнутый блок не является открытм, то закрываем открытый блок фильтра
    if (!el.hasClass("filter-active")) {
        $(".filter-block").removeClass("filter-active");
        $(".filter__content").slideUp(300);
    }

    // кликнутый блок открываем / закрываем
    el.toggleClass("filter-active");
    el.find(".filter__content").stop().slideToggle(300);
})

$(".price__square").on("click", function(e) {
    e.preventDefault();
    $(".price__square").toggleClass("selected");
})

// checkbox фильтра
$(".filter__item-checkbox").on("click", function(e) {
    e.preventDefault();
    if (!$(this).hasClass("selected")) {
        $(this).addClass("selected").siblings().removeClass("selected");
        updateSearch();
    }
})

$(".sort-list__item").on("click", function(e) {
    e.preventDefault();

    if(!$(this).hasClass("active")) {
        $(".sort-list__item").removeClass("active");
        $(this).addClass("active");
        $(".list").toggleClass("list-string");
    }
})

// range фильтры и строка поиска
$(".range__input-search, .filter__place-input").on("keyup", function(e) {
    if (e.key === "Enter") {
        window.location = $(".search-form__link").attr("href");
    } else {
        updateSearch();
    }
});

// Сбросить поиск
$(".search-reset").click(function() {
    let type = $(this).data("type");

    $(".range__input-search").val("");
    $(".filter__place-input").val("");
    $(".filter__item-checkbox").removeClass("selected").filter("[data-value='']").addClass("selected");
    $(".filter__item-checkbox[data-value='" + type + "']").addClass("selected");

    updateSearch();
});

// Обновление поиска
function updateSearch() {
    var $selectedCheckBoxes = $(".filter__item-checkbox.selected"),
        $range = $(".range-search"),
        $rangeInputs = $range.find(".range__input-search"),
        $searchInput = $(".filter__place-input");

    // Формируем url для поиска
    var url = "/nedvizhimost/";
    url += $selectedCheckBoxes.filter("[data-type='form']").data("value") + "/";
    if ($selectedCheckBoxes.filter("[data-type='type']").data("value")) {
        url += $selectedCheckBoxes.filter("[data-type='type']").data("value") + "/";
    }
    url += "?";
    $rangeInputs.each(function() {
        if ($(this).val()) {
            url += $(this).attr("name") + "=" + $(this).val() + "&";
        }
    });
    if ($searchInput.val()) {
        url += "search=" + $searchInput.val();
    }
    if ((url[url.length-1] === "?") || (url[url.length-1] === "&")) {
        url = url.substring(0, url.length - 1);
    }

    $(".search-form__link").attr("href", url);

    // Заполняем текст, показывающий выбранные элементы
    $selectedCheckBoxes.each(function() {
        let label = $(this).html();
        $(this).parents(".filter-block").find(".filter__chosen").html(label);
    });

    $range.each(function() {
        let from = $(this).find(".range__input-from").val(),
            to = $(this).find(".range__input-to").val(),
            unit = $(this).data("unit");
        if (from && to) {
            $(this).parents(".filter-block").find(".filter__chosen").html("от " + from + " до " + to + " " + unit);
        } else if (from) {
            $(this).parents(".filter-block").find(".filter__chosen").html("от " + from + " " + unit);
        } else if (to) {
            $(this).parents(".filter-block").find(".filter__chosen").html("до " + to + " " + unit);
        } else {
            $(this).parents(".filter-block").find(".filter__chosen").html("не выбрано");
        }
    });
}

updateSearch()

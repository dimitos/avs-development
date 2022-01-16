/**
 * Mobile menu
 */
function setHeightMobileMenu () {
    $(".menu__content").css({"height": window.innerHeight});
}
setHeightMobileMenu();
$(window).resize(() => setHeightMobileMenu());

const closeMobileMenu = () => {
    $(".header__menu").css({"right": "-450px"});
    $(".header__menu").removeClass("mobile__menu");
    $(".header__btn-menu").removeClass("open__btn");
    $(".page").css({"overflow": "initial"});
}

const openMobileMenu = () => {
    $(".header__menu").css({"right": "0"});
    $(".header__menu").addClass("mobile__menu");
    $(".header__btn-menu").addClass("open__btn");
    $(".page").css({"overflow": "hidden"});
}

$(document).on("click", (e) => {
    if($(".menu__item-link").is(e.target) && !$(e.target).parent().hasClass("menu__item-submenu")) {
        closeMobileMenu()
    }

    if ($(".submenu__item-link").is(e.target)) {
        closeMobileMenu();
    }

    if ($(".header__btn-menu").is(e.target) && !$(".header__menu").hasClass("mobile__menu")) {
        openMobileMenu();
    } else if ($(".header__btn-menu").is(e.target) && $(".header__menu").hasClass("mobile__menu")) {
        closeMobileMenu();
    }

    if ($(".menu__item-submenu").is($(e.target).parent()) && !$(e.target).parent().hasClass("submenu-active")) {
        $(e.target).parent().addClass("submenu-active");
    } else if ($(".menu__item-submenu").hasClass("submenu-active")) {
        $(".menu__item-submenu").removeClass("submenu-active");
    }
});

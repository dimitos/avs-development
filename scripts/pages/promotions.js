/*
import {scrollToBlock} from "../common/helpers";

$(document).ready(function () {

    // задаем в карточках слайдеров одинаковые высоты блоков с заголовком
    if ($(".list-pane .list__item-title").length > 0)
        heightTitle(".list-pane .list__item-title");

    // переопределяем в карточках слайдеров одинаковые высоты блоков с заголовком при изменении окна браузера
    window.onresize = () => {
        if ($(".list-pane .list__item-title").length > 0)
            heightTitle(".list-pane .list__item-title");
    }

    //Функция определения одинаковых высот заголовков карточек слайда
    function heightTitle(s) {
        const titles = document.querySelectorAll(s);
        titles.forEach((el) => (el.style.height = "auto"));
        let h = [];
        titles.forEach((el) => h.push(el.offsetHeight));
        const max = h.reduce((a, b) => Math.max(a, b));
        titles.forEach((el) => (el.style.height = `${max}px`));
    }
});
*/

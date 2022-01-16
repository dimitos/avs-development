{extends "modal/modal.tpl"}

{block main}
    <div class="modal-header">
        <picture>
            <source srcset="/img/modal/transition-767.webp" media="(max-width: 767px)" type="image/webp" />
            <source srcset="/img/modal/transition-1920.webp" type="image/webp" />
            <source srcset="/img/modal/transition-767.jpg" media="(max-width: 767px)" />
            <img class="image cover"
                src="/img/modal/transition-1920.jpg"
                alt="Оставить заявку"
                width="650"
                height="263"
                loading="lazy"
                decoding="async" />
        </picture>
        <h3 class="title transition-title">Желаете перейти в раздел поиска недвижимости?</h3>
    </div>
    <div class="modal-footer">
        <button class="btn btn-default btn-main2-main2" type="button">
            <span class="btn__text">Перейти</span>
        </button>
        <button class="btn btn-default btn-transparent-main2 arcticmodal-close" type="button">
            <span class="btn__text">Закрыть</span>
        </button>
    </div>
{/block}

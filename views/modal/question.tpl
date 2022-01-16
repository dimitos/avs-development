{extends "modal/modal.tpl"}

{block main}
    <div class="modal-header">
        <h3 class="title question-title">Здравствуйте, Вы арендатор?</h3>
    </div>
    <div class="modal-footer">
        <button class="question-btn btn btn-default btn-main1-main1" type="button" data-modal="request-repair">
            <span class="btn__text">ДА</span>
        </button>
        <button class="question-btn btn btn-default btn-transparent-main1 js-request" type="button" data-h="Узнать подробности об аренде" data-btn="Узнать об аренде" data-from="Кнопка: узнать об аренде">
            <span class="btn__text">НЕТ</span>
        </button>
    </div>
{/block}

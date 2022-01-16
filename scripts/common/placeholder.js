/* ----------- Placeholder (*) работа input со * в плейсхолдере ----------*/

$(".input__default").focus(function () {
    $(this).closest(".input__item").find("label").hide();
});

$(".input__default").blur(function () {
    if ($(this).val().trim() === "")
        $(this).closest(".input__item").find("label").show();
});

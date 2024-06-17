$(document).ready(function(){
    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    })
})


function readURL(input) {
    if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
            document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview').src = "";
    }
}

function back(){
    history.back();
}

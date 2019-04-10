$('.mr-auto').on('click','li', function(){
    $('.mr-auto li.active').removeClass('active');
 });

 function confirmTorles(redirectUrl) {
    var r = confirm("Biztos hogy törolni szeretnéd?");
    if (r) {
        // we redirect
        window.location.href = redirectUrl;
    }
}
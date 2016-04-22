// some simple and cool JS you can use for forms

$(document).ready(function() {

    tabSelectListener();



});

  var tabSelectListener = function(){
    $('.tabs li a').on('click', function(event) {
      event.preventDefault();
      $('.active').removeClass('active');
      $(this).parent().addClass('active');
      if ($(this).attr("id") == "current"){ //detection for current tab
     return
     // returns tab content
    }
    else{
    $(".tab-content").hide(); //Hide all content
    $(".tabs li").attr("id",""); //Reset id's
    $(this).parent().attr("id","current"); // Activate this
    $( $(this).attr('href')).fadeIn();
  }

  });
};


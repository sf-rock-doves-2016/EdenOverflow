
$(document).ready(function() {

    tabSelectListener();
    questionCommentButtonListener();
    // questionCommentSubmitListener();
    // answerCommentButtonListener();


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
    $(".content").hide(); //Hide all content
    $(".tabs li").attr("id",""); //Reset id's
    $(this).parent().attr("id","current"); // Activate this
    $( $(this).attr('href')).fadeIn();
  }

  });
};

  var questionCommentButtonListener = function(){
    $('#question_comment_button').on('click', function(event){
      event.preventDefault();
      console.log($(this).children().children().attr('href'))

      $.ajax({
        url: $(this).children().children().attr('href'),
        method: 'get'
      }).done(function(response) {

        $("#comment-box").prepend(response);
        $("#question_comment_button").hide();

      }).fail(function(response) {
        console.log("whoops")
      })
    })
  }

  // var questionCommentSubmitListener = function(){
  //   $('#comment-box > form > input[type="submit"]:nth-child(8)').on("click", function(e){
  //     e.preventDefault();
  //   })
  // }

  // var answerCommentButtonListener = function(){
  //   $('#answer_comment_button').on('click', function(event){
  //     event.preventDefault();
  //     $.ajax({
  //       url: $(this).attr('href'),
  //       method: 'get'
  //     }).done(function(response) {
  //       console.log(response)
  //     })
  //   })
  // }



document.addEventListener("turbolinks:load", function () {
  $(function() {
    $('#back a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 800);
      event.preventDefault();
    });
  });
  $(function(){
    $('.headerlink').mouseover(function(){
      $(this).addClass('bigmove');
    });
    $('.headerlink').mouseout(function(){
      $(this).removeClass('bigmove');
    });
  });
  $(function(){
    $('.username').mouseover(function(){
      $(this).addClass('bigmove');
    });
    $('.username').mouseout(function(){
      $(this).removeClass('bigmove');
    });
  });
});
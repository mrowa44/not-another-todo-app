$(document).ready(function(){
  $('.jumbotron h2').fadeIn('slow');
  $('.jumbotron h2').removeClass('hidden');

   setTimeout(function(){
     $('.jumbotron h3').fadeIn("slow");
     $('.jumbotron h3').removeClass('hidden');
   },700);

   setTimeout(function(){
     $('.jumbotron h4').fadeIn("slow");
     $('.jumbotron h4').removeClass('hidden');
   },2000);

   setTimeout(function(){
     $('.jumbotron p').fadeIn("slow");
     $('.jumbotron p').removeClass('hidden');
   },3000);

   setTimeout(function(){
     $('.jumbotron ul').fadeIn("slow");
     $('.jumbotron ul').removeClass('hidden');
   },3500);

});

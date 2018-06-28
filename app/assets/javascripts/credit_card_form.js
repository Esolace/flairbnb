$(document).on("turbolinks:load", function() {
      alert("ran")
      var show_error, stripeResponseHandler, submitHandler;
 
      submitHandler = function (event) {
 
      var $form = $(event.target);
 
      $form.find("input[type=submit]").prop("disabled", true);
 
  

 
  
if(Stripe){
 
       Stripe.card.createToken($form, stripeResponseHandler);
 
 } else { 
        $('#stripe').show();
 
        $('#stripe').text("Error! Please refresh your page.");
 
 }
 
 return false;
 
 };
 
  
$(".cc_form").on('submit', submitHandler); 
 
      stripeResponseHandler = function (status, response) {
 
      var token, $form;
 
       $form = $('.cc_form');
 
       if (response.error && response.error.type == 'card_error' ) { 
 
              $('#stripe').show();
 
              if (response.error.type == 'card_error' ){
 
              $('#stripe').text("Credit Card number invalid.");
 
              }
 
              $form.find("input[type=submit]").prop("disabled", false);
 
       } else {
 
              $('#stripe').hide();
 
              token = response.id;
 
              $form.append($("<input type=\"hidden\" name=\"payment[token]\" />").val(token));
 
              $("[data-stripe=number]").remove();
 
              $("[data-stripe=cvv]").remove();
 
              $("[data-stripe=exp-year]").remove();
 
              $("[data-stripe=exp-month]").remove();
 
              $("[data-stripe=label]").remove();

              debugger
 
              $form.get(0).submit();
 
 }
 
 return false;
 
 };
 
 });
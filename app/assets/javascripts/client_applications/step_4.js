$(document).ready(function() {

  var client_owes_money_race_other_text = $("#client_owes_money_race_other_text");
  var client_owes_money_race_other = $("#client_owes_money_race_other");
  var other_race_div = $("#other_race_div");

  $("#owes_money_race_div").find('input[type="radio"]').on('click', function(){
    if($('input[name="' + $(this).attr('client[owes_money_race_other]') + '"]')){
      if(client_owes_money_race_other.prop("checked")){
        other_race_div.show();
      }else{
        other_race_div.hide();
      }
    }
  });

  //Change the value of the other radio button to the appropriate race to pass to the database
  client_owes_money_race_other_text.on("focusout", function(){
     if(client_owes_money_race_other.prop("checked"))
       client_owes_money_race_other.val(this.value);
  });





});

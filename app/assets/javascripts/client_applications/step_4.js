$(document).ready(function() {

  var client_owes_money_race_other_text = $("#client_owes_money_race_other_text");
  var client_owes_money_race_other = $("#client_owes_money_race_other");

  //Change the value of the others radio button to the appropriate race to pass to the database
  client_owes_money_race_other_text.on("focusout", function(){
     if(client_owes_money_race_other.prop("checked"))
       client_owes_money_race_other.val(this.value);
  });



});

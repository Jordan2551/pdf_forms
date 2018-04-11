$(document).ready(function() {

  var client_owes_money_race_other_text = $("#client_owes_money_race_other_text");
  var client_owes_money_race = $("#owes_money_race");

  var other_race_div = $("#other_race_div");

  client_owes_money_race_other_text.on("focusin", function(){
     $("#owes_money_race_div").find('input[type="radio"]').each(function(index, el) {
       el.checked = false;
     });
  });

  client_owes_money_race_other_text.on("focusout", function(){
      client_owes_money_race.val(this.value);
  });

  $("#owes_money_race_div").find('input[type="radio"]').on('click', function(){
      if($('input[name="' + $(this).attr('client[owes_money_race_rb]') + '"]')){
        client_owes_money_race_other_text.val('');
        client_owes_money_race.val(this.value);
      }
  });

});

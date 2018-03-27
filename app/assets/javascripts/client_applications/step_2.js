$(document).ready(function(){

  $("#client_alimony_child_support_required").on("click", function(){
    if(this.checked){
      $("#alimony_fields").show();
      $("#cannot_assist_msg_div").hide();
    }
    else{
      $("#alimony_fields").hide();
      $("#cannot_assist_msg_div").show();
    }
  })

  $("#client_how_much_money_owed").on("focusout", function(){
      var amount = $("#client_how_much_money_owed").val();
      if($.isNumeric(amount)){
        var amountFloat = parseFloat(amount);
        if(amountFloat < 5000){
          $("#min_amount_msg_div").show();
          $("#min_amount_msg").html('To hire Support Solutions for your unpaid support needs a minimum amount of unpaid support must be owed. Because of the $750 cost for an investigation, court costs and filing fees, at least $5,000.00 is required to ensure that collection will be beneficial to you. If your unpaid support eventually surpasses $5,000.00, please contact us at that time.');
        }
        else{
          $("#min_amount_msg_div").hide();
          $("#min_amount_msg").html('');
        }
      }
      else{
        $("#min_amount_msg_div").show();
        $("#min_amount_msg").html('Amount must be a number. $ and , cannot be used. <br> For example, 5000 and 7500.50 are both in the correct format.');
      }
  });

  $("#client_receiving_public_assistance").on("click", function(){
    if(this.checked)
      $("#public_assistance_fields").show();
    else
      $("#public_assistance_fields").hide();
  })

});

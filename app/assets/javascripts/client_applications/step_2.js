$(document).ready(function() {

  $("#client_alimony_child_support_required").on("click", function(){
    if(this.checked){
      $("#alimony_fields").show();
      $("#cannot_assist").hide();
    }
    else{
      $("#alimony_fields").hide();
      $("#cannot_assist").show();
    }
  })
});

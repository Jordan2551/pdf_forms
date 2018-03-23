
$(document).ready(function() {
  $("#client_alimony_child_support_required").on("click", function(){
      //possible issue: dynamic js doesn't bind events to generated js
      alert("j");
      $("#alimony_fields").toggle(this.checked);
  })
});

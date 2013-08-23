
$( document ).ready(function() {

	$('a.delete_user').click(function(e){
		e.preventDefault();
		var user_id = $(this).parent().siblings('.user_id').val();
		$.ajax({
		  type: "PUT",
		  url: "users/"+user_id+"/delete_status",
		  context: $(this),
		  success: function(data){
		  	if(data.status=="saved"){
      		$(this).parent().closest('tr').fadeOut();
      	}
      	else{
      		console.log("problems saving the user status");
      	}
   		},
     	error: function(data){
     	}
   	});
   	return false
	});

});

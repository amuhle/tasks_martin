
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
      	else if(data.status=="unsaved"){
      		console.log("problems saving the user status");
      	}
        else{
          alert("Not authorized to delete the User");
        }
   		},
     	error: function(data){
     	}
   	});
   	return false
	});

});

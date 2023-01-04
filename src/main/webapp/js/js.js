/**
 * 
 */

$(document).ready(function(){
	var fileTarget = $('.fileUpload-input');
	
	fileTarget.on('change', function(){
	if(window.FileReader){
		var fileName = $(this)[0].files[0].name;
	}
	else{
		var fileName = $(this).val().split('/').pop().split('\\').pop();
	}
	
	$(this).siblings('.upload-name').val(fileName);

	});
});
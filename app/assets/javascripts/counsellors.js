$(document).ready(function(){
	$("#counsellor-profile").change(function(){
	    readURL(this);
	});
});

function readURL(input) {
	if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	        $('#profile').attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	}
}
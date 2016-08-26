$(document).ready(function(){
	$(".settings-div img").click(function(){
		$(".settings-list").fadeToggle();
	});
	$(".message").click(function(){
		$(".ChatSummary1").fadeIn();
	});
	$("span.closeC").click(function(){
		$(".ChatSummary1").fadeOut();
	});
	
	$(".message2").click(function(){
		$(".ChatSummary2").fadeIn();
	});
	$("span.closeC1").click(function(){
		$(".ChatSummary2").fadeOut();
	});
	
	$(".message3").click(function(){
		$(".ChatSummary3").fadeIn();
	});
	$("span.closeC2").click(function(){
		$(".ChatSummary3").fadeOut();
	});
	
	$(".message4").click(function(){
		$(".ChatSummary4").fadeIn();
	});
	$("span.closeC3").click(function(){
		$(".ChatSummary4").fadeOut();
	});

	

	
	
});

	
	
	
	
//------------------------------------------//

    $('#example').DataTable({
        language: {
            searchPlaceholder: 'Search records',
            sSearch: '',
            sLengthMenu: 'Show _MENU_',
            sLength: 'dataTables_length',
            oPaginate: {
                sFirst: '<i class="icon icon-left-chevron"></i>',
                sPrevious: '<i class="icon icon-left-chevron"></i>',
                sNext: '<i class="icon icon-right-chevron"></i>',
                sLast: '<i class="icon icon-right-chevron"></i>' 
        }
        }
    });
    $('.dataTables_length select').addClass('browser-default');
	
/* ============ */
$(function() {

  // We can attach the `fileselect` event to all file inputs on the page
  $(document).on('change', ':file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
  });

  // We can watch for our custom `fileselect` event like this
  $(document).ready( function() {
      $(':file').on('fileselect', function(event, numFiles, label) {

          var input = $(this).parents('.input-group').find(':text'),
              log = numFiles > 1 ? numFiles + ' files selected' : label;

          if( input.length ) {
              input.val(log);
          } else {
              if( log ) alert(log);
          }

      });
  });
  
});



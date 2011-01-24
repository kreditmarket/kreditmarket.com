// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function showStep(stepNo) {
    $('.b-form-sheet').each(function(el){ $(this).removeClass('selected'); });
    $('#step'+stepNo).addClass('selected');

    $('.step-links').each(function(el){ $(this).removeClass('selected'); });
    $('li#stepLink'+stepNo).addClass('selected');
}

$(document).ready(function(){	
	$("#request_is_as_reg").click(function() {
		if (this.checked) {
			$("#request_fact_flat").attr('value', $("#request_reg_flat").val());
		  	$("#request_fact_region").attr('value', $("#request_reg_region").val());
	      	$("#request_fact_city").attr('value', $("#request_reg_city").val());
	      	$("#request_fact_street").attr('value', $("#request_reg_street").val());
	      	$("#request_fact_house").attr('value', $("#request_reg_house").val());
	      	$("#request_fact_building").attr('value', $("#request_reg_building").val());
	      	$("#request_fact_flat").attr('value', $("#request_reg_flat").val());
	      	$("#request_fact_st_phone").attr('value', $("#request_reg_phone").val());
		}
		else {
			$("#request_fact_flat").attr('value', '');
		  	$("#request_fact_region").attr('value', '');
	      	$("#request_fact_city").attr('value', '');
	      	$("#request_fact_street").attr('value', '');
	      	$("#request_fact_house").attr('value', '');
	      	$("#request_fact_building").attr('value', '');
	      	$("#request_fact_flat").attr('value', '');
	      	$("#request_fact_st_phone").attr('value', '');
		}
	});
	
	$('#goto5-bnt').click(function() {
        showStep(5);
        $('body').stop().scrollTo( $('#goto5-lnk') , 500 );
        // window.location = $('#current-url').val()+'#shag-25';
    });
	$('#goto4-bnt').click(function() {
        showStep(4);
        $('body').stop().scrollTo( $('#goto4-lnk') , 500 );
        // window.location = $('#current-url').val()+'#shag-4';
    });
	$('#goto3-bnt').click(function() {
        showStep(3);
        $('body').stop().scrollTo( $('#goto3-lnk') , 500 );
        // window.location = $('#current-url').val()+'#shag-3';
    });
    $('#goto2-bnt').click(function() {
        showStep(2);
        $('body').stop().scrollTo( $('#goto2-lnk') , 500 );
        // window.location = $('#current-url').val()+'#shag-2';
    });
    $('#goto1-bnt').click(function() {
        showStep(1);
        $('body').stop().scrollTo( $('#goto1-lnk') , 500 );
        // window.location = $('#current-url').val()+'#shag-1';
    });
    
    $('#goto1-lnk').click(function() {
        showStep(1);
        // window.location = $('#current-url').val()+'#shag-1';
    });
    $('#goto2-lnk').click(function() {
        showStep(2);
        // window.location = $('#current-url').val()+'#shag-2';
    });
	$('#goto3-lnk').click(function() {
        showStep(3);
        // window.location = $('#current-url').val()+'#shag-2';
    });
	$('#goto5-lnk').click(function() {
        showStep(4);
        // window.location = $('#current-url').val()+'#shag-2';
    });
	$('#goto5-lnk').click(function() {
        showStep(5);
        // window.location = $('#current-url').val()+'#shag-2';
    });
});
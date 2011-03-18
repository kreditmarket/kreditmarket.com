// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function showStep(stepNo) {
    $('.b-form-sheet').each(function(el){ $(this).removeClass('selected'); });
    $('#step'+stepNo).addClass('selected');

    $('.step-links').each(function(el){ $(this).removeClass('selected'); });
    $('li#stepLink'+stepNo).addClass('selected');
}

$(document).ready(function() {
	$(".overlay_wrapper > input").focusin(function() {
		$("label[for="+ this.id +"]").addClass("focus");
	})
	.blur(function() {
		if (this.value == "") {
			$("label[for="+ this.id +"]").removeClass("focus").show();
		}		
	})
	.keypress(function() {
		if (event.keyCode == Event.KEY_TAB) return;
		$("label[for="+ this.id +"]").hide();
	});
	
	$(".signup-signin").click(function() {
		$(".userbar-layer").toggle();
	});
	
	$("#submit1").click(function() {
		$("#step-1").hide();
		$("#step-2").show();
		
		return false;
	});
	
	$("#submit2").click(function() {
		$("#step-1").hide();
		$("#step-2").show();
		
		return false;
	});
	
	$("#submit3").click(function() {
		$("#step-1").hide();
		$("#step-2").show();
		
		return false;
	});
	
	$("span.recalc").click(function() {
		$("#step-1").show();
		$("#step-2").hide();
		
		return false;
	});
	
	$(".b-form-button-submit").click(function() {
		$(this).closest("form").submit();
	});
	
	var defaultAmountValue = 3000;
	var defaultDaysValue = 10;
	var feePercent = 0.02;
	
	// Setting hidden fields default value
	$("body").find("#request_amount").attr('value', defaultAmountValue);
	$("body").find("#request_days").attr('value', defaultDaysValue);
		
	/***
	// Money
	***/	
	$("#data-picker-amount").slider({
		value: defaultAmountValue,
		min: 1000,
		max: 10000,
		step: 1000,
		slide: function(event, ui){
			var amount = ui.value;
			$("body").find("#request_amount").attr('value', amount);
			
			recalculate();
		}
		
	});
	
	$("#data-picker-minus-amount").click(function() {
		var amountSlider = $("#data-picker-amount");
		
		var value = amountSlider.slider("value");
		var step = amountSlider.slider("option", "step");
		var amount = value - step;
		
		amountSlider.slider("option", "value", amount);
		$("body").find("#request_amount").attr('value', amount);
		
		recalculate();
	});
	
	$("#data-picker-plus-amount").click(function() {
		var amountSlider = $("#data-picker-amount");
		
		var value = amountSlider.slider("value");
		var step = amountSlider.slider("option", "step");
		var amount = value + step;
		
		amountSlider.slider("option", "value", amount);
		$("body").find("#request_amount").attr('value', amount);
		
		recalculate();
	});
	
	$("#request_amount").change(function(){
		var Slider = $("#data-picker-amount");
		$("body").find("#request_amount").attr('value', $(this).val());
		
		if ($(this).val() > 10000) {
			alert("Сумма займа не может превышать десяти тысяч рублей.");
			$(this).attr("value", defaultAmountValue);
			Slider.slider("option", "value", defaultAmountValue);
			
			recalculate();
			
			return false;
		} else if($(this).val() < 1000) {
			alert("Сумма займа не может быть менее тысячи рублей.");
			$(this).attr("value", defaultAmountValue);
			Slider.slider("option", "value", defaultAmountValue);
			
			recalculate();
			
			return false;
		}	
		
		Slider.slider("option", "value", $(this).val());
		
		recalculate();
	});	
	
	/***
	// Days
	***/
	$("#request_days").attr('value', '10');
	$("#data-picker-days").slider({
		value: defaultDaysValue,
		min: 7,
		max: 14,
		step: 1,
		slide: function(event, ui){
			var amount = ui.value;
			$("body").find("#request_days").attr('value', amount);
			
			recalculate();
		}
		
	});
	
	$("#data-picker-minus-day").click(function() {
		var amountSlider = $("#data-picker-days");
		
		var value = amountSlider.slider("value");
		var step = amountSlider.slider("option", "step");
		var amount = value - step;
		
		amountSlider.slider("option", "value", amount);
		$("body").find("#request_days").attr('value', amount);
		
		recalculate();
	});
	
	$("#data-picker-plus-day").click(function() {
		var amountSlider = $("#data-picker-days");
		
		var value = amountSlider.slider("value");
		var step = amountSlider.slider("option", "step");
		var amount = value + step;
		
		amountSlider.slider("option", "value", amount);
		$("body").find("#request_days").attr('value', amount);
		
		recalculate();
	});
	
	$("#request_days").change(function(){
		var Slider = $("#data-picker-days");
		$("body").find("#request_days").attr('value', $(this).val());
					
		if ($(this).val() > 14) {
			alert("Займ не выдается на срок более чем 14 дней.");
			Slider.slider("option", "value", defaultDaysValue);				
			$(this).attr("value", defaultDaysValue);
			
			recalculate();
			
			return false;
		} else if($(this).val() < 7) {
			alert("Займ не выдается на срок менее чем 7 дней.");
			Slider.slider("option", "value", defaultDaysValue);
			$(this).attr("value", defaultDaysValue);
			
			recalculate();
			
			return false;
		}
		
		Slider.slider("option", "value", $(this).val());		
		
		recalculate();	
	});	
	
	/***
	// Results
	***/
	var recalculate = function() {
		var primaryAmount = $("#request_amount").val();
		var daysCount = $("#request_days").val();
		var feePerDay = primaryAmount * feePercent;
		var fees = feePerDay * daysCount;
		var secondaryAmount = fees + parseInt(primaryAmount);
		
		$(".primary-count").html(primaryAmount + ' руб.');
		$(".fees").html(fees + ' руб.');
		$(".secondary-count").html(secondaryAmount + ' руб.');
	};

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
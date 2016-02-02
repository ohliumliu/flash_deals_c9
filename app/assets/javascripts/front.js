	function showAlert() {
//	  if (trim($("#inputAlert").html())=="") {
//		if ($("#login").size()==1) {
//			msg='<font color="red">Please login first if you have not done so. </font><br /><br />';
//			$("#inputAlert").html(msg);			
//		} else {
			getAlerts();
//			$("#inputAlert").removeClass("hide");
//		}
//	  } else {
//		  $("#inputAlert").html("");
//	  }
	}
	
	function jsTest(obj){
		alert(obj);
	}
	
	function addAlert() {
		if (trim($("#alertKw").val())=="") {
			alert("Please enter a valid keyword");
			return 0;
		}
		 $.ajax({
			 type: "POST",
			 beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			 url: "/alerts/create.json",
			 data: "alertKw=" + $("#alertKw").val(),
			 success: function(data){
			 	showAllAlerts(data.alerts);
 				
			 }
		}); 		
	}

	function getAlerts() {
		 $.ajax({
			 type: "POST",
			 url: "/coupon/get-alerts",
			 success: function(data){
			 	$("#inputAlert").html(data);
			 }
		}); 		
	}

	function editAlert(id) {
		 $.ajax({
			 type: "POST",
			 url: "/coupon/edit-alert/",
			 data: "id=" + id,
			 success: function(data){
			 	$("#inputAlert").html(data);
			 }
		}); 		
	}

	function deleteAlert(id) {
		 $.ajax({
			 type: "POST",
			 url: "/coupon/delete-alert/",
			 data: "id=" + id,
			 success: function(data){
//			 	$("#inputAlert").html("");
			 	getAlerts();
			 	//$("#inputAlert").append(data);
			 }
		}); 		
	}

	function searchDeals() {
		if (trim($("#search").val())=="") {
			alert("Please enter something to search for");
			return 0;
		}
		 $.ajax({
			 type: "GET",
			 beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			 url: "/show/search.html",
			 data: "search=" + $("#search").val(),
			 //dataType: "text",
			 success: function(data){
//			 	$("#inputAlert").html("");
				$("#contentCenter").html(data);
				/*
				$("span.page:nth-child(2) > a:nth-child(1)").click(function(){
					$(this).slideUp();
				})
				*/
				//this ajax call works, but need to loop all elements of the pagination nav the url dynamically
				$("span.page:nth-child(2) > a:nth-child(1)").click(function(){
					//$(this).hide();
					alert("new call");
					$.ajax({
						type: "GET",
						beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
						//url: "/show/search.html?page=1&search=bluetooth",
						url: $(this).attr("href"),
						success: function(data){
							$("#contentCenter").html(data);
						}
					});
					//updatePageLink($(this).attr("href"));
	
				});
				// this line works
				//$("span.page:nth-child(2) > a:nth-child(1)").attr("data-remote", "false");
			 }
		}); 		
		return false;
	}
	/* this block works, but the url is not what we need. missing search params */	
	/* this function is probably redundant */
	function updatePageLink(url){
				return function(){
					alert("new call");
					$.ajax({
						type: "GET",
						beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
						url: "/show/search.html?page=1&search=bluetooth",
						success: function(data){
							$("#contentCenter").html(data);
						}
					});
				};	
	}	
	function list_merchant_products(id){
		$.ajax({
			type: "GET",
			beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			url: "/merchants/" + id +".html", 
			//url: "/merchants.html",
			//data: "merchant_id=2", 
			//data: "",
			dataType: "html",
			success: function(data){	
				$("#contentCenter").html(data);
			}	
		});
		return false;
	}


	function trim(str, chars) {
		return ltrim(rtrim(str, chars), chars);
	}
	 
	function ltrim(str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
	}
	 
	function rtrim(str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
	}
	
	function submitDeal() {
		if (trim($("#submitDeal").val())=="") {
			alert("Please enter a valid Deal");
			return 0;
		}
		 $.ajax({
			 type: "POST",
			 beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			 url: "/coupons/submit_deal.text",
			 data: "submitDeal=" + $("#submitDeal").val(),
			 //dataType: 'text',
			 success: function(data){
			 	$("#submitDealReturnText").html(data);
		alert("deals added!");
			 }
		}); 		
	}

	function signin( ){
		 //alert("signin");
		 $.ajax({
			 type: "POST",
			 beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			 url: "/user/signin.json",
			 data: {
				"username": $("#signinname").val(),
				"password": $("#signinpassword").val(),
				//"password": "test",
				//"password": $("div.signinText:nth-child(3)").val(),
				"check": "1"
		        },
		        dataType: "json",
			success: function(data){
			//var obj = jQuery.parseJSON(data);
			// data is already a JS object. No need to parse
			if (data.status === "signin") {
				$("#signupboxTop").html("Welcome " + data.user.name);
			    $("#signupboxBody").hide();
			    $("#profileBody").show();
				showAllAlerts(data.alerts);
			}else if (data.status === "fail")
			$("#signupboxTop").html("Wrong Password/Username");
			//alert(data.name);
			 }
		}); 
		return false;
	}
	
	function showAllAlerts(alerts){
		$("#allAlerts").html("");	
		for (var i = 0; i<alerts.length; i++){
			var $alertItem = $('<span/>', {
        			text: alerts[i].content,
        			id: 'alert'+alerts[i].id
    			});
			var $deleteButton = $('<button/>', {
        			text: 'Delete',
        			click: deleteFactory(alerts[i])
    			});
			$("#allAlerts").append("<br>").append($alertItem).append("<br>").append($deleteButton);
		}
	}

	function deleteFactory(alertItem){
		return function(){
		
		$.ajax({
			 type: "POST",
			 beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			 url: "/alerts/delete.json",
			 data: {
				"id": alertItem.id,
		        },
		        dataType: "json",
			success: function(data){
			//var obj = jQuery.parseJSON(data);
			// data is already a JS object. No need to parse
			showAllAlerts(data.alerts);
			}
		}); 
		}
	}

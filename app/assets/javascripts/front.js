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

	function searchDeals(url) {
		//the following line sets the default value of url. See http://stackoverflow.com/questions/6486307/default-argument-values-in-javascript-functions
		url = typeof url === 'undefined' ? "":url;
		if (trim($("#search").val())=="") {
			alert("Please enter something to search for");
			return false;
		}
		if (url==""){
			url = "/show/search.html?search=" + $("#search").val();
		}
		
		 $.ajax({
			 type: "GET",
			 beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			 url: url,
			 //data: "search=" + $("#search").val(),//data can be lumped into url
			 //dataType: "text",
			 success: function(data){
				//alert("searching");
				$("#contentCenter").html(data);
				
				//this ajax call works, but need to loop all elements of the pagination nav the url dynamically
				//pagainate also supports extra parameters to include custom html tages, but it needs to be done in view and applies to all the request.
				//So it is not suitable here. Unless there is a pagination options defined as instance variable by controller.
				$(".pagination").find("a").each(function(){
					$(this).click(function(){
						searchDeals($(this).attr("href"));
					});
				});
	
				}
			});
			// this line works
			//$("span.page:nth-child(2) > a:nth-child(1)").attr("data-remote", "false");
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
			var submitTip = new Opentip($('#submitDeal'), "please submit deals", {delay: 2, showOn: null});
			submitTip.show();
			$('#submitDeal').focus(function(){submitTip.hide()});
			//$("#submitDeal").opentip("Please enter contents", { delay: 2, showOn: null }).show();
			//alert("Please enter a valid Deal");
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
				//alert("deals added!");
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
			    //$('meta[name="csrf-token"]').attr('content', data.token);
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
	
	function click_history(pid, uid){
		alert("save click history");
		//uid = 24;
		$.ajax({
			method: "GET",
        	beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        	url: "products/product_click.json",
        	data: {
        		"id": pid,
        		"uid": uid
        	},
        	dataType: "json",
        	success: function(data){
             //process data
            	alert(data);
        	}
			
		});
		alert("saved.");
		return false;
	}

	function click_history_factory(product_id, uid){
		return function(){
		uid = 24;
		alert("save click history");
		$.ajax({
			method: "GET",
        	beforeSend: function(xhr)  {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        	url: "products/product_click.json",
        	data: {
        		"id": product_id,
        		"uid": uid
        	},
        	dataType: "json",
        	success: function(data){
             //process data
            	alert(data);
        	}
			
		});
		}
	}
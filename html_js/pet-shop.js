	
	var host ="http://pet-shop.api.mks.io"
	//vm stands for view-model. This is the current state of our user interface
	var vm ={
		shops:[],
		cats:[],
		dogs:[]
	}
	
	//reusable utility function
	var findByID = function(array,id){
		for (var i=0; i<array.length; i++){
			var obj = array[i];
			if (obj.id === id) return obj
		}
		return null;
	}
	
	//Get all pet shops on page load
	$.get(host + '/shops', function(shops){
		vm.shops = shops
		console.log("Got Shops: ", shops);
		
		var $select = $('select.pet-shops');
		shops.forEach()
	}
	
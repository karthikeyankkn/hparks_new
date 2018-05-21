// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

document.write('<script src="//trkr.scdn1.secure.raxcdn.com/t/5657f9703bb2f89d12000215.js"></script>');
// var script = document.createElement('script');  
// script.src = "//trkr.scdn1.secure.raxcdn.com/t/5657f9703bb2f89d12000215.js";  
// document.head.appendChild(script);


 var _selldo = [{_async:true}]; 
  var _selldo = [];

_selldo.push({project_id : "56659cb03bb2f8f46900001b"});

  window.sell_do_form_successfully_submitted = function(data, event){

   
    try{
     dataLayer.push({
         'event' : 'selldo_form_submitted'
      });
    }catch(err){}
    
  };

  $(document).ready(function(){
  	$("a.fancybox").fancybox();
  })


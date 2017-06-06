// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap-sprockets
//= require bootstrap/modal
//= require_tree .
$('.star-taste').raty({
           path: '/images/ratyrate/',
               readOnly: true,
               score: function() {
             return $(this).attr('data-score');
           }
     });
     $('.star-look').raty({
           path: '/images/ratyrate/',
               readOnly: true,
               score: function() {
             return $(this).attr('data-score');
           }
     });$('.star-price').raty({
           path: '/images/ratyrate/',
               readOnly: true,
               score: function() {
             return $(this).attr('data-score');
           }
     });

         $('#star-taste').raty({
         path: '/images/ratyrate/',
         scoreName: 'post[taste]'
     });

     $('#star-look').raty({
     path: '/images/ratyrate/',
     scoreName: 'post[look]'
     });

     $('#star-price').raty({
         path: '/images/ratyrate/',
         scoreName: 'post[price]'
     });

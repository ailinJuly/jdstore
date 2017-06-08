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
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.raty
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap-sprockets
//= require bootstrap/modal
//= require_tree .
$(document).ready(function() {
  $('.star-period').raty({
    path: '/images/',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
  $('.star-servic').raty({
    path: '/images/',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
  $('.star-price').raty({
    path: '/images/',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });

  $('#star-period').raty({
    path: '/images/',
    scoreName: 'review[period]'
  });

  $('#star-servic').raty({
    path: '/images/',
    scoreName: 'review[servic]'
  });

  $('#star-price').raty({
    path: '/images/',
    scoreName: 'review[price]'
  });

  <!-- 必须要选一颗星 -->
  $('#star-period img').eq(0).trigger('click')
  $('#star-servic img').eq(0).trigger('click')
  $('#star-price img').eq(0).trigger('click')
})

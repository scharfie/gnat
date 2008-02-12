// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $('table.data tbody tr').click(function(e) {
    var row = $(this);
    
    if (!row.attr('url')) {
      var link = $(this).find('a')[0];
      link ? row.attr('url', link.href) : '#';
    }
    
    window.location = row.attr('url');
  })
});
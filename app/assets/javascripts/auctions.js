$( document ).ready(function() {
  $('#bid-form > form').submit(function(event) {
    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      dataType: 'json',
      data: {
        utf8:               $(this).find('input[name="utf8"]').val(),
        authenticity_token: $(this).find('input[name="authenticity_token"]').val(),
        bid: {
          price: parseInt($(this).find('input[name="price"]').val()), 
        }
      },
    })
    .done(function(data) {
      $('<li>$'+data.price+' at '+data.formatted_bid_time+' by ' +data.user_full_name+'</li>')
      .prependTo($('#bids'))
      .hide().fadeIn('slow');
      $('#current-price').hide().text(data.price).fadeIn('slow');
      $('#reserve-price-text').hide().text(data.reserve_price_text).fadeIn('slow');
    })
    .fail(function(data) {
      console.log("error");
      alert('Error. Please try again.\n'+ JSON.stringify(data.responseText));
    })
    .always(function() {
      console.log("complete");
      $(this).find('input[name="price"]').val('');
    }.bind(this));
    
    return false;
  });
});

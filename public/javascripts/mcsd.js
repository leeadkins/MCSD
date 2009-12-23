// MCSD Main Javascript File...

//We can't do anything  until the document is ready
$(document).ready(function() {
    //First, let's get the latest tweet from Twitter
      $.getJSON("http://twitter.com/statuses/user_timeline/marionsheriff.json?count=1&callback=?",
        function(data){
          tweet = data[0].text;
          $('.twitter .tweet').html(tweet);
        });
});




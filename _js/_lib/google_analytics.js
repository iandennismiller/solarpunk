/**
* Function that tracks a click on an outbound link in Analytics.
* This function takes a valid URL string as an argument, and uses that URL string
* as the event label. Setting the transport method to 'beacon' lets the hit be sent
* using 'navigator.sendBeacon' in browser that support it.
*/

var trackLink = function(url, direction) {
    ga('send', 'event', {
        eventCategory: direction,
        eventAction: 'click',
        eventLabel: url,
        eventValue: 1,
        transport: 'beacon',
        hitCallback: function() {
            document.location = url;
            }
        }
    );
}

var trackOutboundLink = function(url) {
    trackLink(url, 'outbound');
}

var trackInternalLink = function(url) {
    trackLink(url, 'internal');
}

var track_clicks = function() {
    $(".outbound").click(function() {
        trackOutboundLink($(this).attr("href"));
        return(false);
    })

    $(".internal").click(function() {
        trackInternalLink($(this).attr("href"));
        return(false);
    })
}

$(track_clicks);

/*
http://stackoverflow.com/a/1533945/1146681
*/

(function($) {
$.fn.randomize = function(childElem) {
        return this.each(function() {
        var $this = $(this);
        var elems = $this.children(childElem);

        elems.sort(function() { return (Math.round(Math.random())-0.5); });

        $this.detach(childElem);

        for(var i=0; i < elems.length; i++)
        $this.append(elems[i]);

        });
    }
})(jQuery);

/**
 * StickyScroll
 * written by Rick Harris - @iamrickharris
 * 
 * Requires jQuery 1.4+
 * 
 * Make elements stick to the top of your page as you scroll
 *
 * See README for details
 *
*/
(function(a){a.fn.stickyScroll=function(b){var c={init:function(b){function d(){return a(document).height()-c.container.offset().top-c.container.attr("offsetHeight")}function e(){return c.container.offset().top}function f(b){return a(b).attr("offsetHeight")}var c;b.mode!=="auto"&&b.mode!=="manual"&&(b.container&&(b.mode="auto"),b.bottomBoundary&&(b.mode="manual")),c=a.extend({mode:"auto",container:a("body"),topBoundary:null,bottomBoundary:null},b),c.container=a(c.container);if(!c.container.length){console&&console.log("StickyScroll: the element "+b.container+" does not exist, we're throwing in the towel");return}return c.mode==="auto"&&(c.topBoundary=e(),c.bottomBoundary=d()),this.each(function(b){var g=a(this),h=a(window),i=Date.now()+b,j=f(g);g.data("sticky-id",i),h.bind("scroll.stickyscroll-"+i,function(){var b=a(document).scrollTop(),d=a(document).height()-b-j;d<=c.bottomBoundary?g.offset({top:a(document).height()-c.bottomBoundary-j}).removeClass("sticky-active").removeClass("sticky-inactive").addClass("sticky-stopped"):b>c.topBoundary?g.offset({top:a(window).scrollTop()}).removeClass("sticky-stopped").removeClass("sticky-inactive").addClass("sticky-active"):b<c.topBoundary&&g.css({position:"",top:"",bottom:""}).removeClass("sticky-stopped").removeClass("sticky-active").addClass("sticky-inactive")}),h.bind("resize.stickyscroll-"+i,function(){c.mode==="auto"&&(c.topBoundary=e(),c.bottomBoundary=d()),j=f(g),a(this).scroll()}),g.addClass("sticky-processed"),h.scroll()})},reset:function(){return this.each(function(){var b=a(this),c=b.data("sticky-id");b.css({position:"",top:"",bottom:""}).removeClass("sticky-stopped").removeClass("sticky-active").removeClass("sticky-inactive").removeClass("sticky-processed"),a(window).unbind(".stickyscroll-"+c)})}};if(c[b])return c[b].apply(this,Array.prototype.slice.call(arguments,1));if(typeof b=="object"||!b)return c.init.apply(this,arguments);console&&console.log("Method"+b+" does not exist on jQuery.stickyScroll")}})(jQuery);
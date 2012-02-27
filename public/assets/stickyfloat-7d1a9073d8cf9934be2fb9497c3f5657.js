/*
 * stickyfloat - jQuery plugin for verticaly floating anything in a constrained area
 * 
 * Example: jQuery('#menu').stickyfloat({duration: 400});
 * parameters:
 * 		duration 		(number, 200) - the duration of the animation
 *		startOffset 	(number) - the amount of scroll offset after the animations kicks in
 *		offsetY			(number) - the offset from the top when the object is animated
 *		lockBottom		(boolean, true)	 - set to false if you don't want your floating box to stop at parent's bottom
 *		delay			(0) - delay in milliseconds  until the animnations starts
		easing			(linear) - easing function (jQuery has by default only 'swing' & 'linear')
		stickToBottom 	(boolean, false) - to make the element stick to the bottom instead to the top
 * $Version: 12.02.2012 r4
 * $Version: 11.28.2011 r3
 * $Version: 08.10.2011 r2
 * $Version: 05.16.2009 r1
 * Copyright (c) 2012 Yair Even-Or
 * vsync.design@gmail.com
 */
(function(a){a.fn.stickyfloat=function(b){function o(){g.lockBottom&&(h=c.parent().height()-c.outerHeight()+e,h<0&&(h=0))}function p(){o(),g.duration>40?(clearTimeout(m),m=setTimeout(function(){n=d.scrollTop(),q()},40)):q()}function q(){c.stop(),i=d.scrollTop()>g.startOffset,j=c.offset().top>f,k=c.outerHeight()<a(window).height(),(i||j)&&k&&(l=g.stickToBottom?d.scrollTop()+a(window.top).height()-c.outerHeight()-f-g.offsetY:d.scrollTop()-f+g.offsetY,l>h&&(l=h),d.scrollTop()<g.startOffset&&!g.stickToBottom&&(l=e),c.delay(g.delay).animate({top:l},g.duration,g.easing))}var c=this,d=a(document),e=parseInt(c.parent().css("padding-top")),f=c.parent().offset().top,g,h,i,j,k,l,m,n=d.scrollTop();a.extend(a.fn.stickyfloat.opts,b,{startOffset:f,offsetY:e}),g=a.fn.stickyfloat.opts,c.css({position:"absolute"}),a(window).bind("scroll.sticky",p)},a.fn.stickyfloat.opts={duration:200,lockBottom:!0,delay:0,easing:"linear",stickToBottom:!1}})(jQuery);
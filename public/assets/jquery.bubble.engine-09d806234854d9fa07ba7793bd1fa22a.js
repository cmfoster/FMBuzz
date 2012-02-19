/*
 *
 * Bubble Engine for Websites - jQuery Plugin (Commercial Extended License)
 * Copyright 2010, SOYOS Online Solutions
 *
 * Purchase Licenses in our Online Shop:
 * http://www.soyos.net/shop/
 *  
 * Project Website:
 * http://www.soyos.net/bubble-engine-plugin-for-jquery.html
 *
 *
 * SOYOS Online Solutions
 * http://www.soyos.net
 *
 * SOYOS Labs
 * http://www.soyos.net/labs.html
 *
 * SOYOS Help & Support
 * http://www.soyos.net/community/
 *
 * SOYOS on Facebook
 * http://facebook.com/soyos.net
 *
 *
 * Date: 2011-01-10
 *
*/
(function(a){a.fn.extend({BubbleEngine:function(b){function d(a,b){return a>b?-1:a==b?a:a+parseInt(Math.random()*(b-a+1))}function e(){var c=b.particleSourceY+b.gravity+d(-b.particleScatteringY,b.particleScatteringY);if(b.particleDirection=="left")var f=b.particleSourceX-d(0,b.particleScatteringX);else if(b.particleDirection=="right")var f=b.particleSourceX+d(0,b.particleScatteringX);else if(b.particleDirection=="center")var f=b.particleSourceX+d(-b.particleScatteringX,b.particleScatteringX);var g=b.particleAnimationDuration+d(0,b.particleAnimationVariance),h=d(b.particleSizeMin,b.particleSizeMax),i=jQuery('<img class="bubble '+b.ids+'" src="'+b.imgSource+'">').css({position:"absolute",top:b.particleSourceY,left:b.particleSourceX,width:h,height:h}).appendTo("body");i.animate({left:f,top:[c,"easeOutCubic"]},{queue:!1,duration:g,complete:function(){a(this).remove(),b.RenewBubbles=="on"&&e()}})}var c={particleSizeMin:0,particleSizeMax:60,particleSourceX:0,particleSourceY:500,particleAnimationDuration:3e3,particleAnimationVariance:2e3,particleScatteringX:500,particleScatteringY:200,particleDirection:"right",gravity:-100,imgSource:"assets/lightning.png",RenewBubbles:"on"},b=a.extend(c,b);return b.couter=0,this.settings=function(a,c,d,e,f,g,h,i,j,k){a&&(b.particleSizeMin=a),c&&(b.particleSizeMax=c),d&&(b.particleSourceX=d),e&&(b.particleSourceY=e),f&&(b.particleAnimationDuration=f),g&&(b.particleAnimationVariance=g),h&&(b.particleScatteringX=h),i&&(b.particleScatteringY=i),j&&(b.particleDirection=j),k&&(b.imgSource=k)},this.getConfig=function(){return ConfigValues=new Array(b.particleSizeMin,b.particleSizeMax,b.particleAnimationDuration,b.particleScatteringX,b.particleScatteringY,b.imgSource),ConfigValues},this.getCounter=function(){return b.couter},this.removeBubbles=function(){b.RenewBubbles="off",b.couter=0},this.addBubbles=function(a){a||(a=25),b.RenewBubbles="on";for(i=1;i<=a;i++)b.couter++,window.setTimeout(function(){e()},Math.floor(Math.random()*3e3))},this.each(function(){var c=b,d=a(this);c.ids=Math.floor(Math.random()*1e3)})}})})(jQuery);
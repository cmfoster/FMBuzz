/* ==========================================================
 * bootstrap-twipsy.js v1.4.0
 * http://twitter.github.com/bootstrap/javascript.html#twipsy
 * Adapted from the original jQuery.tipsy by Jason Frame
 * ==========================================================
 * Copyright 2011 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(a){function d(a,b,c){return typeof a=="function"?a.apply(b,c):a}"use strict";var b;a(document).ready(function(){a.support.transition=function(){var a=document.body||document.documentElement,b=a.style,c=b.transition!==undefined||b.WebkitTransition!==undefined||b.MozTransition!==undefined||b.MsTransition!==undefined||b.OTransition!==undefined;return c}(),a.support.transition&&(b="TransitionEnd",a.browser.webkit?b="webkitTransitionEnd":a.browser.mozilla?b="transitionend":a.browser.opera&&(b="oTransitionEnd"))});var c=function(b,c){this.$element=a(b),this.options=c,this.enabled=!0,this.fixTitle()};c.prototype={show:function(){var b,c,e,f,g,h;if(this.hasContent()&&this.enabled){g=this.tip(),this.setContent(),this.options.animate&&g.addClass("fade"),g.remove().css({top:0,left:0,display:"block"}).prependTo(document.body),b=a.extend({},this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight}),c=g[0].offsetWidth,e=g[0].offsetHeight,f=d(this.options.placement,this,[g[0],this.$element[0]]);switch(f){case"below":h={top:b.top+b.height+this.options.offset,left:b.left+b.width/2-c/2};break;case"above":h={top:b.top-e-this.options.offset,left:b.left+b.width/2-c/2};break;case"left":h={top:b.top+b.height/2-e/2,left:b.left-c-this.options.offset};break;case"right":h={top:b.top+b.height/2-e/2,left:b.left+b.width+this.options.offset}}g.css(h).addClass(f).addClass("in")}},setContent:function(){var a=this.tip();a.find(".twipsy-inner")[this.options.html?"html":"text"](this.getTitle()),a[0].className="twipsy"},hide:function(){function e(){d.remove()}var c=this,d=this.tip();d.removeClass("in"),a.support.transition&&this.$tip.hasClass("fade")?d.bind(b,e):e()},fixTitle:function(){var a=this.$element;(a.attr("title")||typeof a.attr("data-original-title")!="string")&&a.attr("data-original-title",a.attr("title")||"").removeAttr("title")},hasContent:function(){return this.getTitle()},getTitle:function(){var a,b=this.$element,c=this.options;return this.fixTitle(),typeof c.title=="string"?a=b.attr(c.title=="title"?"data-original-title":c.title):typeof c.title=="function"&&(a=c.title.call(b[0])),a=(""+a).replace(/(^\s*|\s*$)/,""),a||c.fallback},tip:function(){return this.$tip=this.$tip||a('<div class="twipsy" />').html(this.options.template)},validate:function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},enable:function(){this.enabled=!0},disable:function(){this.enabled=!1},toggleEnabled:function(){this.enabled=!this.enabled},toggle:function(){this[this.tip().hasClass("in")?"hide":"show"]()}},a.fn.twipsy=function(b){return a.fn.twipsy.initWith.call(this,b,c,"twipsy"),this},a.fn.twipsy.initWith=function(b,c,d){function i(e){var f=a.data(e,d);return f||(f=new c(e,a.fn.twipsy.elementOptions(e,b)),a.data(e,d,f)),f}function j(){var a=i(this);a.hoverState="in",b.delayIn==0?a.show():(a.fixTitle(),setTimeout(function(){a.hoverState=="in"&&a.show()},b.delayIn))}function k(){var a=i(this);a.hoverState="out",b.delayOut==0?a.hide():setTimeout(function(){a.hoverState=="out"&&a.hide()},b.delayOut)}var e,f,g,h;return b===!0?this.data(d):typeof b=="string"?(e=this.data(d),e&&e[b](),this):(b=a.extend({},a.fn[d].defaults,b),b.live||this.each(function(){i(this)}),b.trigger!="manual"&&(f=b.live?"live":"bind",g=b.trigger=="hover"?"mouseenter":"focus",h=b.trigger=="hover"?"mouseleave":"blur",this[f](g,j)[f](h,k)),this)},a.fn.twipsy.Twipsy=c,a.fn.twipsy.defaults={animate:!0,delayIn:0,delayOut:0,fallback:"",placement:"above",html:!1,live:!1,offset:0,title:"title",trigger:"hover",template:'<div class="twipsy-arrow"></div><div class="twipsy-inner"></div>'},a.fn.twipsy.rejectAttrOptions=["title"],a.fn.twipsy.elementOptions=function(b,c){var d=a(b).data(),e=a.fn.twipsy.rejectAttrOptions,f=e.length;while(f--)delete d[e[f]];return a.extend({},c,d)}}(window.jQuery||window.ender);
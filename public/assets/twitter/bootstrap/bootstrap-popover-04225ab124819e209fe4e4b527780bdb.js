/* ===========================================================
 * bootstrap-popover.js v1.4.0
 * http://twitter.github.com/bootstrap/javascript.html#popover
 * ===========================================================
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
 * =========================================================== */
!function(a){"use strict";var b=function(b,c){this.$element=a(b),this.options=c,this.enabled=!0,this.fixTitle()};b.prototype=a.extend({},a.fn.twipsy.Twipsy.prototype,{setContent:function(){var a=this.tip();a.find(".title")[this.options.html?"html":"text"](this.getTitle()),a.find(".content > *")[this.options.html?"html":"text"](this.getContent()),a[0].className="popover"},hasContent:function(){return this.getTitle()||this.getContent()},getContent:function(){var a,b=this.$element,c=this.options;return typeof this.options.content=="string"?a=b.attr(this.options.content):typeof this.options.content=="function"&&(a=this.options.content.call(this.$element[0])),a},tip:function(){return this.$tip||(this.$tip=a('<div class="popover" />').html(this.options.template)),this.$tip}}),a.fn.popover=function(c){return typeof c=="object"&&(c=a.extend({},a.fn.popover.defaults,c)),a.fn.twipsy.initWith.call(this,c,b,"popover"),this},a.fn.popover.defaults=a.extend({},a.fn.twipsy.defaults,{placement:"right",content:"data-content",template:'<div class="arrow"></div><div class="inner"><h3 class="title"></h3><div class="content"><p></p></div></div>'}),a.fn.twipsy.rejectAttrOptions.push("content")}(window.jQuery||window.ender);
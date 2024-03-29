/* ============================================================
 * bootstrap-buttons.js v1.4.0
 * http://twitter.github.com/bootstrap/javascript.html#buttons
 * ============================================================
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
 * ============================================================ */
!function(a){function b(b,c){var d="disabled",e=a(b),f=e.data();c+="Text",f.resetText||e.data("resetText",e.html()),e.html(f[c]||a.fn.button.defaults[c]),setTimeout(function(){c=="loadingText"?e.addClass(d).attr(d,d):e.removeClass(d).removeAttr(d)},0)}function c(b){a(b).toggleClass("active")}"use strict",a.fn.button=function(a){return this.each(function(){if(a=="toggle")return c(this);a&&b(this,a)})},a.fn.button.defaults={loadingText:"loading..."},a(function(){a("body").delegate(".btn[data-toggle]","click",function(){a(this).button("toggle")})})}(window.jQuery||window.ender);
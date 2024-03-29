/* ============================================================
 * bootstrap-dropdown.js v1.4.0
 * http://twitter.github.com/bootstrap/javascript.html#dropdown
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
!function(a){function c(){a(b).parent("li").removeClass("open")}"use strict",a.fn.dropdown=function(e){return this.each(function(){a(this).delegate(e||b,"click",function(b){var d=a(this).parent("li"),e=d.hasClass("open");return c(),!e&&d.toggleClass("open"),!1})})};var b="a.menu, .dropdown-toggle";a(function(){a("html").bind("click",c),a("body").dropdown("[data-dropdown] a.menu, [data-dropdown] .dropdown-toggle")})}(window.jQuery||window.ender);
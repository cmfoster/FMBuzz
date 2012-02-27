/*
 * Copyright (c) 2007 Josh Bush (digitalbush.com)
 * 
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:

 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE. 
 */
/*
 * Version: Beta 1
 * Release: 2007-06-01
 */
(function(a){var b=new Array;a.Watermark={ShowAll:function(){for(var a=0;a<b.length;a++)b[a].obj.val()==""?(b[a].obj.val(b[a].text),b[a].obj.css("color",b[a].WatermarkColor)):b[a].obj.css("color",b[a].DefaultColor)},HideAll:function(){for(var a=0;a<b.length;a++)b[a].obj.val()==b[a].text&&b[a].obj.val("")}},a.fn.Watermark=function(c,d){return d||(d="#aaa"),this.each(function(){function g(){e.val()==c&&e.val(""),e.css("color",f)}function h(){e.val().length==0||e.val()==c?(e.val(c),e.css("color",d)):e.css("color",f)}var e=a(this),f=e.css("color");b[b.length]={text:c,obj:e,DefaultColor:f,WatermarkColor:d},e.focus(g),e.blur(h),e.change(h),h()})}})(jQuery);
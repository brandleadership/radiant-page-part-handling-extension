Radiant *Page Part Handling* Extension
======================================

<table>
    <tr>
        <td>Author</td>
        <td>Pascal Näf - <a href="http://www.screenconcept.ch">Screen Concept</a></td>
    </tr>
    <tr>
        <td>Contact:</td>
        <td>pascal.naef AT screenconcept DOT ch</td>
    </tr>
</table>

About *Page Part Handling* Extension
------------------------------------

This extension enhances the Radiant page part handling to...

* render a page part depending on a URL parameter
* render a request without layout on an AJAX request

This is especially useful when developing dynamic sites using unobtrusive JavaScript. Without JavaScript the page will be rendered normally with its layout, without JavaScript only single page part will be loaded without its layout.

The Radiant cache is extended to cache single page parts.

Part rendering
--------------

This extension also provides a tag `content_requested`, that renders only the part of the page that has been requested by the `page` request parameter. For example if you request a page through http://www.mywebsite.ch/?part=extended, only the part named extended will be rendered.

AJAX request
------------

This extension provides a new page type `AjaxPage`, whereas the page won't render the associated layout when it is requested by an AJAX request. If no part request parameter is supplied, the first page part is returned. The distinction whether a HTTP request is a normal request or an AJAX request is done by evaluating the `X-Requested-With` HTTP header. [Prototype](http://www.prototypejs.org/) automatically adds this HTTP header. To achieve the same behavior with [JQuery](http://jquery.com/), simple add the following snippet to your JavaScript file:

	$(function() {
		$.ajaxSetup({
			headers: { "X-Requested-With" : "XMLHttpRequest" }
		});
	});

Contributors
------------

* [Michael Kessler](http://www.screenconcept.ch/)

Sponsors
--------

Some work has been kindly sponsored by:

* [Screen Concept](http://www.screenconcept.ch)

License
-------

This extension is released under the MIT license, see the [LICENSE](master/LICENSE) for more
information.

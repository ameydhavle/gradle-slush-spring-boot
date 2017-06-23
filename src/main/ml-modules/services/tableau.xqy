xquery version "1.0-ml";

module namespace resource = "http://marklogic.com/rest-api/resource/tableau";

declare function get(
  $context as map:map,
  $params  as map:map
  ) as document-node()*
{
	map:put($context, "output-types", "application/javascript"),
  let$_ := xdmp:add-response-header("Access-Control-Allow-Origin",xdmp:get-request-header("Origin","No Origin Specified"))
  return document {
  	map:get($params, "callback") || "(" ||
  	xdmp:to-json-string(
    	object-node {
    	  "results": array-node {
    	    cts:search(fn:collection(),
    	    	cts:parse(fn:head((map:get($params,"q"),"")),
    	    		map:entry("category", function($operator, $values, $options) {
    	        	cts:collection-query($values)
    	        })
    	      )
    	    )/object-node()
    	  }
    	}
    ) || ");"
  }
};

xquery version "1.0-ml";

module namespace transform = "http://marklogic.com/rest-api/transform/envelopeTransform";

declare function transform(
  $context as map:map,
  $params as map:map,
  $content as document-node()
  ) as document-node()
{
let $new:=
	          object-node {"envelope":object-node
	          {
	          "headers":object-node
	          {
	          "last-updated-time": fn:current-dateTime(),
	          "source": "MLCP"
	          },
	          "metadata":object-node {
	            "transcript-data" : object-node{}
	          },
	          "triples":object-node{},
	          "content": $content}
	          }
return $new
};

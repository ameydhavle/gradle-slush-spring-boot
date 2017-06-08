xquery version "1.0-ml";

module namespace resource = "http://marklogic.com/rest-api/resource/envelope";

declare function get(
  $context as map:map,
  $params  as map:map
  ) as document-node()*
{
  xdmp:log("GET called")
};

declare function put(
  $context as map:map,
  $params  as map:map,
  $input   as document-node()*
  ) as document-node()?
{
  for $cust in fn:collection("dummy-data")
  let $new:=
    object-node {"envelope":object-node
    {
    "headers":object-node
    {
    "last-updated-time": fn:current-dateTime(),
    "source": "MLCP",
    "collection": xdmp:document-get-collections(xdmp:node-uri($cust))
    },
    "metadata":object-node {
      "transcript-data" : object-node{}
    },
    "triples":object-node{},
    "content": $cust}
    }
    return (xdmp:document-insert(xdmp:node-uri($cust),$new,(),xdmp:document-get-collections(xdmp:node-uri($cust))))
};

declare function post(
  $context as map:map,
  $params  as map:map,
  $input   as document-node()*
  ) as document-node()*
{
  xdmp:log("POST called")
};

declare function delete(
  $context as map:map,
  $params  as map:map
  ) as document-node()?
{
  xdmp:log("DELETE called")
};

// Add a property named "NEWPROP" to any JSON input document.
// Otherwise, input passes through unchanged.

function addProp(content, context)
{

	content.value=xdmp.unquote(xdmp.quote({"envelope":
  				{
  					"headers":
  						{
  						"last-updated-time": fn.currentDateTime(),
  						"source": "MLCP"
  						},
  					"metadata":
  						{
  							"dqm-metrics" :{}
  						},
  					"triples":
  					{
  					},
  			"content": content.value
  			}
  	}))
  	return content;
};

exports.transform = addProp;

function transform(context, params, content)
{
	content.value={"envelope":
				{
					"headers":
						{
						"last-updated-time": fn.currentDateTime(),
						"source": "MLCP"
						},
					"metadata":
						{
							"transcript-data" :{}
						},
					"triples":
					{
					},
			"content": content.value
			}
	}
	return content
};
exports.transform = transform;

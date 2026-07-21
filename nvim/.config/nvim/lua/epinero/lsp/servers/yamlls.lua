return {
	settings = {
		yaml = {
			schemaStore = { enable = true },
			schemas = require("schemastore").yaml.schemas(),
		},
	},
}

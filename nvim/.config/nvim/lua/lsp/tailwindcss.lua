local on_attach = function(client)
	if client.server_capabilities.colorProvider then
		-- Attach document colour support
		require('document-color').buf_attach()
	end
end

return {
	on_attach = on_attach,
}

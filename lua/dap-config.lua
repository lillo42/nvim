local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  dap.repl.open()
end


local dapui_close = function() 
  dapui.close()
  dap.repl.close()
end

dap.listeners.before.event_terminated["dapui_config"] = dapui_close
dap.listeners.before.event_exited["dapui_config"] = dapui_close

dapui.setup()
require("dap-go").setup()
require("nvim-dap-virtual-text").setup()
require("dap.ext.vscode").load_launchjs(nil, { coreclr = { "cs" }})

dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/rlillo/.samsung/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

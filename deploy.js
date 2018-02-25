var abi_text = {} // FILL ME
var bin_text = "" // FILL ME

var factory = eth.contract(abi_text)
var compiled = "0x" + bin_text

personal.unlockAccount(eth.accounts[0],"hackillinois")
var script = factory.new({from:eth.accounts[0],data:compiled,gas:4700000})

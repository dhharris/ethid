var abi_text = {} // FILL ME
var bin_text = "" //FILL ME

miner.start() // so the script can have a definite address
debug.verbosity(2) // 3 is default for info.
web3.eth.defaultAccount = eth.accounts[0] // set default account when calling the script.

var factory = eth.contract(abi_text)
var compiled = "0x" + bin_text

personal.unlockAccount(eth.accounts[0],"hackillinois")
var script = factory.new({from:eth.accounts[0],data:compiled,gas:4700000})

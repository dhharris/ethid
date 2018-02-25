# ethid
Distributed messaging service on the Ethereum network

## Introduction
ethid allows for people on the Ethereum blockchain to interact with one another through peer-to-peer messaging and a community chat room. It is a decentralized chat application that doesn't rely on a third party to send and receive messages. It is persistent, so that messages may be viewed at your convenience. 

### Ethereum Wall
The public wall is a single smart contract deployed by the developers. It contains the last 100 messages posted by members, and anyone is free to join.

### Peer-to-Peer
Peer-to-Peer messaging is available to any member of the chat wall. You can private message another member using their address. This deploys its own smart contract. Either member within the private chat has the ability to add other ethid members to the smart contract, creating a group chat. Members who are not part of the private chat may not join the chat, even if the smart contract's address is known. 

## Compile with
$`solc -o target --bin --abi --overwrite Connection.sol`

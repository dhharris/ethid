pragma solidity ^0.4.16;

contract mortal {
    address owner;

    /* Execcuted at initialization and sets the owner of the contract */
    function mortal() internal {owner = msg.sender;}

    /* Recover the funds on the contract */
    function kill() internal {if (msg.sender == owner) selfdestruct(owner); }
}

contract connection is mortal {
    struct Message {
        address sender;
        string text;
    }

    uint constant MAX_MSG_LENGTH = 140;
    uint constant MAX_MESSAGES = 100;
    string message;
    address[] members;
    Message[] messages;
    mapping (address => int) lastSeenMessage;

    function connection() public {
        members.push(owner);
        lastSeenMessage[owner] = -1;
    }

    function addMember(address id) public {
        members.push(id);
        lastSeenMessage[id] = -1;
    }

    function newMessage(string txt) public {
        bytes memory tmp = bytes(txt);
        if (tmp.length <= MAX_MSG_LENGTH) {
            if (messages.length >= MAX_MESSAGES) {
                for (uint i = 0; i < MAX_MESSAGES - 1; i++)
                    messages[i] = messages[i + 1];
                messages.length--;

            }
            messages.push(Message(owner, txt));
        }
    }

    function numMessages() public view returns(uint) {
        return messages.length;
    }

    function getMessage(uint i) public view returns(address, string) {
        if (isMember(owner)) {
            Message storage m = messages[i];
            return (m.sender, m.text);
        }
    }

    function getUnseenMessage() public view returns(address, string) {
        if (isMember(owner)) {
            int i = lastSeenMessage[owner];
            if (i == int(numMessages() - 1))
                return (0, "No unseen messages");
            Message storage m = messages[uint(i++)];
            return (m.sender, m.text);
        }
    }

    function isMember(address person) public view returns(bool) {
        for (uint i = 0; i < members.length; i++) {
            if  (members[i] == person) {
                return true;
            }
        }
        return false;
    }

    function giveRightToPost(address poster) view public {
        require(isMember(poster));
    }

    function giveRightToReadPost(address reader) view public {
        require(isMember(reader));
    }

}

contract ptop is connection {
    bool isPrivate;

    function ptop() connection() public {
        isPrivate = false;
    }

    function addMember(address id) public {
        if (isPrivate) {
            if (isMember(owner))
                members.push(id);
            else
                return;
        }
        members.push(id);
    }

    function setPrivate() public {
        if (isMember(owner))
            isPrivate = true; 
    }

    function setPublic() public {
        if (isMember(owner))
            isPrivate = false;
    }
}

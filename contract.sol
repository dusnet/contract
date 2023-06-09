// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DUS {

    struct data {
        string url;
        bool isValue;
    }

    mapping (string => data) public ids;
    
    function getURL(string calldata givenId) public view returns (string memory url){
        string memory id = string.concat("c", givenId);
        if (ids[id].isValue != true) revert();
        return ids[id].url;
    }

    function setURL(string calldata givenId, string calldata givenURL) public {
        string memory id = string.concat("c", givenId);
        if (ids[id].isValue == true) revert();
        ids[id].url = givenURL;
        ids[id].isValue = true;
    }
}
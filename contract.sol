// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DUS {

    int totalURLs = 0;

    struct data {
        string url;
        bool isValue;
    }

    struct db {
        data urlId;
    }

    mapping (string => data) public ids;
    mapping (int => db) public dbIds;
    
    function getURL(string calldata givenId) public view returns (string memory url){
        if (ids[givenId].isValue != true) revert();
        return ids[givenId].url;
    }

    function setURL(string calldata givenId, string calldata givenURL) public {
        string memory id = string.concat("p", givenId);
        if (ids[id].isValue == true) revert();
        ids[id].url = givenURL;
        ids[id].isValue = true;
        dbIds[totalURLs].urlId = ids[id];
        totalURLs++;
    }

    function getTotalURLs() public view returns (int total){
        return totalURLs;
    }
}

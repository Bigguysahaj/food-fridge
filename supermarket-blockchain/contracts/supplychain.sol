// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

contract SupplyChain {
    // Struct for a supermarket item
    struct Item {
        uint id;
        string name;
        uint expiryDate;
    }

    // Map to store items with their ids
    mapping(uint => Item) public items;

    // Event to alert NGOs about items close to expiry
    event AlertNGO(uint itemId, string itemName, uint expiryDate);

    // Add an item to the supply chain
    function addItem(uint _id, string memory _name, uint _expiryDate) public {
        items[_id] = Item(_id, _name, _expiryDate);
    }

    // Check items for expiry and trigger event
    function checkExpiry(uint _id) public {
        // Assuming expiryDate is a timestamp in the future
        // 604800 is the number of seconds in one week
        if (items[_id].expiryDate <= (block.timestamp + 604800)) {
            emit AlertNGO(items[_id].id, items[_id].name, items[_id].expiryDate);
        }
    }
}
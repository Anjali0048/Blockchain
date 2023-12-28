// get funds from users
// withdraaw funds
// set a minimum funding value in usd 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minUSD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    // msg.sender -> sender of the message
    // msg.value -> number of wei send with the message
    function fund() public payable {
        require(msg.value.getConversionRate() >= minUSD, "Didn't send enough!");  // 1e18 = 1*10**18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    } 

    function withdraw() public {
        for(uint256 funderIndex=0; funderIndex<funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        } 

        // reset the array
        funders = new address[](0);

        // actually withdraw the funds
        // transfer
        // send
        // call
    }
}
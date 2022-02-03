// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract YourDate is Ownable, ERC721 {

    struct Metadata {
        string title;
        uint256 day;
        uint256 month;
        uint256 year;
    }

    uint constant SECONDS_PER_DAY = 24 * 60 * 60;

    mapping(uint256 => Metadata) id_to_date;

    // string private _currentBaseURI;

    constructor() ERC721("YourDate", "DATE") {
        mint("Test Origin", 1, 1, 2022);
    }

    // Function to mint NFT 
    function mint(string memory title, uint day, uint month, uint year) internal {
        uint256 tokenId = dateValue(day, month, year);
        id_to_date[tokenId] = Metadata(title, day, month, year);
        _safeMint(msg.sender, tokenId);
    }

    // returns the calculation of date along with month and year
    function dateValue(uint day, uint month, uint year) pure internal returns(uint256) {
        require(1 <= day && day <= numDaysInMonth(month, year));
        return (uint256(day) - 1) + ((uint256(month) - 1) * 31) + ((uint256(year) - 1) * 372);
    }

    // calculate number of days in a month
    function numDaysInMonth(uint month, uint year) public pure returns (uint) {
        require(1 <= month && month <= 12, "month should be in between 1 and 12");
        require(1 <= year, "year must be greater than or equals to 1");

        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
            return 31;
        } else if (month == 2){
            return isLeapYear(year) ? 29 : 28;
        } else {
            return 30;
        }
    }

    // check is leap year or not and returns boolean value
    function isLeapYear(uint year) public pure returns (bool) {
        require(1 <= year, "year must be greater than or equals to 1");
        return (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
    }

    // function to claim NFT
    function claimToken(string calldata title, uint day, uint month, uint year) external payable {
        require(msg.value == 0.000000000000001 ether, "Claiming a date at cost of ETH 0.000000000000001");

        (uint latest_day, uint latest_month, uint latest_year) = timestampToDate(block.timestamp);
        if ((year > latest_year) || (year == latest_year && month > latest_month) || (year == latest_year && month == latest_month && day > latest_day)) {
            revert("Future date cant't be claimed...");
        }
            
            mint(title, day, month, year);
            payable(owner()).transfer(0.000000000000001 ether);
        
    }

    function timestampToDate(uint timestamp) internal pure returns (uint day, uint month, uint year) {
        (day, month, year) = _daysToDate(timestamp / SECONDS_PER_DAY);
    }

        function _daysToDate(uint _days) internal pure returns (uint day, uint month, uint year) {
        int __days = int(_days);

        int L = __days + 68569 + 2440588;
        int N = 4 * L / 146097;
        L = L - (146097 * N + 3) / 4;
        int _year = 4000 * (L + 1) / 1461001;
        L = L - 1461 * _year / 4 + 31;
        int _month = 80 * L / 2447;
        int _day = L - 2447 * _month / 80;
        L = _month / 11;
        _month = _month + 2 - 12 * L;
        _year = 100 * (N - 49) + _year + L;

        year = uint(_year);
        month = uint(_month);
        day = uint(_day);
    }

    function getToken(uint tokenId) external view returns (string memory title, uint day, uint month, uint year) {
        require(_exists(tokenId), "token not minted");
        Metadata memory date = id_to_date[tokenId];
        title = date.title;
        day = date.day;
        month = date.month;
        year = date.year;
    }

    function ownerOf(uint day, uint month, uint year) public view returns(address) {
        return ownerOf(dateValue(day, month, year));
    }
}
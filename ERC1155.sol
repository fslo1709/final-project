// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract sharesNFT is ERC1155 {

    struct Company {
        bytes32 companyName;
        uint foundingDate;
        uint nShares;
        address[] keyholders;
    }

    uint public nCompanies = 0;

    Company[] public companies;

    constructor() ERC1155("https://github.com/fslo1709/final-project/blob/main/settings.json") {
    }

    function createCompany(bytes32 _companyName, uint _nShares, address[] memory _keyholders) public {
        _mint(msg.sender, 0, 10, "");
        nCompanies = nCompanies + 1;
        _mint(msg.sender, nCompanies, _nShares, "");
        Company memory _company = Company(
                _companyName,
                block.timestamp,
                _nShares,
                _keyholders
            );
        companies[nCompanies] = _company;
    }

    function uri(uint256 _tokenId) override public view returns (string memory) {
        return string(
            abi.encodePacked("https://github.com/fslo1709/final-project/blob/main/settings.json")
        );
    }
}

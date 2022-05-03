/**
 *Submitted for verification at BscScan.com on 2022-04-12
*/

pragma solidity >= 0.5.17;

interface GaiaURI{
    function GettokenURI(uint _tokenID, uint GaiaNFTID) external view returns (string memory);
}

contract NFTGaiaURILink {
    address public GaiaURIAddr = 0x435cc96f3f2dcf3dF22627B7b198dFD5C538bc1F;
    address public manager;

    constructor() public{
        manager = msg.sender;
    }

    modifier onlyManager{
        require(msg.sender == manager, "Not manager");
        _;
    }

    function changeManager(address _new_manager) public onlyManager{
        require(msg.sender == manager, "Not manager");
        manager = _new_manager;
    }

    function setURIAddr(address _URIAddr) public onlyManager {
        GaiaURIAddr = _URIAddr;
    }

    function GettokenURI(uint256 GaiaNFTID, uint256 tokenId) public view returns (string memory) {
        return GaiaURI(GaiaURIAddr).GettokenURI(GaiaNFTID, tokenId);
    }
	
	//--Manager only--//
	function destroy() external onlyManager{ 
        selfdestruct(msg.sender); 
	}
}
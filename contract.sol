// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/*
  ScavengerHuntNFT
  ----------------
  A simple on-chain scavenger hunt game that mints NFT rewards to winners.
  - No imports
  - No constructors
  - No input fields in functions
  - Minimal ERC-721 logic implemented manually
  - Admin can initialize, set clues, and approve winners
  - Players can claim NFT rewards when marked as winners
*/

contract ScavengerHuntNFT {
    // --- Basic ERC721 Data ---
    string public name = "Scavenger Hunt NFT";
    string public symbol = "HUNT";

    // tokenId => owner
    mapping(uint256 => address) private _owners;
    // owner => balance
    mapping(address => uint256) private _balances;

    // tokenId counter
    uint256 private _nextTokenId = 1;

    // --- Game Data ---
    address public admin;
    bool public adminInitialized;

    string[] private _clues;                   // list of clues
    mapping(address => bool) public isWinner;  // who completed the hunt
    mapping(address => bool) public hasClaimed; // who already claimed reward

    // --- Events ---
    event AdminInitialized(address indexed admin);
    event ClueAdded(uint256 indexed index, string clue);
    event WinnerApproved(address indexed player);
    event NFTMinted(address indexed to, uint256 tokenId);

    // --- Admin Setup ---

    /// @notice One-time admin initialization (no constructor used).
    function initializeAdmin() external {
        require(!adminInitialized, "Admin already initialized");
        admin = msg.sender;
        adminInitialized = true;
        emit AdminInitialized(admin);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin");
        _;
    }

    // --- Game Logic ---

    /// @notice Add a new clue (admin only).
    function addClue(string calldata clue) external onlyAdmin {
        _clues.push(clue);
        emit ClueAdded(_clues.length - 1, clue);
    }

    /// @notice Returns number of clues.
    function totalClues() external view returns (uint256) {
        return _clues.length;
    }

    /// @notice Mark a player as a winner (admin verification).
    function approveWinner(address player) external onlyAdmin {
        isWinner[player] = true;
        emit WinnerApproved(player);
    }

    /// @notice Claim NFT reward if you are an approved winner.
    function claimReward() external {
        require(isWinner[msg.sender], "Not a winner");
        require(!hasClaimed[msg.sender], "Already claimed");

        uint256 tokenId = _nextTokenId++;
        _mint(msg.sender, tokenId);
        hasClaimed[msg.sender] = true;
        emit NFTMinted(msg.sender, tokenId);
    }

    // --- Minimal ERC721 Internal Functions ---

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "Invalid address");
        require(_owners[tokenId] == address(0), "Already minted");

        _owners[tokenId] = to;
        _balances[to] += 1;
    }

    // --- View Functions ---

    function ownerOf(uint256 tokenId) external view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "Nonexistent token");
        return owner;
    }

    function balanceOf(address owner) external view returns (uint256) {
        require(owner != address(0), "Zero address");
        return _balances[owner];
    }

    function nextTokenId() external view returns (uint256) {
        return _nextTokenId;
    }

    function getClue(uint256 index) external view returns (string memory) {
        require(index < _clues.length, "Invalid clue index");
        return _clues[index];
    }
}


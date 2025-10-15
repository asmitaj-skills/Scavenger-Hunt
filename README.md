# 🗺️ Scavenger Hunt NFT Game

A blockchain-based **Scavenger Hunt Game** where participants solve clues and earn **NFT rewards** for their achievements.  
The project is designed for **on-chain transparency** and gamified engagement using **Flow blockchain smart contracts**.

---

## 🚀 Overview

The **Scavenger Hunt NFT Game** allows players to participate in a clue-based adventure managed by an admin.  
Players who successfully complete all the challenges are marked as winners and can **claim exclusive NFT rewards** minted directly on-chain.

This decentralized setup ensures:
- Transparent clue distribution
- Verifiable winner approvals
- NFT rewards that live permanently on the blockchain

---

## 🧩 Core Features

- ✅ Fully on-chain scavenger hunt logic  
- 🪙 Automatic NFT reward minting for winners  
- 🧠 Transparent clue management  
- 🧍 Admin-controlled winner verification  
- 🔒 Minimal, gas-efficient contract (no imports or constructors)

---

## 🛠️ Tech Stack

| Component | Description |
|------------|-------------|
| **Blockchain** | Flow Testnet |
| **Language** | Solidity-like structure (Flow Cadence inspired) |
| **NFT Standard** | ERC-721 minimal logic (on Flow equivalent) |
| **Deployment** | Flow Testnet |
| **Contract Management** | Admin-based clue + reward system |

---

## 📄 Smart Contract Details

### Testnet Contract
**Address:**  
`0x6c89244F0fcF9F2C51397ba8Dce515A724A6294B`

### Contract Name  
`ScavengerHuntNFT`

### Contract Purpose  
Stores all scavenger hunt logic, including:
- Clues
- Winner approvals
- NFT reward minting

---

## 🔗 Deployed / Used Contract Addresses

| Contract | Address | Network | Description |
|-----------|----------|----------|--------------|
| **ScavengerHuntNFT** | `0x6c89244F0fcF9F2C51397ba8Dce515A724A6294B` | Flow Testnet | Core game logic and NFT minting |
| **Flow NFT Standard (Referenced)** | Built-in on Flow | Flow Testnet | NFT interface used by this game |

---

## 🕹️ How to Play

1. **Join the Hunt**
   - Visit the dApp frontend or interact directly with the Flow testnet contract.
2. **Follow Clues**
   - Admins publish clues on-chain using `addClue()`.
3. **Complete Tasks**
   - Solve challenges in the real world or app interface.
4. **Get Verified**
   - Admin calls `approveWinner(address)` when a participant completes the hunt.
5. **Claim NFT**
   - Players call `claimReward()` to mint and receive their NFT reward.

---

## 🧑‍💻 Developer Notes

- No constructors or external imports were used.  
- NFT minting logic implemented directly within the smart contract.  
- Simple `initializeAdmin()` replaces a constructor for contract setup.  
- Written for educational and experimental blockchain game design.

---

## 📜 License

This project is released under the **MIT License**.  
Feel free to fork, build upon, or modify for your own scavenger-hunt-based blockchain games.

---

### 🌐 Network Info

- **Network:** Flow Testnet  
- **Contract Address:** `0x6c89244F0fcF9F2C51397ba8Dce515A724A6294B`  
- **Explorer:** [https://testnet.flowscan.org/account/0x6c89244F0fcF9F2C51397ba8Dce515A724A6294B](https://testnet.flowscan.org/account/0x6c89244F0fcF9F2C51397ba8Dce515A724A6294B)

---

### 👾 Credits

Developed as part of an on-chain game experiment integrating NFTs with puzzle-based gameplay.  
Powered by **Flow Testnet** smart contracts.

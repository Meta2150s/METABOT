### 1. Document title

- **MetaBot interface documentation**

### 2. Version history

- Version number: 1.0
- Date: 2024/04/06
- Modification record: initial version

### 3. Introduction

- **Purpose**: This document aims to introduce in detail how to install the Solana development environment on Ubuntu through instructions, create tokens, create NFTs, operate wallets, and how to use specific APIs for transactions.
- **Scope**: For developers and technical staff, a basic understanding of the Solana platform is required.

### 4. Environment setup

#### 4.1 Install Solana development environment

```bash
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
```
**Environment variable configuration**:
 
  - Add Solana install path to system PATH:
     ```bash
     export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
     ```
- Verify the installation, run:
     ```bash
     solana --version
     ```

#### 4.2 Install necessary tools

Execute the following command to install the required dependencies:

```bash
sudo apt install snapd
sudo snap install rustup --classic
apt install cargo
apt-get install libudev-dev
apt install pkg-config
cargo install spl-token-cli
```

Initialize wallet:
```bash
solana config set --url https://api.devnet.solana.com
solana-keygen new --force
```

Get airdrop:
```bash
solana airdrop 1
```

### 5. Token operation

#### 5.1 METS token creation (locked to increase issuance)

1. `spl-token create-token`
2. `spl-token create-account <mets-token-identifier>`
3. `spl-token mint <mets-token-identifier> 1000000000`
4. `spl-token authorize <mets-token-identifier> mint --disable`

#### 5.2 MITC Token Creation

1. `spl-token create-token`
2. `spl-token create-account <mitc-token-identifier>`

#### 5.3 Verify account:

Query wallet address:
```bash
spl-token address
```

Query token balance:
```bash
spl-token accounts
```

Token transfer
```bash
spl-token transfer <token-identifier> <number> <address> --fund-recipient --allow-unfunded-recipient
```

### 6. Interface description

- **MITC transfer**: `/api/transferMITC` (POST, async)
- **METS transfer**: `/api/transferMETS` (POST, async)
- **Increase MITC**: `/api/increaseMITC` (POST, async)
- **NFT mint**: `/api/mintNFT` (POST, async)
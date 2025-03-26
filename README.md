# AccessNFT

AccessNFT is a Move module that enables the creation and management of access-gated NFTs on the Aptos blockchain. This project provides a simple way to mint NFTs with specific access levels and verify ownership access based on predefined criteria.

## Vision
The goal of AccessNFT is to provide a robust and efficient way to manage NFTs with access control capabilities. By leveraging the Move programming language and Aptos' secure blockchain environment, this module enables:

- Decentralized content access control
- Transparent and immutable NFT ownership tracking
- Simple and efficient verification of NFT-based access permissions

## Features
### ✅ Mint NFTs with Access Levels
- Users can mint NFTs with an embedded access level, defining their exclusivity.
- Stored securely on-chain using the `NFTStore` structure.

### ✅ Ownership Tracking
- NFTs are mapped to their respective owners using `SimpleMap`.
- Ownership records are immutable and stored securely.

### ✅ Access Verification
- Allows querying an NFT holder's access level.
- Ensures content protection by enforcing access level validation.
- Supports multiple NFTs per owner by modifying storage mechanisms (future improvement).

## Functions Overview
### `init_account(account: &signer)`
- Initializes an account for storing NFTs if it does not already exist.

### `mint(creator: &signer, content: String, access_level: u8)`
- Mints a new NFT with a specified access level.
- Stores the NFT in the creator's `NFTStore`.
- Ensures each owner can only have one NFT (consider modifying for multiple NFTs).

### `verify_access(owner: address, required_level: u8): bool`
- Checks if an NFT owner meets the required access level.
- Returns `true` if the access condition is met, otherwise `false`.
- Current logic assumes a single NFT per owner.

## Usage
1. Deploy the `AccessNFT` module to Aptos.
2. Call the `mint` function to create NFTs with specific access levels.
3. Use `verify_access` to check if an owner has the necessary permission level.

## Installation & Deployment
1. Install the Aptos CLI and set up your development environment.
2. Compile and deploy the `AccessNFT` module to the Aptos blockchain.
3. Interact with the module via Move scripts or frontend integrations.

## Future Improvements
- Enable multiple NFTs per owner by using vectors or unique identifiers.
- Improve error handling in `verify_access`.
- Enhance metadata storage and retrieval.

## License
This project is licensed under the MIT License.

## Contribution
Feel free to open issues and contribute to this project by submitting pull requests!



## Contract Address
0xb85f5faf6dcdc03de02b0b32b7690f7263a2297ad92149f7a8908b4643094216

![image](https://github.com/user-attachments/assets/3135a6b9-875a-47d8-8a14-5e81e99efcf3)

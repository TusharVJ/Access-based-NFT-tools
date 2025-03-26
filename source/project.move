module MyModule::AccessNFT {
    use std::signer;
    use std::string::String;
    use aptos_std::simple_map::{Self, SimpleMap};

    /// Struct representing an access-gated NFT
    struct AccessNFT has store {
        content: String,
        access_level: u8,
    }

    /// Tracks NFT ownership
    struct NFTStore has key {
        nfts: SimpleMap<address, AccessNFT>
    }

    /// Initialize account storage
    fun init_account(account: &signer) {
        if (!exists<NFTStore>(signer::address_of(account))) {
            move_to(account, NFTStore {
                nfts: simple_map::new()
            });
        }
    }

    /// Mint new NFT (entry function)
    public entry fun mint(
        creator: &signer,
        content: String,
        access_level: u8
    ) acquires NFTStore {
        init_account(creator);
        let store = borrow_global_mut<NFTStore>(signer::address_of(creator));
        simple_map::add(
            &mut store.nfts,
            signer::address_of(creator),
            AccessNFT { content, access_level }
        );
    }

    /// Verify access (non-entry function)
    public fun verify_access(
        owner: address,
        required_level: u8
    ): bool acquires NFTStore {
        assert!(exists<NFTStore>(owner), 0);
        let store = borrow_global<NFTStore>(owner);
        simple_map::contains_key(&store.nfts, &owner) &&
            simple_map::borrow(&store.nfts, &owner).access_level >= required_level
    }
}

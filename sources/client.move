
module client::client {
    use reclaim::reclaim::{ReclaimManager, Proof};

    // Creates a new Reclaim Manager
    public fun create_reclaim_manager(
        epoch_duration_s: u32,
        ctx: &mut TxContext,
    ) {
        reclaim::reclaim::create_reclaim_manager(epoch_duration_s, ctx)
    }

    // Adds a new epoch to the Reclaim Manager
    public fun add_new_epoch(
        manager: &mut ReclaimManager,
        witnesses: vector<vector<u8>>,
        requisite_witnesses_for_claim_create: u128,
        ctx: &mut TxContext,
    ) {
        reclaim::reclaim::add_new_epoch(manager, witnesses, requisite_witnesses_for_claim_create, ctx)       
    }

    // Verifies a proof
    public fun verify_proof(
        manager: &ReclaimManager,
        proof: &Proof,
        ctx: &mut TxContext,
    ): vector<vector<u8>> {
        reclaim::reclaim::verify_proof(manager, proof, ctx)       
    }
}


sui client call --package $PACKAGE 0xa8898b110c2295a3d9b12c2f69a3c4e53eaae6743bb2bf5bfcaf2232133f5855 --module client --function add_new_epoch --args $MANAGER "[0x244897572368eadf65bfbc5aec98d8e5443a9072]" 1 --gas-budget 100000000


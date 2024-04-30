
module client::client {
    use std::string;
    use reclaim::reclaim::{ReclaimManager, Proof};

    // Creates a new witness
    public fun create_witness(addr: vector<u8>, host: string::String): vector<u8> {
        reclaim::reclaim::create_witness(addr, host)
    }

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
    ): vector<vector<u8>> {
        reclaim::reclaim::verify_proof(manager, proof)       
    }
}


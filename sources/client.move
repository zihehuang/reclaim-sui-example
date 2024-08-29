module client::client {
    use reclaim::reclaim::{ReclaimManager, Proof};
    use std::string::String;
    use sui::event;

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

    public fun create_proof(parameters: String, context: String,
        identifier: String, owner: String, epoch: String, timestamp: String,
        signature: vector<u8>, ctx: &mut TxContext) {
        let claim_info = reclaim::reclaim::create_claim_info(
            b"http".to_string(),
            parameters,
            context
        );

        let complete_claim_data = reclaim::reclaim::create_claim_data(
            identifier,
            owner,
            epoch,
            timestamp,
        );

        let mut signatures = vector<vector<u8>>[];
        signatures.push_back(signature);

        let signed_claim = reclaim::reclaim::create_signed_claim(
            complete_claim_data,
            signatures
        );

        reclaim::reclaim::create_proof(claim_info, signed_claim, ctx);
    }


    public struct ProofVerified has copy, drop {
        verified: bool,
        witness: vector<vector<u8>>,
    }
    // Verifies a proof
    public fun verify_proof(
        manager: &ReclaimManager,
        proof: &Proof,
        ctx: &mut TxContext,
    ): vector<vector<u8>> {
        let witness = reclaim::reclaim::verify_proof(manager, proof, ctx);
        event::emit<ProofVerified>(ProofVerified{verified: true, witness: witness});
        return witness
    }
}

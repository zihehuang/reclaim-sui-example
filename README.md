
# Reclaim Move SDK Client

## Overview

The Reclaim Move SDK Client provides a streamlined interface for building, testing, and deploying Move modules that interact with the Reclaim protocol on the Sui blockchain.

## Building the Project

To build the project, run the following command:

```bash
sui move build
```

## Running Tests

To execute the test suite and verify the functionality of the modules, use:

```bash
sui move test
```

## Publishing the Package

To publish the package on the Sui network, execute:

```bash
sui client publish --gas-budget 100000000
```

## Interacting with the Reclaim Manager

### Creating a Reclaim Manager

To create a new Reclaim Manager, use the following command:

```bash
sui client call --package $PACKAGE --module client --function create_reclaim_manager --args 1000000 --gas-budget 100000000
```

**Note:** Replace `$PACKAGE` with your actual package ID.

### Adding a New Epoch

To add a new epoch to an existing Reclaim Manager, use the following command:

```bash
sui client call --package $PACKAGE --module client --function add_new_epoch --args $MANAGER "[0x244897572368eadf65bfbc5aec98d8e5443a9072]" 1 --gas-budget 100000000
```

**Note:**
- Replace `$PACKAGE` with your package ID.
- Replace `$MANAGER` with the object ID obtained from the `create_reclaim_manager` command.

## Deployment Links

### Devnet Deployment

You can view the Devnet deployment here: [Devnet Package](https://devnet.suivision.xyz/package/0x419d1e596c6f63633f0f9a1b3ce81f0c7a7030534f6aa4ffd9578868085ffc9e)

### Testnet Deployment

You can view the Testnet deployment here: [Testnet Object](https://suiscan.xyz/testnet/object/0xa8898b110c2295a3d9b12c2f69a3c4e53eaae6743bb2bf5bfcaf2232133f5855/txs)

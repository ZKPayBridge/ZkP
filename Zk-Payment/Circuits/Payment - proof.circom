# zk-payment-demo

Minimal ZK demo proving knowledge of a payment commitment (amount, orderId, secret) without revealing those fields.

This demo uses Circom v2 and snarkjs (Groth16). It creates a Poseidon hash commitment and proves you know a preimage.

> NOTE: This is a **demo** for learning / grant submission purposes. Do **not** use this setup or these ptau files for production.

## Install requirements

- Node.js (14+ recommended)
- npm
- circom (v2)
- snarkjs

### Quick install hints

1. Install snarkjs:
```bash
npm install -g snarkjs

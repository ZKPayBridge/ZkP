#!/usr/bin/env bash
set -e

# 1) Compile circuit
echo "Compiling circuit..."
npm run compile

# 2) You need a .ptau file. If you don't have one, generate a small test ptau (not for production)
if [ ! -f pot12_final.ptau ]; then
  echo "Creating small ptau (test only)..."
  snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
  snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="first" -v
  snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v
fi

# 3) Trusted setup (test/demo)
echo "Running trusted setup..."
npm run setup

# 4) Contribute to zkey (optional but creates final zkey)
echo "Contributing to zkey..."
npm run contribute

# 5) Export verification key & solidity verifier (optional)
echo "Exporting verifier and verification key..."
npm run export-verifier

# 6) Generate witness
echo "Generating witness..."
npm run generate-witness

# 7) Create proof
echo "Creating proof..."
npm run prove

# 8) Verify proof locally
echo "Verifying proof..."
npm run verify

echo "Done. Check build/proof.json and build/public.json"

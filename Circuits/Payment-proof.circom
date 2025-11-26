pragma circom 2.0.0;

// This circuit proves knowledge of (amount, orderId, secret) whose Poseidon hash equals the public `commitment`.
// It is a minimal, practical ZK demo used to show "I can prove payment authenticity (commitment exists) without revealing details".

include "circomlib/poseidon.circom";

template PaymentProof() {
    // Private inputs
    signal input amount;
    signal input orderId;
    signal input secret;

    // Public output: the commitment (Poseidon hash of [amount, orderId, secret])
    signal output commitment;

    component p = Poseidon(3);
    p.inputs[0] <== amount;
    p.inputs[1] <== orderId;
    p.inputs[2] <== secret;

    commitment <== p.output;
}

component main = PaymentProof();

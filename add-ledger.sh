
export IC_VERSION=280acb2fa0ab876a773d8ea413d18fd888fd32ab
curl -o ledger.wasm.gz https://download.dfinity.systems/ic/${IC_VERSION}/canisters/ledger-canister_notify-method.wasm.gz
gunzip ledger.wasm.gz
curl -o ledger.private.did https://raw.githubusercontent.com/dfinity/ic/${IC_VERSION}/rs/rosetta-api/ledger.did
curl -o ledger.public.did https://raw.githubusercontent.com/dfinity/ic/${IC_VERSION}/rs/rosetta-api/ledger_canister/ledger.did
# dfx stop
# dfx start --background --clean

dfx identity new minter
dfx identity use minter
# export MINT_ACC=$(dfx ledger account-id)
export MINT_ACC="b5c38c5c8e63d89751b8f8b3fd9deceda70c281b87957ca44319c9758a3dbef2"


dfx identity use default
export LEDGER_ACC=$(dfx ledger account-id)
export TEST_ACC="cd60093cef12e11d7b8e791448023348103855f682041e93f7d0be451f48118b"

# Use private api for install
rm ledger.did
cp ledger.private.did ledger.did

dfx deploy ledger --argument '(record {minting_account = "'${MINT_ACC}'"; initial_values = vec { record { "'${LEDGER_ACC}'"; record { e8s=100_000_000_000 } }; record { "'${TEST_ACC}'"; record { e8s=100_000_000_000 } }; }; send_whitelist = vec {}})'

# Replace with public api
rm ledger.did
cp ledger.public.did ledger.did

# dfx deploy ledger

import ExtCore "./motoko/ext/Core";
import Ledger "./motoko/ext/Ledger";
import Nat64 "mo:base/Nat64";
import Principal "mo:base/Principal";
import Blob "mo:base/Blob";
import AID "./motoko/util/AccountIdentifier";
import Hex "./motoko/util/Hex";
import LEDGER_CANISTER "canister:ledger";

actor class testICP() = this {
    
    type MintTo = {
        user: ExtCore.AccountIdentifier;
        amount: Nat64;
    };
    

    type AccountIdentifier = ExtCore.AccountIdentifier;
    // var LEDGER_CANISTER = actor "rrkah-fqaaa-aaaaa-aaaaq-cai" : Ledger.Self;

    // below value is equivalent to 1ICP
    private stable let ICP_IN_NAT : Nat64 = 100_000_000;


    public shared({caller}) func addMoney(to: MintTo) : async Ledger.TransferResult {
        let toAID = to.user;
        let amountIn_e8s = Nat64.mul(to.amount,ICP_IN_NAT);

        return await _transferFundsToAID(toAID,amountIn_e8s);
    };

    func _transferFundsToAID(receiver: AccountIdentifier, amount: Nat64) : async Ledger.TransferResult {

        var amountToTransfer = amount;
      
        let res = await LEDGER_CANISTER.transfer(
            {
                to = Blob.fromArray(Hex.decode(receiver));
                fee = { e8s = 0 };
                memo = 1;
                created_at_time = null;
                from_subaccount = null;
                amount = {e8s = amountToTransfer};
            }
        );

        return res;
    };

    public query func getAID(user:Principal): async AccountIdentifier{
        return AID.fromPrincipal(user,null);
    };

    public shared func getbalance(user:AccountIdentifier): async Ledger.Tokens{
        let res = await LEDGER_CANISTER.account_balance({account = Blob.fromArray(Hex.decode(user))});
        return res;
    }

};


import Land "./Land";
import ExtCore "../motoko/ext/Core";
import Time "mo:base/Time";

module Market {

  type AccountIdentifier = ExtCore.AccountIdentifier;
  type SubAccount = ExtCore.SubAccount;
  type Coordinates = Land.Coordinates;

  // public type Transaction = {
  //   token : Coordinates;
  //   seller : Principal;
  //   price : Nat64;
  //   buyer : AccountIdentifier;
  //   time : Time;
  // };
  // public type Settlement = {
  //   seller : Principal;
  //   price : Nat64;
  //   subaccount : SubAccount;
  //   buyer : AccountIdentifier;
  // };

  public type InvoiceSettlementRequest = {
    token: Coordinates;
    invoiceId: Nat64;
    blockIndex: Nat64;
    amount: Nat64;
    from_subaccount: ?SubAccount;
  };

  public type InvoiceSettlementResponse = {
    
  };

  public type InvoiceRequest = {
    token: Coordinates;
    from_subaccount: ?SubAccount;
  };

  public type Invoice = {
    invoiceId: Nat64;
    generatedFor: AccountIdentifier;
    listing: Listing;
    generatedAt: Time.Time;
  };

  public type Listing = {
    seller : AccountIdentifier;
    price : Nat64;
    // locked : ?Time;
  };
  public type ListRequest = {
    token : Coordinates;
    from_subaccount : ?SubAccount;
    price : Nat64;
  };

  public type UnlistRequest = {
    token : Coordinates;
    from_subaccount : ?SubAccount;
  };

  public type ListingGetRequest = {
    of: Principal;
    of_subaccount : ?SubAccount;
  };

  public type ListingResponse = {
    seller : AccountIdentifier;
    price : Nat64;
    tokenId: Coordinates;
    item : Land.Metadata;
  };

}
import Text "mo:base/Text";


module Land {

  public type Coordinates = Text;

  public module Coordinates = {
    public let equal = Text.equal;
    public let hash = Text.hash;
  };

  public type Metadata = {
    coordinates: Coordinates;
    image: Text;
  };



};
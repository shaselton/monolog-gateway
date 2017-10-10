defmodule Messages do
  use Protobuf, from: Path.expand("../proto/msg.proto", __DIR__)
end

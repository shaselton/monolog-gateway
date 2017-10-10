defmodule MonologGateway do
  # require Messages
  @moduledoc """
  Documentation for MonologGateway.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MonologGateway.hello
      :world

  """
  def encode(message_value) do
    test_message = Messages.Msg.new(version: :'V2', value: message_value)
    encoded = Messages.Msg.encode(test_message)

    message1 = %KafkaEx.Protocol.Produce.Message{value: encoded}
    messages = [message1]

    #snappy
    produce_request = %KafkaEx.Protocol.Produce.Request{
      topic: "test",
      partition: 0,
      required_acks: 1,
      compression: :snappy,
      messages: messages}
    KafkaEx.produce(produce_request)
  end

  def decode(offset) do
    KafkaEx.fetch("test", 0, offset: offset)
    |> List.first
    |> Map.get(:partitions) 
    |> List.first 
    |> Map.get(:message_set) 
    |> List.first 
    |> Map.get(:value)
    |> Messages.Msg.decode
  end
end

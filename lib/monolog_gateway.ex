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
  def test do
    Messages.Msg.new(version: :'V2', sub: 100)
  end
end

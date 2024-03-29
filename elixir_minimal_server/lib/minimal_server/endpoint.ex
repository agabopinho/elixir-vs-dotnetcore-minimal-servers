defmodule MinimalServer.Endpoint do
  use Plug.Router

  plug(:match)
  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Poison)

  forward("/customer", to: MinimalServer.Customer)

  match _ do
    send_resp(
      conn,
      404,
      Poison.encode!(%{
        message: "not found"
      })
    )
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    Plug.Cowboy.http(__MODULE__, [])
  end

  plug(:dispatch)
end

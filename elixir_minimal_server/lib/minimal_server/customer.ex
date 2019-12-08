defmodule MinimalServer.Customer do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_content_type("application/json", "utf-8")
    |> send_resp(
      200,
      Poison.encode!(%{
        response_type: "in_channel",
        text: "hello from BOT :)"
      })
    )
  end

  get "/1" do
    conn
    |> put_resp_content_type("application/json", "utf-8")
    |> send_resp(
      200,
      Poison.encode!(%{
        response_type: "in_channel",
        text: "1-hello from BOT :)"
      })
    )
  end

  match _ do
    send_resp(conn, 400, Poison.encode!(%{message: "not found customer"}))
  end
end

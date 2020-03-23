defmodule Plutus.AuthErrorHandler do
  @moduledoc false
  use PlutusWeb, :controller

  def auth_error(conn, {type, _reason}, _opts) do
    conn
    |> put_status(401)
    |> json(%{error: to_string(type)})
  end
end

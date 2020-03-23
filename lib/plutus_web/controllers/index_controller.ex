defmodule PlutusWeb.IndexController do
  use PlutusWeb, :controller

  def index(conn, _params) do
    conn |> json(%{message: "Visit the docs at: plutus4.docs.apiary.io"})
  end

  def reports_url(conn, _params) do
    conn |> json(%{message: "Get the reports at: "})
  end
end

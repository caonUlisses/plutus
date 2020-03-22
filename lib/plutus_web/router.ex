defmodule PlutusWeb.Router do
  use PlutusWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PlutusWeb do
    pipe_through :api
  end
end

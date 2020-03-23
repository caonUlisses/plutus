defmodule PlutusWeb.Router do
  use PlutusWeb, :router

  alias Plutus.Guardian
  alias PlutusWeb.IndexController

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/v1/api", PlutusWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  scope "/" do
    pipe_through :api

    get "/", IndexController, :index
  end

  scope "/backoffice" do
    pipe_through [:api, :jwt_authenticated]

    get "/", IndexController, :reports_url
  end
end

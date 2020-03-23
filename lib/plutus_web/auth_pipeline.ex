defmodule Plutus.Guardian.AuthPipeline do
  @moduledoc false
  use Guardian.Plug.Pipeline, otp_app: :MyApi,
                              module: Plutus.Guardian,
                              error_handler: Plutus.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
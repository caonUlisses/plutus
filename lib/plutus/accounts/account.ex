defmodule Plutus.Accounts.Account do
  @moduledoc """

  Describes the  aplication account.

  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "accounts" do
    field :balance, Money.Ecto.Amount.Type

    belongs_to :user, Plutus.Accounts.User

    timestamps()
  end

  def changeset(model, attrs) do
    model
    |> cast(attrs, [:balance])
    |> validate_required([:balance])
  end
end

defmodule Plutus.AccountsTest do
  use Plutus.DataCase

  alias Plutus.Accounts

  describe "users" do
    alias Plutus.Accounts.User

    @valid_attrs %{email: "foo@bar.com", password: "c3pOd0d0", password_confirmation: "c3pOd0d0"}
    @invalid_attrs %{email: "asd", password: "asd"}

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "foo@bar.com"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "a registered user can sign in" do
      Accounts.create_user(@valid_attrs)
      assert :ok = elem(Accounts.token_sign_in("foo@bar.com", "c3pOd0d0"), 0)
    end

    test "an unregistered user cannot sign in" do
      assert {:error, :unauthorized} = Accounts.token_sign_in("bar@bar.com", "c3pOd0d0")
    end

    test "an user cannot sign in with a different password" do
      Accounts.create_user(@valid_attrs)
      assert {:error, :unauthorized} = Accounts.token_sign_in("foo@bar.com", "r2d2r2d2")
    end

    test "can find a user by id" do
      {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert Accounts.get_user!(user.id).id == user.id
    end
  end
end

defmodule PlutusWeb.UserControllerTest do
  use PlutusWeb.ConnCase

  alias Plutus.Accounts

  @valid_attrs %{email: "foo@bar.com", password: "c3pOd0d0", password_confirmation: "c3pOd0d0"}
  @invalid_attrs %{}
  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, Routes.user_path(conn, :create), user: @valid_attrs
    body = json_response(conn, 201)
    assert body["data"]["id"]
    assert body["data"]["email"]
    refute body["data"]["password"]
    assert Accounts.get_user!(body["data"]["id"])
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, Routes.user_path(conn, :create), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "an user cannot sign in with bad credentials", %{conn: conn} do
    conn = post conn, Routes.user_path(conn, :sign_in), %{email: "foo1@bar.com", password: "c3pOd0d0"}
    assert json_response(conn, 401)
  end

  test "an user can sign in", %{conn: conn} do
    Accounts.create_user(@valid_attrs)
    conn = post conn, Routes.user_path(conn, :sign_in), %{email: "foo@bar.com", password: "c3pOd0d0"}
    assert json_response(conn, 200)
  end
end

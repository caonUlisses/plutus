defmodule PlutusWeb.IndexControllerTest do
  @moduledoc false
  use PlutusWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "the index route points to the documentation", %{conn: conn} do
    conn = get conn, Routes.index_path(conn, :index)
    assert json_response(conn, 200)
  end

  test "the reports cannot be reached without valid credentials", %{conn: conn} do
    conn = get conn, Routes.index_path(conn, :reports_url)
    assert json_response(conn, 401)
  end

  @tag :authenticated
  test "the reports can be reached with valid credentials", %{conn: conn} do
    conn = get conn, Routes.index_path(conn, :reports_url)
    assert json_response(conn, 200)
  end
end

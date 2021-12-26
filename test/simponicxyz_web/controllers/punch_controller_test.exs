defmodule SimponicxyzWeb.PunchControllerTest do
  use SimponicxyzWeb.ConnCase

  import Simponicxyz.PunchesFixtures

  @create_attrs %{end: ~N[2021-12-19 19:43:00], start: ~N[2021-12-19 19:43:00], user_id: 42}
  @update_attrs %{end: ~N[2021-12-20 19:43:00], start: ~N[2021-12-20 19:43:00], user_id: 43}
  @invalid_attrs %{end: nil, start: nil, user_id: nil}

  describe "index" do
    test "lists all punches", %{conn: conn} do
      conn = get(conn, Routes.punch_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Punches"
    end
  end

  describe "new punch" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.punch_path(conn, :new))
      assert html_response(conn, 200) =~ "New Punch"
    end
  end

  describe "create punch" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.punch_path(conn, :create), punch: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.punch_path(conn, :show, id)

      conn = get(conn, Routes.punch_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Punch"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.punch_path(conn, :create), punch: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Punch"
    end
  end

  describe "edit punch" do
    setup [:create_punch]

    test "renders form for editing chosen punch", %{conn: conn, punch: punch} do
      conn = get(conn, Routes.punch_path(conn, :edit, punch))
      assert html_response(conn, 200) =~ "Edit Punch"
    end
  end

  describe "update punch" do
    setup [:create_punch]

    test "redirects when data is valid", %{conn: conn, punch: punch} do
      conn = put(conn, Routes.punch_path(conn, :update, punch), punch: @update_attrs)
      assert redirected_to(conn) == Routes.punch_path(conn, :show, punch)

      conn = get(conn, Routes.punch_path(conn, :show, punch))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, punch: punch} do
      conn = put(conn, Routes.punch_path(conn, :update, punch), punch: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Punch"
    end
  end

  describe "delete punch" do
    setup [:create_punch]

    test "deletes chosen punch", %{conn: conn, punch: punch} do
      conn = delete(conn, Routes.punch_path(conn, :delete, punch))
      assert redirected_to(conn) == Routes.punch_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.punch_path(conn, :show, punch))
      end
    end
  end

  defp create_punch(_) do
    punch = punch_fixture()
    %{punch: punch}
  end
end

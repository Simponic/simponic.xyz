defmodule SimponicxyzWeb.MotdControllerTest do
  use SimponicxyzWeb.ConnCase

  import Simponicxyz.MotdsFixtures

  @create_attrs %{message: "some message"}
  @update_attrs %{message: "some updated message"}
  @invalid_attrs %{message: nil}

  describe "index" do
    test "lists all motds", %{conn: conn} do
      conn = get(conn, Routes.motd_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Motds"
    end
  end

  describe "new motd" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.motd_path(conn, :new))
      assert html_response(conn, 200) =~ "New Motd"
    end
  end

  describe "create motd" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.motd_path(conn, :create), motd: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.motd_path(conn, :show, id)

      conn = get(conn, Routes.motd_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Motd"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.motd_path(conn, :create), motd: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Motd"
    end
  end

  describe "edit motd" do
    setup [:create_motd]

    test "renders form for editing chosen motd", %{conn: conn, motd: motd} do
      conn = get(conn, Routes.motd_path(conn, :edit, motd))
      assert html_response(conn, 200) =~ "Edit Motd"
    end
  end

  describe "update motd" do
    setup [:create_motd]

    test "redirects when data is valid", %{conn: conn, motd: motd} do
      conn = put(conn, Routes.motd_path(conn, :update, motd), motd: @update_attrs)
      assert redirected_to(conn) == Routes.motd_path(conn, :show, motd)

      conn = get(conn, Routes.motd_path(conn, :show, motd))
      assert html_response(conn, 200) =~ "some updated message"
    end

    test "renders errors when data is invalid", %{conn: conn, motd: motd} do
      conn = put(conn, Routes.motd_path(conn, :update, motd), motd: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Motd"
    end
  end

  describe "delete motd" do
    setup [:create_motd]

    test "deletes chosen motd", %{conn: conn, motd: motd} do
      conn = delete(conn, Routes.motd_path(conn, :delete, motd))
      assert redirected_to(conn) == Routes.motd_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.motd_path(conn, :show, motd))
      end
    end
  end

  defp create_motd(_) do
    motd = motd_fixture()
    %{motd: motd}
  end
end

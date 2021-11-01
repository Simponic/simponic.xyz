defmodule Simponicxyz.MotdsTest do
  use Simponicxyz.DataCase

  alias Simponicxyz.Motds

  describe "motds" do
    alias Simponicxyz.Motds.Motd

    import Simponicxyz.MotdsFixtures

    @invalid_attrs %{message: nil}

    test "list_motds/0 returns all motds" do
      motd = motd_fixture()
      assert Motds.list_motds() == [motd]
    end

    test "get_motd!/1 returns the motd with given id" do
      motd = motd_fixture()
      assert Motds.get_motd!(motd.id) == motd
    end

    test "create_motd/1 with valid data creates a motd" do
      valid_attrs = %{message: "some message"}

      assert {:ok, %Motd{} = motd} = Motds.create_motd(valid_attrs)
      assert motd.message == "some message"
    end

    test "create_motd/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Motds.create_motd(@invalid_attrs)
    end

    test "update_motd/2 with valid data updates the motd" do
      motd = motd_fixture()
      update_attrs = %{message: "some updated message"}

      assert {:ok, %Motd{} = motd} = Motds.update_motd(motd, update_attrs)
      assert motd.message == "some updated message"
    end

    test "update_motd/2 with invalid data returns error changeset" do
      motd = motd_fixture()
      assert {:error, %Ecto.Changeset{}} = Motds.update_motd(motd, @invalid_attrs)
      assert motd == Motds.get_motd!(motd.id)
    end

    test "delete_motd/1 deletes the motd" do
      motd = motd_fixture()
      assert {:ok, %Motd{}} = Motds.delete_motd(motd)
      assert_raise Ecto.NoResultsError, fn -> Motds.get_motd!(motd.id) end
    end

    test "change_motd/1 returns a motd changeset" do
      motd = motd_fixture()
      assert %Ecto.Changeset{} = Motds.change_motd(motd)
    end
  end
end

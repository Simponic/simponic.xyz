defmodule Simponicxyz.PunchesTest do
  use Simponicxyz.DataCase

  alias Simponicxyz.Punches

  describe "punches" do
    alias Simponicxyz.Punches.Punch

    import Simponicxyz.PunchesFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_punches/0 returns all punches" do
      punch = punch_fixture()
      assert Punches.list_punches() == [punch]
    end

    test "get_punch!/1 returns the punch with given id" do
      punch = punch_fixture()
      assert Punches.get_punch!(punch.id) == punch
    end

    test "create_punch/1 with valid data creates a punch" do
      valid_attrs = %{end: ~N[2021-12-19 19:43:00], start: ~N[2021-12-19 19:43:00]}

      assert {:ok, %Punch{} = punch} = Punches.create_punch(valid_attrs)
      assert punch.end == ~N[2021-12-19 19:43:00]
      assert punch.start == ~N[2021-12-19 19:43:00]
    end

    test "create_punch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Punches.create_punch(@invalid_attrs)
    end

    test "update_punch/2 with valid data updates the punch" do
      punch = punch_fixture()
      update_attrs = %{end: ~N[2021-12-20 19:43:00], start: ~N[2021-12-20 19:43:00]}

      assert {:ok, %Punch{} = punch} = Punches.update_punch(punch, update_attrs)
      assert punch.end == ~N[2021-12-20 19:43:00]
      assert punch.start == ~N[2021-12-20 19:43:00]
    end

    test "update_punch/2 with invalid data returns error changeset" do
      punch = punch_fixture()
      assert {:error, %Ecto.Changeset{}} = Punches.update_punch(punch, @invalid_attrs)
      assert punch == Punches.get_punch!(punch.id)
    end

    test "delete_punch/1 deletes the punch" do
      punch = punch_fixture()
      assert {:ok, %Punch{}} = Punches.delete_punch(punch)
      assert_raise Ecto.NoResultsError, fn -> Punches.get_punch!(punch.id) end
    end

    test "change_punch/1 returns a punch changeset" do
      punch = punch_fixture()
      assert %Ecto.Changeset{} = Punches.change_punch(punch)
    end
  end

  describe "punches" do
    alias Simponicxyz.Punches.Punch

    import Simponicxyz.PunchesFixtures

    @invalid_attrs %{end: nil, start: nil, user_id: nil}

    test "list_punches/0 returns all punches" do
      punch = punch_fixture()
      assert Punches.list_punches() == [punch]
    end

    test "get_punch!/1 returns the punch with given id" do
      punch = punch_fixture()
      assert Punches.get_punch!(punch.id) == punch
    end

    test "create_punch/1 with valid data creates a punch" do
      valid_attrs = %{end: ~N[2021-12-19 19:43:00], start: ~N[2021-12-19 19:43:00], user_id: 42}

      assert {:ok, %Punch{} = punch} = Punches.create_punch(valid_attrs)
      assert punch.end == ~N[2021-12-19 19:43:00]
      assert punch.start == ~N[2021-12-19 19:43:00]
      assert punch.user_id == 42
    end

    test "create_punch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Punches.create_punch(@invalid_attrs)
    end

    test "update_punch/2 with valid data updates the punch" do
      punch = punch_fixture()
      update_attrs = %{end: ~N[2021-12-20 19:43:00], start: ~N[2021-12-20 19:43:00], user_id: 43}

      assert {:ok, %Punch{} = punch} = Punches.update_punch(punch, update_attrs)
      assert punch.end == ~N[2021-12-20 19:43:00]
      assert punch.start == ~N[2021-12-20 19:43:00]
      assert punch.user_id == 43
    end

    test "update_punch/2 with invalid data returns error changeset" do
      punch = punch_fixture()
      assert {:error, %Ecto.Changeset{}} = Punches.update_punch(punch, @invalid_attrs)
      assert punch == Punches.get_punch!(punch.id)
    end

    test "delete_punch/1 deletes the punch" do
      punch = punch_fixture()
      assert {:ok, %Punch{}} = Punches.delete_punch(punch)
      assert_raise Ecto.NoResultsError, fn -> Punches.get_punch!(punch.id) end
    end

    test "change_punch/1 returns a punch changeset" do
      punch = punch_fixture()
      assert %Ecto.Changeset{} = Punches.change_punch(punch)
    end
  end
end

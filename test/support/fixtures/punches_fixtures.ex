defmodule Simponicxyz.PunchesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Simponicxyz.Punches` context.
  """

  @doc """
  Generate a punch.
  """
  def punch_fixture(attrs \\ %{}) do
    {:ok, punch} =
      attrs
      |> Enum.into(%{
        end: ~N[2021-12-19 19:43:00],
        start: ~N[2021-12-19 19:43:00]
      })
      |> Simponicxyz.Punches.create_punch()

    punch
  end

  @doc """
  Generate a punch.
  """
  def punch_fixture(attrs \\ %{}) do
    {:ok, punch} =
      attrs
      |> Enum.into(%{
        end: ~N[2021-12-19 19:43:00],
        start: ~N[2021-12-19 19:43:00],
        user_id: 42
      })
      |> Simponicxyz.Punches.create_punch()

    punch
  end
end

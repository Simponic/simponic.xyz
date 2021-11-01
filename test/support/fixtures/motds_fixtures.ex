defmodule Simponicxyz.MotdsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Simponicxyz.Motds` context.
  """

  @doc """
  Generate a motd.
  """
  def motd_fixture(attrs \\ %{}) do
    {:ok, motd} =
      attrs
      |> Enum.into(%{
        message: "some message"
      })
      |> Simponicxyz.Motds.create_motd()

    motd
  end
end

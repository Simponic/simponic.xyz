defmodule Simponicxyz.Motds do
  @moduledoc """
  The Motds context.
  """

  import Ecto.Query, warn: false
  alias Simponicxyz.Repo

  alias Simponicxyz.Motds.Motd

  @doc """
  Returns the list of motds.

  ## Examples

      iex> list_motds()
      [%Motd{}, ...]

  """
  def list_motds do
    Repo.all(Motd)
  end

  @doc """
  Gets a single motd.

  Raises `Ecto.NoResultsError` if the Motd does not exist.

  ## Examples

      iex> get_motd!(123)
      %Motd{}

      iex> get_motd!(456)
      ** (Ecto.NoResultsError)

  """
  def get_motd!(id), do: Repo.get!(Motd, id)

  @doc """
  Creates a motd.

  ## Examples

      iex> create_motd(%{field: value})
      {:ok, %Motd{}}

      iex> create_motd(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_motd(attrs \\ %{}) do
    %Motd{}
    |> Motd.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a motd.

  ## Examples

      iex> update_motd(motd, %{field: new_value})
      {:ok, %Motd{}}

      iex> update_motd(motd, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_motd(%Motd{} = motd, attrs) do
    motd
    |> Motd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a motd.

  ## Examples

      iex> delete_motd(motd)
      {:ok, %Motd{}}

      iex> delete_motd(motd)
      {:error, %Ecto.Changeset{}}

  """
  def delete_motd(%Motd{} = motd) do
    Repo.delete(motd)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking motd changes.

  ## Examples

      iex> change_motd(motd)
      %Ecto.Changeset{data: %Motd{}}

  """
  def change_motd(%Motd{} = motd, attrs \\ %{}) do
    Motd.changeset(motd, attrs)
  end
end

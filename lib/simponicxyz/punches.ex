defmodule Simponicxyz.Punches do
  @moduledoc """
  The Punches context.
  """

  import Ecto.Query, warn: false
  alias Simponicxyz.Repo

  alias Simponicxyz.Punches.Punch

  @doc """
  Returns the list of punches.

  ## Examples

      iex> list_punches()
      [%Punch{}, ...]

  """
  def list_punches do
    Repo.all(Punch)
  end

  def filter_punches_by_user_id(user_id) do
    Repo.all(from x in Punch, where: x.user_id == ^user_id, select: x)
  end

  @doc """
  Gets a single punch.

  Raises `Ecto.NoResultsError` if the Punch does not exist.

  ## Examples

      iex> get_punch!(123)
      %Punch{}

      iex> get_punch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_punch!(id), do: Repo.get!(Punch, id)

  @doc """
  Creates a punch.

  ## Examples

      iex> create_punch(%{field: value})
      {:ok, %Punch{}}

      iex> create_punch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_punch(attrs \\ %{}) do
    %Punch{}
    |> Punch.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, attrs["user"])
    |> Repo.insert()
  end

  @doc """
  Updates a punch.

  ## Examples

      iex> update_punch(punch, %{field: new_value})
      {:ok, %Punch{}}

      iex> update_punch(punch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_punch(%Punch{} = punch, attrs) do
    punch
    |> Punch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a punch.

  ## Examples

      iex> delete_punch(punch)
      {:ok, %Punch{}}

      iex> delete_punch(punch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_punch(%Punch{} = punch) do
    Repo.delete(punch)
  end

  def delete_punches_by_user(user_id) do
    Repo.delete_all(from x in Punch, where: x.user_id == ^user_id, select: x)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking punch changes.

  ## Examples

      iex> change_punch(punch)
      %Ecto.Changeset{data: %Punch{}}

  """
  def change_punch(%Punch{} = punch, attrs \\ %{}) do
    Punch.changeset(punch, attrs)
  end

  def in_date_range_by_user_where_task(user_id, %{:start => start, :end_t => end_t}, task) do
    Repo.all(from x in Punch, where: x.user_id == ^user_id and x.task == ^task and x.start <= ^end_t and x.end >= ^start, select: x)
  end

  def bound_times(%Punch{} = punch, start, end_t) do
    Map.merge(punch, 
      %{
        :start => (if punch.start < start, do: start, else: punch.start),
        :end => (if punch.end > end_t, do: end_t, else: punch.end)
      })
  end
end

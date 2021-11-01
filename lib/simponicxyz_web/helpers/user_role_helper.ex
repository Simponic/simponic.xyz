defmodule SimponicxyzWeb.UserRoleHelper do
  def is_admin?(user) do
    if !is_nil(user) do
      user.role == "admin"
    else
      false
    end
  end
end
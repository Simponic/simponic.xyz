defmodule SimponicxyzWeb.MotdHelper do
  alias Simponicxyz.Motds
  def random_motd() do
    motd = Motds.random()
    if is_nil(motd) do
      "Motds not initialized"
    else
      motd.message
    end
  end
end

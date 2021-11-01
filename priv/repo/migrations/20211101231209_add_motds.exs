defmodule Simponicxyz.Repo.Migrations.AddMotds do
  use Ecto.Migration

  import Ecto.Query

  alias Simponicxyz.Repo
  alias Simponicxyz.Motds.Motd

  def up do
    messages = [
      "Hello, world", "Emacs > Vim", "(setq lisp-is-best t)",
      "Functional Programming on top",
      "\"A baller, a shot caller, an Arch Linux installer\"",
      "One distro to rule them all, and in the darkness bind them",
      "Proprietary software leads to anger, anger leads to hate, hate leads to suffering",
      "I'll tell you once, and I'll tell you again. There's always a prime between n and 2n.",
      "1. e4 e5 2. Ke2", "Forth is a cool language!",
      ">++++++[<+++++++++>-]<.+++.-----.--.--.",
      "It's the year of the Linux desktop, bois", "DWM is a sweet window manager",
      "e^(iπ)+1", "Lambda calculus isn't even calculus!", "Also try Minecraft!",
      "The days are just packed",
      "One has only just started the war against bloat when one has written all their coreutils from scratch",
      "When will we have No-Instruction-Set-Computing?", "Java is sus", "I'm R U R' U' and I know it",
      "Windows sucks", "Bruh", "My name has nothing to do with the word \"simp\""
    ]
    Enum.map(messages, fn x -> Repo.insert!(%Motd{message: x}) end)
  end

  def down do
    (from x in Motd, select: x)
    |> Repo.delete_all()
  end
end

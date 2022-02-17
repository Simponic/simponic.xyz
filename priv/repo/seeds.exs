# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Simponicxyz.Repo.insert!(%Simponicxyz.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

messages = [
  "Hello, world",
  "Emacs > Vim",
  "Functional Programming on top",
  "\"A baller, a shot caller, an Arch Linux installer\"",
  "One distro to rule them all, and in the darkness bind them",
  "Proprietary software leads to anger, anger leads to hate, hate leads to suffering",
  "I'll tell you once, and I'll tell you again. There's always a prime between n and 2n.",
  "1. e4 e5 2. Ke2",
  ">++++++[<+++++++++>-]<.+++.-----.--.--.",
  "It's the year of the Linux desktop, bois",
  "DWM is a sweet window manager",
  "e^(iπ)+1",
  "Lambda calculus isn't even calculus!",
  "Also try Minecraft!",
  "The days are just packed",
  "When will we have No-Instruction-Set-Computing?",
  "I'm R U R' U' and I know it"
]
Enum.map(messages, fn x -> Repo.insert!(%Motd{message: x}) end)
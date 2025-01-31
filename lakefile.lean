import Lake
open Lake DSL

package Straume

lean_lib Straume

require "leanprover-community" / "batteries" @ git "main"

require "lurk-lab" / "LSpec" @ git "7f2c46b"

require YatimaStdLib from git
  "https://github.com/imbrem/YatimaStdLib.lean" @ "main"

@[default_target]
lean_exe straume where
  root := `Main

lean_exe Tests.Iterator
lean_exe Tests.Zeptoparsec

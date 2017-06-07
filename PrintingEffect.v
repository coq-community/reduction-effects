(**********************************************************************)
(* The following defines two printing functions and commands to       *)
(* activate them                                                      *)
(**********************************************************************)

Declare ML Module "redeffect_plugin".

(** [print] is a function intended for printing terms *)

Definition print {X} (x : X) := tt.

(** The same, but with an "identity" computational behavior *)

Definition print_id {X} (x : X) := x.

(** These commands trigger [print] and [print_id]'s side effect behavior *)

Declare Printing Effect print.
Declare Printing Effect print_id.

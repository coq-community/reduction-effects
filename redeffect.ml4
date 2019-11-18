(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2015     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(*i camlp4deps: "grammar/grammar.cma" i*)

open Constr
open Stdarg
open Term
open Reductionops

(** *******************************************************************)
(** Grammar entry for binding a constant to the printing hook         *)
(** *******************************************************************)

let check_ID_type typ =
  let env = Global.env () in
  let decls,_ = splay_prod env Evd.empty typ in
  match List.rev decls with
  | (_,t)::(_,u)::_
     when
       let t = EConstr.to_constr Evd.empty t in
       let u = EConstr.to_constr Evd.empty u in
       is_Type (Reduction.whd_all env t) &&
       isRelN 1 (Reduction.whd_all env u) -> ()
  | _ ->
    CErrors.user_err Pp.(strbrk "Printing function should be of type \"forall A:Type, A -> T\" for some T and it will print its second argument." ++ Printer.pr_econstr typ)

(** Checks whether the candidate printing function
    both is a constant and has (at least) two arguments *)
let check_valid_print_ref x =
  (* First check if it has the type of an identity function *)
  let (typ_x,_) = UnivGen.type_of_global x in check_ID_type (EConstr.of_constr typ_x);
  (* Then check if it is a constant*)
  if not(Globnames.isConstRef x) then
    CErrors.user_err (Pp.strbrk "Printing function should be a constant.")

let printing_hook env sigma c =
  let (f,l) = decompose_app c in
  if List.length l >= 2 then
  Feedback.msg_notice (Printer.pr_constr_env env sigma (List.nth l 1))

let printing_name = "Printing"

let _ = declare_reduction_effect printing_name printing_hook

let declare_effect print_ref =
  let print_ref = Smartlocate.global_with_alias print_ref in
  check_valid_print_ref print_ref;
  match print_ref with
  | ConstRef print_ref ->
  set_reduction_effect print_ref printing_name

VERNAC COMMAND EXTEND PrintingEffect CLASSIFIED AS SIDEFF
| [ "Declare" "Printing" "Effect" global(print_ref) ] ->
    [ declare_effect print_ref ]
END

(* Testing the printing side effect *)

Require Import PrintingEffect.
Eval cbv in (fun f x => f (f (f x))) (fun x => S (print_id x)) 0.
Eval cbn in (fun f x => f (f (f x))) print_id 0. (* Not so interesting *)
Eval hnf in (fun f x => f (f (f x))) print_id 0. (* Not so interesting *)
Eval simpl in (fun f x => f (f (f x))) (fun x => print_id (1+x) + 1) 0.
Eval cbv in let x := print 3 in let y := print 4 in tt.

#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt","List"];*)


(* ::Input:: *)
(*{ingredients,allergens}=Transpose@TextWords@StringCases[input,i:Except["("]..~~RepeatedNull["(contains"~~a:Except[")"]..~~")",1]:>Sequence[i,a]];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*m=With[{a=Union@Flatten@allergens},AssociationThread[a->(First/@Position[allergens,#,{2}]&/@a)]](*maps each allergen to foods containing it*);*)


(* ::Input:: *)
(*a=First/@Join@@Reap[NestWhile[DeleteCases[#,#[[1,1]]&@Sow@Select[Length@#==1&]@#,{2}]&,(Intersection@@ingredients[[#]]&)/@m,Flatten@Values@#=!={}&]][[2,1]];*)


(* ::Input:: *)
(*Total[Count[ingredients,#,{2}]&/@Complement[Flatten@ingredients,Values@a]]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*StringRiffle[Values@KeySort@a,","]*)

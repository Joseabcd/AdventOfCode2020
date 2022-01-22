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
(*Reap[NestWhile[DeleteCases[#,Sow@Select[Length@#==1&][#][[1,1]],{2}]&,(Intersection@@ingredients[[#]]&)/@m,Flatten@Values@#=!={}&]][[2,1]](*gives ingredients with allergen*);*)


(* ::Input:: *)
(*Total[Count[ingredients,#,{2}]&/@Complement[Flatten@ingredients,%]]*)

#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*p=25;*)


(* ::Input:: *)
(*list=ToExpression@StringSplit[input,"\n"];*)


(* ::Input:: *)
(*m=list[[p+Position[BlockMap[MemberQ[Total/@Subsets[Most@#,{2}],Last@#]&,list,p+1,1],False,{1},1][[1,1]]]]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*Total[MinMax@@SequenceCases[list,s:{_,_,___}/;Total@s==m]]*)

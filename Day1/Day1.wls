#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*inputList=ToExpression@StringSplit[input,"\n"];*)


(* ::Input:: *)
(*Times@@@Last@Reap@DeleteDuplicates[inputList,If[#1+#2==2020,Sow@#1;Sow@#2;True,False]&]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*Times@@@Pick[#,Thread[Total/@#==2020]]&@Subsets[inputList,{3}]*)

#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*list=ToExpression@StringSplit[input,","];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*Last@Nest[#~Join~FirstPosition[Reverse@Most@#,Last@#,{0}]&,list,2020-Length@list]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*i=Length@list;lastlySpoken=AssociationThread[list->Range@i];*)
(*Nest[(i++;n=i-Lookup[lastlySpoken,#,i];*)
(*AssociateTo[lastlySpoken,#->i];n)&,0,30000000-i-1]*)

#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*{s,messages}=SplitBy[Import[NotebookDirectory[]<>"input.txt","List"],StringMatchQ[("a"|"b")..]];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*rules=Association@StringCases[s,k:DigitCharacter..~~":"~~l__..:>k->StringReplace[ l,a:Except["|"]..:>"("<>a<>")"]];*)


(* ::Input:: *)
(*rules=StringReplace[{" "...~~p:"("|")"~~" "...:>p," "..->"~~"}]/@rules;*)


(* ::Input:: *)
(*Count[StringMatchQ[messages,ToExpression@FixedPoint[StringReplace[d:DigitCharacter..:>rules[d]],rules["0"]]],True]*)


(* ::Input:: *)
(**)

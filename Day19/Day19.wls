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


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*rules["8"]="(42)|(42~~8)";rules["11"]="(42~~31)|(42~~11~~31)";*)


(* ::Input:: *)
(*rule0[i_]:=Nest[StringReplace[d:DigitCharacter..:>rules[d]],rules["0"],i]*)


(* ::Input:: *)
(*i=1;n=0;*)
(*While[*)
(*n0=n;n=Count[StringMatchQ[messages,ToExpression@rule0[i]/.{_Integer->""}],True];i++;*)
(*n==0||n!=n0 *)
(*];*)
(*n*)

#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*list=StringSplit[input,"\n"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*Count[Flatten@StringCases[list,l:NumberString~~"-"~~h:NumberString~~" "~~k:LetterCharacter~~":"~~" "~~p:LetterCharacter..:>Between[StringCount[p,k],ToExpression/@{l,h}]],True]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*Count[Flatten@StringCases[list,i1:NumberString~~"-"~~i2:NumberString~~" "~~k:LetterCharacter~~":"~~" "~~p:LetterCharacter..:>Count[StringPart[p,ToExpression/@{i1,i2}],k]==1],True]*)

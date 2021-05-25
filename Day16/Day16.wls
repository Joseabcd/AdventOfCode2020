#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*rules=StringCases[input,f:(LetterCharacter|" ")..~~": "~~l1:DigitCharacter..~~"-"~~u1:DigitCharacter..~~" or "~~l2:DigitCharacter..~~"-"~~u2:DigitCharacter..:>f->Interval@@ToExpression@{{l1,u1},{l2,u2}}];*)


(* ::Input:: *)
(*nearbyValues=ToExpression@StringSplit[StringSplit[Last@StringSplit[input,"nearby tickets:"],"\n"],","];*)


(* ::Input:: *)
(*Total[Pick[#,Not/@IntervalMemberQ[IntervalUnion@@Values@rules,#]]&@Flatten@nearbyValues]*)

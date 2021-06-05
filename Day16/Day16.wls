#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*rules=StringCases[input,f:(LetterCharacter|" ")..~~": "~~l1:DigitCharacter..~~"-"~~u1:DigitCharacter..~~" or "~~l2:DigitCharacter..~~"-"~~u2:DigitCharacter..:>f->Interval@@ToExpression@{{l1,u1},{l2,u2}}];*)


(* ::Input:: *)
(*n=Length@rules;tickets=ToExpression@StringCases[input,t:Repeated[DigitCharacter..~~","|"\n",{n}]:>StringSplit[t,","]];*)


(* ::Input:: *)
(*Total[Pick[#,Not/@IntervalMemberQ[IntervalUnion@@Values@rules,#]]&@Flatten@tickets]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*validTickets=Pick[#,And@@@IntervalMemberQ[IntervalUnion@@Values@rules,#]]&@tickets;*)


(* ::Input:: *)
(*possibilities=With[{i=#},Pick[Keys@rules,And@@@(IntervalMemberQ[#,#[[i]]&/@validTickets]&/@Values@rules)]]&/@Range@n;*)


(* ::Input:: *)
(*fields=ConstantArray["",n];Nest[With[{p=Position[#,{Repeated[_String,{Min@DeleteCases[Length/@#,0]}]}][[1,1]]},fields[[p]]=#[[p]][[1]];DeleteCases[ReplacePart[#,p->{}],#[[p]][[1]],{2}]]&,#,n]&@possibilities;*)


(* ::Input:: *)
(*Times@@Extract[First@tickets,Position[StringMatchQ[fields,"departure"~~___],True]]*)

#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*decks=ToExpression@StringSplit[StringCases[input,(DigitCharacter..~~"\n"|EndOfString)..],"\n"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*playRound[decks_]:=With[{c=First/@decks},MapAt[Flatten@*Append[Reverse@Sort@c],Rest/@decks,Last@Ordering@c]]*)


(* ::Input:: *)
(*score[deck_]:=Total[Reverse@Range@Length@deck deck]*)


(* ::Input:: *)
(*score@Flatten@NestWhile[playRound,decks,FreeQ@{}]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*playRound[decks_?(And@@Thread[First/@#<Length/@#]&)]:=(*winner of round is result of another game*)*)
(*With[{w=First@playGame[{#[[2;;1+decks[[1,1]]]],#2[[2;;1+decks[[2,1]]]]}&@@decks]},MapAt[Flatten@*Append[(First/@decks)[[{w,{2,1}[[w]]}]]],Rest/@decks,w]];*)


(* ::Input:: *)
(*playGame[decks_]:=Module[{m={{},{}}},*)
(*Catch[NestWhile[(If[Or@@MapThread[MemberQ,{m,#}],Throw@{1,First@#}];m=MapThread[Append,{m,#}];playRound@#)&,*)
(*decks,FreeQ@{}]/.{{c:{__},{}}:>{1,c},{{},c:{__}}:>{2,c}}]]*)


(* ::Text:: *)
(*(stopping condition implemented appending successive decks to a memory list, what is slow, but for now works).*)


(* ::Input:: *)
(*score@Last@playGame[decks]*)

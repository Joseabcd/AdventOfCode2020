#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


decks=ToExpression@StringSplit[StringCases[input,(DigitCharacter..~~"\n"|EndOfString)..],"\n"];


(* ::Subsection:: *)
(*Part 1*)


playRound[decks_]:=With[{c=First/@decks},MapAt[Flatten@*Append[Reverse@Sort@c],Rest/@decks,Last@Ordering@c]]


score[deck_]:=Total[Reverse@Range@Length@deck deck]


score@Flatten@NestWhile[playRound,decks,FreeQ@{}]


(* ::Subsection:: *)
(*Part 2*)


playRound[decks_?(And@@Thread[First/@#<Length/@#]&)]:=(*winner of round is result of another game*)
With[{w=First@playGame[{#[[2;;1+decks[[1,1]]]],#2[[2;;1+decks[[2,1]]]]}&@@decks]},MapAt[Flatten@*Append[(First/@decks)[[{w,{2,1}[[w]]}]]],Rest/@decks,w]];


playGame[decks_]:=Module[{m={{},{}}},
Catch[NestWhile[(If[Or@@MapThread[MemberQ,{m,#}],Throw@{1,First@#}];m=MapThread[Append,{m,#}];playRound@#)&,
decks,FreeQ@{}]/.{{c:{__},{}}:>{1,c},{{},c:{__}}:>{2,c}}]]


(* ::Text:: *)
(*(stopping condition implemented appending successive decks to a memory list, what is slow, but for now works).*)


score@Last@playGame[decks]

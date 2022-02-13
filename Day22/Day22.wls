#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*decks=ToExpression@StringSplit[StringCases[input,(DigitCharacter..~~"\n"|EndOfString)..],"\n"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*playRound=With[{c=First/@#},MapAt[Flatten@*Append[Reverse@Sort@c],Rest/@#,Last@Ordering@c]]&;*)


(* ::Input:: *)
(*Total[Reverse@Range@Max@decks*Flatten@NestWhile[playRound,decks,FreeQ@{}]]*)

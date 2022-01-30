#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*decks=ToExpression@StringSplit[StringCases[input,(DigitCharacter..~~"\n"|EndOfString)..],"\n"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*Total[Reverse@Range@Max@decks*Flatten@NestWhile[{Append[RotateLeft@Last@#,#[[1,1]]],Rest@First@#}&@*SortBy[First],decks,FreeQ@{}]]*)

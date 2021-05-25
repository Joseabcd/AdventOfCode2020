#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*colorPattern=LetterCharacter..~~" "~~LetterCharacter..;*)


(* ::Input:: *)
(*quantities=<||>(*bag quantities to be recorded for part 2*);*)
(*rules=StringCases[input,StartOfString|".\n"~~c:colorPattern~~" "~~"bags contain"~~s:(" "~~*)
(*DigitCharacter~~" "~~colorPattern~~" "~~"bag"|"bags"~~","|".")...:>(AppendTo[quantities,c->StringCases[s,DigitCharacter]];c->StringCases[s,colorPattern]),Overlaps->True] ;*)


(* ::Input:: *)
(*Length@Union@Flatten@NestWhileList[Cases[rules,(k_->{___,Alternatives@@#,___}):>k]&,{"shiny gold"},#!={}&]-1*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*nestedQuantities=Map[ToExpression@quantities[[#]]&,Most@NestWhileList[Map[Association[rules][[#]]&,#,{-1}]&,"shiny gold",Flatten@{#}!={}&],{-1}];*)


(* ::Input:: *)
(*Total[FoldList[Times,nestedQuantities],-1]*)

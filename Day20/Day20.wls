#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*{ids,tiles}=Thread@StringCases[input,"Tile "~~id:DigitCharacter..~~":\n"~~tile:("#"|"."|"\n")..:>{id,tile}];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*takeBorder[img_]:={First@#,""<>StringPart[#,-1],Last@#,""<>StringPart[#,1]}&@StringSplit[img,"\n"]*)


(* ::Text:: *)
(*Borders turn out to match either no other border (meaning they are part of the full-image boundary), or just one other border (for the borders inside the image), so no need to assemble the image here.*)


(* ::Input:: *)
(*borders=takeBorder/@tiles;*)
(*Times@@ToExpression@ids[[Flatten@Position[Count[borders,#|StringReverse@#,{2}]&/@#&/@borders,a__/;Total@a==6]]]*)

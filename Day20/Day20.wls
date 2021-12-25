#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*{ids,tiles}=Thread@StringCases[input,"Tile "~~id:DigitCharacter..~~":\n"~~tile:("#"|"."|"\n")..:>{id,tile}];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*takeBorder[img_]:={First@#,""<>StringPart[#,-1],Last@#,""<>StringPart[#,1]}&@StringSplit[img,"\n"];*)
(*f={#,StringReverse@#}&;*)


(* ::Text:: *)
(*Borders turn out to match either no other border (meaning they are part of the full-image boundary), or just one other border (for the borders inside the image), so no need to assemble the image here.*)


(* ::Input:: *)
(*borders=takeBorder/@tiles;b=StringRiffle/@borders;*)
(*c=Flatten/@(Position[StringContainsQ[b,f@#],True]&/@borders);*)
(*c=MapThread[Complement,{c,List/@Range@Length@c}](*connectivity of each tile*);*)


(* ::Input:: *)
(*{corners,edges}=Flatten@Position[c,{Repeated[_,#]}]&/@{2,3};*)


(* ::Input:: *)
(*Times@@ToExpression@ids[[corners]]*)

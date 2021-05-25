#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*{instructions,{masks}}=Reap@StringCases[StringSplit[input,"mask = "~~m:(DigitCharacter|"X")..:>(Sow@m;Unevaluated@Sequence[])],"mem["~~l:DigitCharacter..~~"] = "~~v:DigitCharacter..:>ToExpression@{l,v}];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*applyMask[mask_String,n_Integer]:=FromDigits[ReplacePart[IntegerDigits[n,2,36],Alternatives@@First/@StringPosition[mask,ToString@#]->#&/@{0,1}],2]*)


(* ::Input:: *)
(*ClearAll@mem;*)
(*MapIndexed[(mem[First@#]=applyMask[masks[[First@#2]],Last@#]);&,instructions,{2}];*)
(*Total@Values@DownValues@mem*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*applyMask[mask_String,n_Integer]:=With[{overwritten=Alternatives@@First/@StringPosition[mask,"1"]->1},FromDigits[#,2]&/@(ReplacePart[IntegerDigits[n,2,36],{overwritten,##}]&@@@Thread/@Distribute[{#}->Tuples[{0,1},Length@#],List]&[First/@StringPosition[mask,"X"]])]*)


(* ::Input:: *)
(*ClearAll@mem;*)
(*MapIndexed[With[{locations=applyMask[masks[[First@#2]],First@#],value=Last@#},(mem[#]=value)&/@locations;]&,instructions,{2}];*)
(*Total@Values@DownValues@mem*)

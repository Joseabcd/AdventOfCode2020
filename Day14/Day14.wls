#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


{instructions,{masks}}=Reap@StringCases[StringSplit[input,"mask = "~~m:(DigitCharacter|"X")..:>(Sow@m;Unevaluated@Sequence[])],"mem["~~l:DigitCharacter..~~"] = "~~v:DigitCharacter..:>ToExpression@{l,v}];


(* ::Subsection:: *)
(*Part 1*)


applyMask[mask_String,n_Integer]:=FromDigits[ReplacePart[IntegerDigits[n,2,36],Alternatives@@First/@StringPosition[mask,ToString@#]->#&/@{0,1}],2]


ClearAll@mem;
MapIndexed[(mem[First@#]=applyMask[masks[[First@#2]],Last@#]);&,instructions,{2}];
Total@Values@DownValues@mem


(* ::Subsection:: *)
(*Part 2*)


applyMask[mask_String,n_Integer]:=With[{overwritten=Alternatives@@First/@StringPosition[mask,"1"]->1},FromDigits[#,2]&/@(ReplacePart[IntegerDigits[n,2,36],{overwritten,##}]&@@@Thread/@Distribute[{#}->Tuples[{0,1},Length@#],List]&[First/@StringPosition[mask,"X"]])]


ClearAll@mem;
MapIndexed[With[{locations=applyMask[masks[[First@#2]],First@#],value=Last@#},(mem[#]=value)&/@locations;]&,instructions,{2}];
Total@Values@DownValues@mem

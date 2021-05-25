#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*{time,{buses,positions}}={First@#,{#[[#2]],#2}&[#,Flatten@Position[_Integer]@#]&@Rest@#}&@StringCases[input,{d:DigitCharacter..:>FromDigits@d,"x"}];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*buses[[#]]#2[[#]]&[First@Ordering@#,#]&[buses Ceiling[time/buses]-time]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Subsubsection:: *)
(*Brute force*)


(* ::Input:: *)
(*{step,offset}={#2[[#]],positions[[#]]-1}&[Last@Ordering@#,#]&@buses;*)


(* ::Input:: *)
(*i=1;While[t=step*i;Union@Mod[t-offset+positions-1,buses]!={0},i+=1];t-offset*)


(* ::Subsubsection:: *)
(*Number theory approach*)


(* ::Input:: *)
(*m=LCM@@buses ;a=m Total[1/buses];b=m Total[(positions-1)/buses];*)


(* ::Input:: *)
(*Mod[-ExtendedGCD[a,m][[2,1]] b,m]*)

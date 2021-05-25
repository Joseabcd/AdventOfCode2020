#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*list=StringSplit[input,"\n"];*)


(* ::Input:: *)
(*h=Length@list;w=StringLength@First@list;*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*dx=3;dy=1;*)


(* ::Input:: *)
(*xn=1+(h-1)/dy dx(*horizontal position when bottom is reached*);*)


(* ::Input:: *)
(*fullList=StringRepeat[#,Ceiling[xn/w],xn ]&/@list(*the infinite path truncated to the minimum width required to reach bottom*);*)


(* ::Input:: *)
(*treesCoords=Flatten[MapThread[Thread/@Thread@{##}&,{#,Range@Length@#}]&@(First/@#&/@StringPosition[fullList,"#"]),1];*)


(* ::Input:: *)
(*Count[Divide[#-1,{3,1}]&/@treesCoords,{a_,a_}](*points belonging to the path at step s satisfy: {(x-1)/dx,(y-1)/dy}={s,s}*)*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Text:: *)
(*Same as above, mapped for every slope provided.*)


(* ::Input:: *)
(*slopes={{1,1},{3,1},{5,1},{7,1},{1,2}};*)


(* ::Input:: *)
(*xnList=1+(h-1)/#2 #1&@@@slopes;*)


(* ::Input:: *)
(*fullLists=With[{xn=#},StringRepeat[#,Ceiling[xn/w],xn ]&/@list]&/@xnList;*)


(* ::Input:: *)
(*treesCoords=With[{fullList=#},Flatten[MapThread[Thread/@Thread@{##}&,{#,Range@Length@#}]&@(First/@#&/@StringPosition[fullList,"#"]),1]]&/@fullLists;*)


(* ::Input:: *)
(*Times@@Count[{a_,a_}]/@MapIndexed[(#1-1)/slopes[[First@#2]]&,treesCoords,{2}]*)

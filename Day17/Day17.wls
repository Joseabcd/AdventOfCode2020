#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*inputArray=Fold[StringSplit,input,{"\n",""}];*)


(* ::Subsection:: *)
(*Parts 1 and 2*)


(* ::Input:: *)
(*d=4;*)


(* ::Input:: *)
(*kernel=CenterArray[0,ConstantArray[3,d],1];*)


(* ::Input:: *)
(*rules[array_]:={#->".",#2->"#"}&@@(activeNeighbours=Map[Count["#"]@*Flatten,ListConvolve[kernel,array,2,".",Times,List],{d}];*)
(*Position[MapThread[#,{activeNeighbours, array},d],True,{d}]&/@{#2=="#"&&#!=2&&#!=3&,#2=="."&&#==3&})*)


(* ::Input:: *)
(*Count[Nest[ReplacePart[#,rules[#]]&@ArrayPad[#,ConstantArray[1,{d,2}],"."]&,Nest[List,inputArray,d-2],6],"#",{d}]*)

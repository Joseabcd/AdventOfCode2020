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
(*kernel=CenterArray[0,ConstantArray[3,d],1];klist=ConstantArray[2,{2,d}];klist[[2,1]]=1;*)


(* ::Input:: *)
(*rules[array_]:={#->".",#2->"#"}&@@(activeNeighbours=Map[Count["#"]@*Flatten,ListConvolve[kernel,Append[array,array[[-2]]],klist,".",Times,List],{d}];*)
(*Position[MapThread[#,{activeNeighbours, array},d],True,{d}]&/@{#2=="#"&&#!=2&&#!=3&,#2=="."&&#==3&})*)


(* ::Input:: *)
(*p=Prepend[ConstantArray[1,{d-1,2}],{1,0}];Total[2Most@#]+Last@#&[Count[#,"#",{d-1}]&/@Nest[ReplacePart[#,rules[#]]&@ArrayPad[#,p,"."]&,Nest[List,inputArray,d-2],6]]*)

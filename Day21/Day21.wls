#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt","List"];


{ingredients,allergens}=Transpose@TextWords@StringCases[input,i:Except["("]..~~RepeatedNull["(contains"~~a:Except[")"]..~~")",1]:>Sequence[i,a]];


(* ::Subsection:: *)
(*Part 1*)


m=With[{a=Union@Flatten@allergens},AssociationThread[a->(First/@Position[allergens,#,{2}]&/@a)]](*maps each allergen to foods containing it*);


a=First/@Join@@Reap[NestWhile[DeleteCases[#,#[[1,1]]&@Sow@Select[Length@#==1&]@#,{2}]&,(Intersection@@ingredients[[#]]&)/@m,Flatten@Values@#=!={}&]][[2,1]];


Total[Count[ingredients,#,{2}]&/@Complement[Flatten@ingredients,Values@a]]


(* ::Subsection:: *)
(*Part 2*)


StringRiffle[Values@KeySort@a,","]

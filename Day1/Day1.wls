#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


inputList=ToExpression@StringSplit[input,"\n"];


Times@@@Last@Reap@DeleteDuplicates[inputList,If[#1+#2==2020,Sow@#1;Sow@#2;True,False]&]


(* ::Subsection:: *)
(*Part 2*)


Times@@@Pick[#,Thread[Total/@#==2020]]&@Subsets[inputList,{3}]

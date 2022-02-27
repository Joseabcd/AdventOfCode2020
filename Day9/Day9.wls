#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


p=25;


list=ToExpression@StringSplit[input,"\n"];


m=list[[p+Position[BlockMap[MemberQ[Total/@Subsets[Most@#,{2}],Last@#]&,list,p+1,1],False,{1},1][[1,1]]]]


(* ::Subsection:: *)
(*Part 2*)


Total[MinMax@@SequenceCases[list,s:{_,_,___}/;Total@s==m]]

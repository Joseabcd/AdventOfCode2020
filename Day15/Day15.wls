#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


list=ToExpression@StringSplit[input,","];


(* ::Subsection:: *)
(*Part 1*)


Last@Nest[#~Join~FirstPosition[Reverse@Most@#,Last@#,{0}]&,list,2020-Length@list]


(* ::Subsection:: *)
(*Part 2*)


i=Length@list;lastlySpoken=AssociationThread[list->Range@i];
Nest[(i++;n=i-Lookup[lastlySpoken,#,i];
AssociateTo[lastlySpoken,#->i];n)&,0,30000000-i-1]

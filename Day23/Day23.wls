#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

(* ::Input::Initialization:: *)
input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Input::Initialization:: *)
circle= ToExpression@StringSplit[input,""];


(* ::Subsection:: *)
(*Part 1*)


(* ::Input::Initialization:: *)
""<>ToString/@(Nest[RotateLeft[Insert[#2,Splice@#,1+Position[#2,Max[Cases[#2,n_/;n<First@#2]/.{{}->#2}]]]&@@TakeDrop[#,{2,4}]]&,circle,100]/.{{h___,1,t___}:>{t,h}})

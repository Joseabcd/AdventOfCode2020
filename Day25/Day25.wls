#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

(* ::Input::Initialization:: *)
input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


(* ::Input::Initialization:: *)
publicKeys=ToExpression@StringSplit@input;


(* ::Input::Initialization:: *)
Nest[Mod[publicKeys[[1]]#,20201227]&,1,Length@NestWhileList[Mod[7#,20201227]&,1,#!=publicKeys[[2]]&]-1]

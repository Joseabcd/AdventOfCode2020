#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


Total[CountDistinct/@Characters[StringJoin/@StringSplit[StringSplit[input,"\n\n"],"\n"]]]


(* ::Subsection:: *)
(*Part 2*)


Total[Length/@(Intersection@@#&/@Characters[StringSplit[StringSplit[input,"\n\n"],"\n"]])]

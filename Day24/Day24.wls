#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

(* ::Input::Initialization:: *)
input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


(* ::Input::Initialization:: *)
d=StringCount[StringSplit[input],#]&/@{"se","sw","ne","nw",RegularExpression["(?<![n,s])e"],RegularExpression["(?<![n,s])w"]};


(* ::Input::Initialization:: *)
Count[Last/@Tally@Thread[{(#-#2+#3-#4)/2+#5-#6,(#3+#4-#-#2)}&@@d],_?OddQ]

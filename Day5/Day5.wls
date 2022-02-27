#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


keys=StringSplit[StringSplit[input,"\n"],""]/.{"F"->0,"B"->1,"L"->0,"R"->1};


seatPositions=(With[{cabinLimits=#1,key=#2},First@Fold[{First@#,Floor@Mean@#}+#2 Ceiling[(#[[2]]-#[[1]])/2]&,cabinLimits,key]]&@@@{{{0,127},#[[;;7]]},{{0,7},#[[8;;]]}})&/@keys;


seatIDs=8 #+#2&@@@seatPositions;Max@seatIDs


(* ::Subsection:: *)
(*Part 2*)


First@Complement[Range@@MinMax@#,#]&@seatIDs

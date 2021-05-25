#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*keys=StringSplit[StringSplit[input,"\n"],""]/.{"F"->0,"B"->1,"L"->0,"R"->1};*)


(* ::Input:: *)
(*seatPositions=(With[{cabinLimits=#1,key=#2},First@Fold[{First@#,Floor@Mean@#}+#2 Ceiling[(#[[2]]-#[[1]])/2]&,cabinLimits,key]]&@@@{{{0,127},#[[;;7]]},{{0,7},#[[8;;]]}})&/@keys;*)


(* ::Input:: *)
(*seatIDs=8 #+#2&@@@seatPositions;Max@seatIDs*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*First@Complement[Range@@MinMax@#,#]&@seatIDs*)

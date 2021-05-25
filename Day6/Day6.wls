#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*Total[CountDistinct/@Characters[StringJoin/@StringSplit[StringSplit[input,"\n\n"],"\n"]]]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*Total[Length/@(Intersection@@#&/@Characters[StringSplit[StringSplit[input,"\n\n"],"\n"]])]*)

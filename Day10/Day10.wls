#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


list=ToExpression@StringSplit[input,"\n"];


(* ::Subsection:: *)
(*Part 1*)


fullArray=Sort@Join[#,{0,Max@#+3}]&@list;


Times@@(Count[Differences@fullArray,#]&/@{1,3})


(* ::Subsection:: *)
(*Part 2*)


(* ::Text:: *)
(*The sublists that admit removing inner elements are:*)


sublists=SequenceCases[fullArray,{h_,m:Repeated[_,2],t_}/;t-h<=3:>{h,m,t}];


(* ::Text:: *)
(*The number of different ways, with the right ends of these sublists being always present:*)


2^(Length/@sublists-2);


(* ::Text:: *)
(*the number of different ways with the right ends of these sublists never being present are:*)


2^Count[_?(#<=3&)]/@(Part[fullArray,Flatten[Position[fullArray,#]&/@Last/@sublists]+1]-Rest/@Most/@sublists)-1(*minus 1 refers to the possibility of all inner elements being gone, which is not possible*);


(* ::Text:: *)
(*(the sublists with 2 inner elements potentially might have one, the other, or both of the inner elements removed, in total allowing at most 3 possible extra configurations of each sublist; others do not admit removing inner elements for being farther than 3 jolts from the very next element outside of the sublist). *)


Times@@(%+%%)

#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


list=StringSplit[input,"\n"];


{increments,jumps,nops}=AssociationThread[Flatten@Position[StringContainsQ[list,#],True]->ToExpression@StringCases[input,#~~" "~~i:NumberString:>i]]&/@{"acc","jmp","nop"};


i=1(*current instruction*);a=0(*current accumulator's value*);visited={}(*instructions visited so far*);
While[
ijump=First@Pick[#,Thread[#>=i]]&@Keys@jumps(*departing from instruction i, the next jump instruction you'll run into*);
visited=visited~Join~Range[i,ijump];
DuplicateFreeQ@visited,
a+=Total@Association@Pick[#,Thread[i<=Keys@#<ijump]]&@increments;
i=ijump+jumps[[Key@ijump]];
];
a


(* ::Subsection:: *)
(*Part 2*)


(* ::Text:: *)
(*Same steps as in part 1, trying each possible set of jump instructions that are candidates to lead the program to completion.*)


jumpLists=Join[KeySort@Append[jumps,#]&/@Normal@nops,Drop[jumps,{#}]&/@Range@Length@jumps];


n=Length@list;
Catch[
Do[i=1;a=0;visited={};
While[
ijump=First@Pick[#,Thread[#>=i]]&@Keys@jumps;
visited=visited~Join~Range[i,ijump];
DuplicateFreeQ@visited,
a+=Total@Association@Pick[#,Thread[i<=Keys@#<ijump]]&@increments;
If[i>=n,Throw@a];
i=ijump+jumps[[Key@ijump]];
];jumps=jumpLists[[k]];,{k,Length@jumpLists}]
]

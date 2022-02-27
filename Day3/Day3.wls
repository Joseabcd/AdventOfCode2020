#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


list=StringSplit[input,"\n"];


h=Length@list;w=StringLength@First@list;


(* ::Subsection:: *)
(*Part 1*)


dx=3;dy=1;


xn=1+(h-1)/dy dx(*horizontal position when bottom is reached*);


fullList=StringRepeat[#,Ceiling[xn/w],xn ]&/@list(*the infinite path truncated to the minimum width required to reach bottom*);


treesCoords=Flatten[MapThread[Thread/@Thread@{##}&,{#,Range@Length@#}]&@(First/@#&/@StringPosition[fullList,"#"]),1];


Count[Divide[#-1,{3,1}]&/@treesCoords,{a_,a_}](*points belonging to the path at step s satisfy: {(x-1)/dx,(y-1)/dy}={s,s}*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Text:: *)
(*Same as above, mapped for every slope provided.*)


slopes={{1,1},{3,1},{5,1},{7,1},{1,2}};


xnList=1+(h-1)/#2 #1&@@@slopes;


fullLists=With[{xn=#},StringRepeat[#,Ceiling[xn/w],xn ]&/@list]&/@xnList;


treesCoords=With[{fullList=#},Flatten[MapThread[Thread/@Thread@{##}&,{#,Range@Length@#}]&@(First/@#&/@StringPosition[fullList,"#"]),1]]&/@fullLists;


Times@@Count[{a_,a_}]/@MapIndexed[(#1-1)/slopes[[First@#2]]&,treesCoords,{2}]

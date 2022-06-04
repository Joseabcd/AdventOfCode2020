#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

(* ::Input::Initialization:: *)
input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


(* ::Input::Initialization:: *)
d=StringCount[StringSplit[input],#]&/@{"se","sw","ne","nw",RegularExpression["(?<![n,s])e"],RegularExpression["(?<![n,s])w"]};


(* ::Input::Initialization:: *)
flipped=Tally@Thread[{(#-#2+#3-#4)/2+#5-#6,(#3+#4-#-#2)}&@@d](*tile positions with number of times flipped*);
blackTiles=Pick[First/@#,OddQ[Last/@#]]&@flipped;
Length@blackTiles


(* ::Subsection:: *)
(*Part 2*)


(* ::Text:: *)
(*Get all neighbours of each black tile. Then, for every instance of a tile showing up, there is one black tile neighbouring it.*)


(* ::Input::Initialization:: *)
neighbours[{x_,y_}]:={{x-1,y},{x-1/2,y+1},{x+1/2,y+1},{x+1,y},{x+1/2,y-1},{x-1/2,y-1}}


(* ::Input::Initialization:: *)
Length@Nest[
With[{b=#},Complement[b\[Union]Cases[#,{u_,2}:>u],Cases[#,{u_,_?(#>2&)}:>u],Complement[b,#2]]&[Tally@#,#]&@Flatten[neighbours/@b,1]]&,
blackTiles,
100
]

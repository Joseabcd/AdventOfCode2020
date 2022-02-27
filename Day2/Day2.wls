#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


list=StringSplit[input,"\n"];


(* ::Subsection:: *)
(*Part 1*)


Count[Flatten@StringCases[list,l:NumberString~~"-"~~h:NumberString~~" "~~k:LetterCharacter~~":"~~" "~~p:LetterCharacter..:>Between[StringCount[p,k],ToExpression/@{l,h}]],True]


(* ::Subsection:: *)
(*Part 2*)


Count[Flatten@StringCases[list,i1:NumberString~~"-"~~i2:NumberString~~" "~~k:LetterCharacter~~":"~~" "~~p:LetterCharacter..:>Count[StringPart[p,ToExpression/@{i1,i2}],k]==1],True]

#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt","List"];


{s,messages}=SplitBy[input,StringMatchQ[("a"|"b")..]];


(* ::Subsection:: *)
(*Part 1*)


rules=Association@StringCases[s,k:DigitCharacter..~~":"~~l__..:>k->StringReplace[ l,a:Except["|"]..:>"("<>a<>")"]];


rules=StringReplace[{" "...~~p:"("|")"~~" "...:>p," "..->"~~"}]/@rules;


Count[StringMatchQ[messages,ToExpression@FixedPoint[StringReplace[d:DigitCharacter..:>rules[d]],rules["0"]]],True]


(* ::Subsection:: *)
(*Part 2*)


rules["8"]="(42)|(42~~8)";rules["11"]="(42~~31)|(42~~11~~31)";


rule0[i_]:=Nest[StringReplace[d:DigitCharacter..:>rules[d]],rules["0"],i]


i=1;n=0;
While[
n0=n;n=Count[StringMatchQ[messages,ToExpression@rule0[i]/.{_Integer->""}],True];i++;
n==0||n!=n0 
];
n

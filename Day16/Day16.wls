#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


rules=StringCases[input,f:(LetterCharacter|" ")..~~": "~~l1:DigitCharacter..~~"-"~~u1:DigitCharacter..~~" or "~~l2:DigitCharacter..~~"-"~~u2:DigitCharacter..:>f->Interval@@ToExpression@{{l1,u1},{l2,u2}}];


n=Length@rules;tickets=ToExpression@StringCases[input,t:Repeated[DigitCharacter..~~","|"\n",{n}]:>StringSplit[t,","]];


Total[Pick[#,Not/@IntervalMemberQ[IntervalUnion@@Values@rules,#]]&@Flatten@tickets]


(* ::Subsection:: *)
(*Part 2*)


validTickets=Pick[#,And@@@IntervalMemberQ[IntervalUnion@@Values@rules,#]]&@tickets;


possibilities=With[{i=#},Pick[Keys@rules,And@@@(IntervalMemberQ[#,#[[i]]&/@validTickets]&/@Values@rules)]]&/@Range@n;


fields=ConstantArray["",n];Nest[With[{p=Position[#,{Repeated[_String,{Min@DeleteCases[Length/@#,0]}]}][[1,1]]},fields[[p]]=#[[p]][[1]];DeleteCases[ReplacePart[#,p->{}],#[[p]][[1]],{2}]]&,#,n]&@possibilities;


Times@@Extract[First@tickets,Position[StringMatchQ[fields,"departure"~~___],True]]

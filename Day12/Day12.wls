#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


c=Plus@@@{StringCases[input,{"E"~~m:DigitCharacter..:>FromDigits[m],"W"~~m:DigitCharacter..:>-FromDigits[m]}],StringCases[input,{"N"~~m:DigitCharacter..:>FromDigits[m],"S"~~m:DigitCharacter..:>-FromDigits[m]}]};


directions=Thread@{Cos@#,Sin@#}&[Pi/180Accumulate[Plus@@@StringCases[StringSplit[input,"F"~~DigitCharacter..],{"L"~~m:DigitCharacter..:>FromDigits[m],"R"~~m:DigitCharacter..:>-FromDigits[m]}]]];c+=Total[StringCases[input,"F"~~m:DigitCharacter..:>FromDigits[m]]directions];


Plus@@Abs@c


(* ::Subsection:: *)
(*Part 2*)


w0={10,1};


f[{x_,y_},s_String]:=With[{a=StringPart[s,1]},{x,y+FromDigits@StringDrop[s,1]}/;a==="N"];
f[{x_,y_},s_String]:=With[{a=StringPart[s,1]},{x,y-FromDigits@StringDrop[s,1]}/;a==="S"];
f[{x_,y_},s_String]:=With[{a=StringPart[s,1]},{x+FromDigits@StringDrop[s,1],y}/;a==="E"];
f[{x_,y_},s_String]:=With[{a=StringPart[s,1]},{x-FromDigits@StringDrop[s,1],y}/;a==="W"];f[c:{x_,y_},s_String]:=With[{a=StringPart[s,1],m=FromDigits@StringDrop[s,1],t=ArcTan[x,y]},Norm@c{Cos[t+m Degree],Sin[t+m Degree]}/;a==="L"];
f[c:{x_,y_},s_String]:=With[{a=StringPart[s,1],m=FromDigits@StringDrop[s,1],t=ArcTan[x,y]},Norm@c{Cos[t-m Degree],Sin[t-m Degree]}/;a==="R"];


Plus@@Abs@Total[Rest@FoldList[Fold[f],w0,StringSplit[StringSplit[input,"F"~~DigitCharacter..],"\n"]]StringCases[input,"F"~~m:DigitCharacter..:>FromDigits[m]]]

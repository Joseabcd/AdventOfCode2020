#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt","List"];


(* ::Subsection:: *)
(*Part 1*)


operate=ToExpression@FixedPoint[StringReplace[#,{"("~~d:DigitCharacter..~~")":>d,s:(DigitCharacter..~~" + "~~DigitCharacter..):>ToString@ToExpression@s,p:(DigitCharacter..~~" * "~~DigitCharacter..):>ToString@ToExpression@p},1]&,#]&;


Fold[operate@#2+#&,operate@First@input,Rest@input]


(* ::Subsection:: *)
(*Part 2*)


p=b:((___~~" "|StartOfString|"("..));
operate=ToExpression@FixedPoint[StringReplace[#,{p~~"("~~d:DigitCharacter..~~")":>b~~d,p~~s:(DigitCharacter..~~(" + "~~DigitCharacter..)..):>b~~ToString@ToExpression@s,p~~p:("("~~DigitCharacter..~~(" * "~~DigitCharacter..)..~~")"):>b~~ToString@ToExpression@p},1]&,#]&;


Fold[operate@#2+#&,operate@First@input,Rest@input]

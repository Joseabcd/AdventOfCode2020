#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt","List"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*operate=ToExpression@FixedPoint[StringReplace[#,{"("~~d:DigitCharacter..~~")":>d,s:(DigitCharacter..~~" + "~~DigitCharacter..):>ToString@ToExpression@s,p:(DigitCharacter..~~" * "~~DigitCharacter..):>ToString@ToExpression@p},1]&,#]&;*)


(* ::Input:: *)
(*Fold[operate@#2+#&,operate@First@input,Rest@input]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*p=b:((___~~" "|StartOfString|"("..));*)
(*operate=ToExpression@FixedPoint[StringReplace[#,{p~~"("~~d:DigitCharacter..~~")":>b~~d,p~~s:(DigitCharacter..~~(" + "~~DigitCharacter..)..):>b~~ToString@ToExpression@s,p~~p:("("~~DigitCharacter..~~(" * "~~DigitCharacter..)..~~")"):>b~~ToString@ToExpression@p},1]&,#]&;*)


(* ::Input:: *)
(*Fold[operate@#2+#&,operate@First@input,Rest@input]*)

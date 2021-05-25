#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Input:: *)
(*list=StringSplit[#,{" ", "\n"}]&@@@List/@StringSplit[input,{"\n"~~"\n"}];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*patternSequence=Sequence@@(_?(StringMatchQ[#])&/@{"ecl:"~~__,"pid:"~~__, "eyr:"~~__,"hcl:"~~__,*)
(*"byr:"~~__,"iyr:"~~__,"hgt:"~~__});*)


(* ::Input:: *)
(*Count[list,{OrderlessPatternSequence[patternSequence,___]}]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*patternSequence=Sequence@@(_?(StringMatchQ[#])&/@{"ecl:"~~{"amb","blu","brn","gry","grn","hzl","oth"},"pid:"~~Repeated[DigitCharacter,{9}], "eyr:"~~eyr:Repeated[DigitCharacter,{4}]/;2020<=FromDigits[eyr]<=2030,"hcl:"~~"#"~~Repeated[DigitCharacter|LetterCharacter?(97<=First@ToCharacterCode[#]<=102&),{6}],*)
(*"byr:"~~byr:Repeated[DigitCharacter,{4}]/;1920<=FromDigits[byr]<=2002,"iyr:"~~iyr:Repeated[DigitCharacter,{4}]/;2010<=FromDigits[iyr]<=2020,"hgt:"~~(hgtCm:Repeated[DigitCharacter,{3}]~~"cm"/;150<=FromDigits@hgtCm<=193)|(hgtIn:Repeated[DigitCharacter,{2}]~~"in"/;59<=FromDigits@hgtIn<=76)});*)


(* ::Input:: *)
(*Count[list,{OrderlessPatternSequence[patternSequence,___]}]*)

#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Subsection:: *)
(*Part 1*)


list=StringSplit[StringSplit[input,"\n"],""];


finalLayout=FixedPoint[
(adjacentOccupation=Map[Count["#"]@Flatten@#&,ListConvolve[{{1,1,1},{1,0,1},{1,1,1}},#,2,None,Times,{##}&],{2}];
isSeat=Thread[#!="."]&/@#;
emptyingKey=Thread/@Thread[Thread[#>=4]&/@adjacentOccupation&&isSeat];
occupationKey=Thread/@Thread[Thread[#==0]&/@adjacentOccupation&&isSeat];ReplacePart[#,{Position[emptyingKey,True]->"L",Position[occupationKey,True]->"#"}])&,list];

Count[finalLayout,"#",{2}]


(* ::Subsection:: *)
(*Part 2*)


flatInput=""<>StringSplit[input,"\n"];


seatPositions=First/@StringPosition[flatInput,"L"|"#"];


{w,h}={StringLength@First@#,Length@#}&@StringSplit[input,"\n"];
n=w h;


hLine[p_]:=p+{Range[Ceiling[p/w]w-p],-Range[p-Floor[(p-1)/w]w-1]};
vLine[p_]:=p+w{-Range[Floor[(p-1)/w]],Range[Floor[(n-p)/w]]};
leftDiag[p_]:=p+(w+1){-Range[Min[Floor[(p-1)/w],p-Floor[(p-1)/w]w-1]],Range[Min[Floor[(n-p)/w],Ceiling[p/w]w-p]]};rightDiag[p_]:=p+(w-1){-Range[Min[Floor[(p-1)/w],Ceiling[p/w]w-p]],Range[Min[Floor[(n-p)/w],p-Floor[(p-1)/w]w-1]]};


watchedSeats=Flatten/@(With[{direction=#},Extract[direction,{{1,#1},{2,#2}}]&@@(FirstPosition[StringTake[flatInput,List/@#],"#"|"L",{}]&/@direction)]&/@Through[{hLine,vLine,leftDiag,rightDiag}[#]]&/@seatPositions);


finalLayout=FixedPoint[With[{layout=#},adjacentOccupation=Count["#"]@StringTake[layout,List/@#]&/@watchedSeats;
StringReplacePart[StringReplacePart[layout,"#",{#,#}&/@Pick[seatPositions,Thread[adjacentOccupation==0]]],"L",{#,#}&/@Pick[seatPositions,Thread[adjacentOccupation>=5]]]]&,flatInput];


StringCount[finalLayout,"#"]

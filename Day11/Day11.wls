#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(*input=Import[NotebookDirectory[]<>"input.txt"];*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input:: *)
(*list=StringSplit[StringSplit[input,"\n"],""];*)


(* ::Input:: *)
(*finalLayout=FixedPoint[*)
(*(adjacentOccupation=Map[Count["#"]@Flatten@#&,ListConvolve[{{1,1,1},{1,0,1},{1,1,1}},#,2,None,Times,{##}&],{2}];*)
(*isSeat=Thread[#!="."]&/@#;*)
(*emptyingKey=Thread/@Thread[Thread[#>=4]&/@adjacentOccupation&&isSeat];*)
(*occupationKey=Thread/@Thread[Thread[#==0]&/@adjacentOccupation&&isSeat];ReplacePart[#,{Position[emptyingKey,True]->"L",Position[occupationKey,True]->"#"}])&,list];*)
(**)
(*Count[finalLayout,"#",{2}]*)


(* ::Subsection:: *)
(*Part 2*)


(* ::Input:: *)
(*flatInput=""<>StringSplit[input,"\n"];*)


(* ::Input:: *)
(*seatPositions=First/@StringPosition[flatInput,"L"|"#"];*)


(* ::Input:: *)
(*{w,h}={StringLength@First@#,Length@#}&@StringSplit[input,"\n"];*)
(*n=w h;*)


(* ::Input:: *)
(*hLine[p_]:=p+{Range[Ceiling[p/w]w-p],-Range[p-Floor[(p-1)/w]w-1]};*)
(*vLine[p_]:=p+w{-Range[Floor[(p-1)/w]],Range[Floor[(n-p)/w]]};*)
(*leftDiag[p_]:=p+(w+1){-Range[Min[Floor[(p-1)/w],p-Floor[(p-1)/w]w-1]],Range[Min[Floor[(n-p)/w],Ceiling[p/w]w-p]]};rightDiag[p_]:=p+(w-1){-Range[Min[Floor[(p-1)/w],Ceiling[p/w]w-p]],Range[Min[Floor[(n-p)/w],p-Floor[(p-1)/w]w-1]]};*)


(* ::Input:: *)
(*watchedSeats=Flatten/@(With[{direction=#},Extract[direction,{{1,#1},{2,#2}}]&@@(FirstPosition[StringTake[flatInput,List/@#],"#"|"L",{}]&/@direction)]&/@Through[{hLine,vLine,leftDiag,rightDiag}[#]]&/@seatPositions);*)


(* ::Input:: *)
(*finalLayout=FixedPoint[With[{layout=#},adjacentOccupation=Count["#"]@StringTake[layout,List/@#]&/@watchedSeats;*)
(*StringReplacePart[StringReplacePart[layout,"#",{#,#}&/@Pick[seatPositions,Thread[adjacentOccupation==0]]],"L",{#,#}&/@Pick[seatPositions,Thread[adjacentOccupation>=5]]]]&,flatInput];*)


(* ::Input:: *)
(*StringCount[finalLayout,"#"]*)

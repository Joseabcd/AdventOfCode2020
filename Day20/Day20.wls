#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


{ids,tiles}=Thread@StringCases[input,"Tile "~~id:DigitCharacter..~~":\n"~~tile:("#"|"."|"\n")..:>{id,tile}];


(* ::Subsection:: *)
(*Part 1*)


takeBorder[img_]:={First@#,""<>StringPart[#,-1],Last@#,""<>StringPart[#,1]}&@StringSplit[img,"\n"];
f={#,StringReverse@#}&;


(* ::Text:: *)
(*Borders turn out to match either no other border (meaning they are part of the full-image boundary), or just one other border (for the borders inside the image), so no need to assemble the image here.*)


borders=takeBorder/@tiles;b=StringRiffle/@borders;
c=Flatten/@(Position[StringContainsQ[b,f@#],True]&/@borders);
c=MapThread[Complement,{c,List/@Range@Length@c}](*connectivity of each tile*);


{corners,edges}=Flatten@Position[c,{Repeated[_,#]}]&/@{2,3};


Times@@ToExpression@ids[[corners]]


(* ::Subsection:: *)
(*Part 2*)


n=Sqrt@Length@tiles;


rotate[img_,n_]/;n==0:=img;
rotate[img_,n_]/;n<0:=Nest[StringRiffle[Reverse/@Transpose@Characters@StringSplit@#,"\n",""]&,img,-n];
rotate[img_,n_]/;n>0:=Nest[StringRiffle[Transpose[Reverse/@Characters@StringSplit@#],"\n",""]&,img,n];

flip[img_,0]:=img;
flip[img_,(1|3)]:=StringRiffle[StringReverse@StringSplit@img,"\n"](*flip over vertical axis*);
flip[img_,(2|4)]:=flip[StringReverse@img,1](*flip over horizontal axis*);

align[imgs_,i1_,i2_]:=Module[{b1,b2,p1,p2,img,img1,img2},
{img1,img2}=imgs[[{i1,i2}]];{b1,b2}=takeBorder/@{img1,img2};
{{{p1}},{{p2}}}=Position[#,Alternatives@@Flatten@f@#2]&@@@{{##},{#2,#}}&[b1,b2];
img=rotate[img2,Mod[2+p2-p1,4]];imgs[[i2]]=If[b1[[p1]]==takeBorder[img][[Mod[p1+2,4,1]]],img,flip[img,p1]]];
SetAttributes[align,HoldFirst]


t0=corners[[1]](*can choose corner to start*);
tiles[[t0]]=NestWhile[rotate[#,1]&,tiles[[t0]],Position[takeBorder[#],b_String/;Count[borders,Alternatives@@f@b,{2}]==2]!={{2},{3}}&];


z0=Flatten@Last@Reap[
t=Sow@First@Select[c[[Sow@t0]],MemberQ[Flatten@f@borders[[#]],takeBorder[tiles[[t0]]][[2]]]&];
e=DeleteCases[edges,t0|t];align[tiles,t0,t];
Nest[(t0=t;{t}=Sow@Intersection[c[[t0]],#];align[tiles,t0,t];DeleteCases[#,t])&,e,n-2]
];


z={};a=NestList[(z=Flatten@{z,#};Flatten[Complement[#,z]&/@Table[c[[t]],{t,z}]])&,z0,n-1];


BlockMap[MapThread[align[tiles,##]&],a,2,1];


img=StringRiffle[Transpose[StringTrim[Take[StringSplit[#,"\n"],{2,-2}],_]&/@#&/@(tiles[[#]]&/@a),{1,3,2}],"\n","\n",""];


monster="                  # 
#    ##    ##    ###
 #  #  #  #  #  #   ";


countMonsters[img_,monster_]:=Block[{h,w,hh,mm,tt,heads,monsterLines,tails,monsterPattern,r=0},

h=StringCount[monster,"\n"]+1(*height of the monster*);
w=(StringLength@monster-h+1)/h (*width of the monster*);
{heads,monsterLines,tails}=Unique[ConstantArray[#,h]]&/@{hh,mm,tt}(*names to construct the pattern*);

monsterPattern=StringExpression@@Riffle[Riffle[Riffle@@(Pattern[#,("#"|"."|"m")...]&/@#&/@{heads,tails}),"\n",{3,-3,3}],
MapThread[Pattern,{monsterLines,StringReplace[StringSplit[monster,"\n"],{" "->_}]}],{2,-2,4}];

FixedPoint[StringReplace[#,With[{hTmp=heads,tTmp=tails},monsterPattern/;And@@Equal@@@StringLength/@{hTmp,tTmp}:>(r+=1;
StringRiffle[Thread@{hTmp,tTmp},"\n",StringRepeat["m",w]])]]&,img];r
]


Min[StringCount[img,"#"]-countMonsters[rotate[flip[img,#],#2],monster]*StringCount[monster,"#"]&@@@{{0,0},{0,1},{0,2},{0,3},{1,0},{1,1},{1,2},{1,3}}]

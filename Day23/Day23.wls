#!/usr/bin/env wolframscript -print all
(* ::Package:: *)

(* ::Input::Initialization:: *)
input=Import[If[$Notebooks,NotebookDirectory[],DirectoryName[$ScriptCommandLine[[1]]]]<>"input.txt"];


(* ::Input::Initialization:: *)
circle= ToExpression@StringSplit[input,""];


(* ::Input:: *)
(*circle*)


(* ::Subsection:: *)
(*Part 1*)


(* ::Input::Initialization:: *)
""<>ToString/@(Nest[RotateLeft[Insert[#2,Splice@#,1+Position[#2,Max[Cases[#2,n_/;n<First@#2]/.{{}->#2}]]]&@@TakeDrop[#,{2,4}]]&,circle,100]/.{{h___,1,t___}:>{t,h}})


(* ::Subsection:: *)
(*Part 2*)


(* ::Text:: *)
(*This solution needs rethinking: it takes almost 7 hours run on an M4 machine.*)


plusDecl1=
	FunctionDeclaration[
		plus,
		Typed[{"MachineInteger","MachineInteger","MachineInteger"}->"MachineInteger"]@
		Function[
			{a,b,n},
			Mod[a+b,n,1]
		]
	];


plusDecl2=
	FunctionDeclaration[
		plus,
		Typed[{"MachineInteger","PackedArray"::["MachineInteger",1],"MachineInteger"}->"PackedArray"::["MachineInteger",1]]@
		Function[
			{a,b,n},
			Mod[a+#,n,1]&/@b
		]
	];


makeMoveDecl=
	FunctionDeclaration[
		makeMove,
		Typed[{"ListVector"::["PackedArray"::["MachineInteger",1]]}->"ListVector"::["PackedArray"::["MachineInteger",1]]]@
		Function[
			initialState,
			Module[
				{circle,currentPosition,destinationCup,pickUp,currentCup,n,pickUpPosition,destinationPosition,nextCircle,
				nextCurrentPosition,nextState},
				
				circle=initialState[[1]];
				currentPosition=initialState[[2]][[1]];
				
				n=Length[circle];
				
				pickUp=circle[[plus[currentPosition,{1,2,3},n]]];
				currentCup=circle[[currentPosition]];
				
				If[
					MemberQ[pickUp,plus[currentCup,-1,n]],
					If[
						MemberQ[pickUp,plus[currentCup,-2,n]],
						If[
							MemberQ[pickUp,plus[currentCup,-3,n]],
							destinationCup=plus[currentCup,-4,n],
							destinationCup=plus[currentCup,-3,n]
						],
						destinationCup=plus[currentCup,-2,n]
					],
					destinationCup=plus[currentCup,-1,n]
				];
				
				nextCircle=Array`NewPackedArray[TypeSpecifier["MachineInteger"],n];
				destinationPosition=0;
				Module[
					{i=1,i0=1},
					While[
						i<=n,
						Which[
							circle[[i]]===destinationCup,
							(
								destinationPosition=i;
								nextCircle[[Mod[i0,n,1]]]=circle[[i]];
								i++;i0++;
								nextCircle[[Mod[i0,n,1]]]=pickUp[[1]];
								nextCircle[[plus[i0,1,n]]]=pickUp[[2]];
								nextCircle[[plus[i0,2,n]]]=pickUp[[3]];
								i0+=3;
							),
							
							i===currentPosition,
							(
								nextCircle[[Mod[i0,n,1]]]=circle[[i]];
								i+=4;i0++;
							),
							
							True,
							nextCircle[[Mod[i0,n,1]]]=circle[[i]];
							i++;i0++;
						];			
					]
				];
				
				nextCurrentPosition=
					If[
						destinationPosition>currentPosition,
						plus[currentPosition,1,n],
						plus[currentPosition,4,n]
					];
					
				nextState={nextCircle,{nextCurrentPosition}}
			]
		]
	];


playCompiled=
	FunctionCompile[
		{makeMoveDecl,plusDecl1,plusDecl2},
		Function[
			{Typed[circle,"PackedArray"::["MachineInteger",1]],Typed[currentPosition,"MachineInteger"],Typed[numberOfMoves,"MachineInteger"]},
			Nest[makeMove,{circle,{currentPosition}},numberOfMoves]
		]
	];


playCompiled[Join[circle,Range[Max[circle]+1,1000000]],1,10000000]/.{{h___,1,t___},_}:>Times@@Take[{t,h},2]

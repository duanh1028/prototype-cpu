	[00000000] <-- 341D3FFC
	[00000004] <-- 0C00000B
	[00000008] <-- FFFFFFFF
	[0000000C] <-- C0880000
	[00000010] <-- 1500FFFE
	[00000014] <-- 25080001
	[00000018] <-- E0880000
	[0000001C] <-- 1100FFFB
	[00000020] <-- 03E00008
	[00000024] <-- AC800000
	[00000028] <-- 03E00008
	[0000002C] <-- 27BDFFFC
	[00000030] <-- AFBF0000
	[00000034] <-- 34040060
	[00000038] <-- 0C000003
	[0000003C] <-- 340A0240
	[00000040] <-- 8D480000
	[00000044] <-- 25090002
	[00000048] <-- AD490000
	[0000004C] <-- 34040060
	[00000050] <-- 0C000009
	[00000054] <-- 8FBF0000
	[00000058] <-- 27BD0004
	[0000005C] <-- 03E00008
	[00000060] <-- 00000000
	[00000200] <-- 341D7FFC
	[00000204] <-- 0C000083
	[00000208] <-- FFFFFFFF
	[0000020C] <-- 27BDFFFC
	[00000210] <-- AFBF0000
	[00000214] <-- 34040060
	[00000218] <-- 0C000003
	[0000021C] <-- 340A0240
	[00000220] <-- 8D480000
	[00000224] <-- 25090001
	[00000228] <-- AD490000
	[0000022C] <-- 34040060
	[00000230] <-- 0C000009
	[00000234] <-- 8FBF0000
	[00000238] <-- 27BD0004
	[0000023C] <-- 03E00008
	[00000240] <-- 00000000
42 words loaded from meminit.hex
Starting simulation...

	Core 1
	PC <-- 00000000
	Core 2
	PC <-- 00000200

00000000(Core 1): 341D3FFC ORI R29, R0, 16380
	PC <-- 00000004
	R29 <-- 00003FFC

00000004(Core 1): 0C00000B JAL 0000002C
	PC <-- 0000002C
	R31 <-- 00000008

0000002C(Core 1): 27BDFFFC ADDIU R29, R29, -4
	PC <-- 00000030
	R29 <-- 00003FF8

00000200(Core 2): 341D7FFC ORI R29, R0, 32764
	PC <-- 00000204
	R29 <-- 00007FFC

00000204(Core 2): 0C000083 JAL 0000020C
	PC <-- 0000020C
	R31 <-- 00000208

00000030(Core 1): AFBF0000 SW R31, 0(R29)
	PC <-- 00000034
	[00003FF8] <-- 00000008

0000020C(Core 2): 27BDFFFC ADDIU R29, R29, -4
	PC <-- 00000210
	R29 <-- 00007FF8

00000210(Core 2): AFBF0000 SW R31, 0(R29)
	PC <-- 00000214
	[00007FF8] <-- 00000208

00000214(Core 2): 34040060 ORI R4, R0, 96
	PC <-- 00000218
	R4 <-- 00000060

00000034(Core 1): 34040060 ORI R4, R0, 96
	PC <-- 00000038
	R4 <-- 00000060

00000218(Core 2): 0C000003 JAL 0000000C
	PC <-- 0000000C
	R31 <-- 0000021C

0000000C(Core 2): C0880000 LL R8, 0(R4)
	PC <-- 00000010
	[word read from 00000060]
	R8 <-- 00000000
	RMW <-- 00000060

00000010(Core 2): 1500FFFE BNE R8, R0, 12
	PC <-- 00000014

00000038(Core 1): 0C000003 JAL 0000000C
	PC <-- 0000000C
	R31 <-- 0000003C

0000000C(Core 1): C0880000 LL R8, 0(R4)
	PC <-- 00000010
	[word read from 00000060]
	R8 <-- 00000000
	RMW <-- 00000060

00000014(Core 2): 25080001 ADDIU R8, R8, 1
	PC <-- 00000018
	R8 <-- 00000001

00000010(Core 1): 1500FFFE BNE R8, R0, 12
	PC <-- 00000014

00000018(Core 2): E0880000 SC R8, 0(R4)
	PC <-- 0000001C
	**Coherence Invalidation
	[00000060] <-- 00000001
	R8 <-- 00000001
	RMW <-- 00000061

00000014(Core 1): 25080001 ADDIU R8, R8, 1
	PC <-- 00000018
	R8 <-- 00000001

00000018(Core 1): E0880000 SC R8, 0(R4)
	PC <-- 0000001C
	**Coherence Invalidation
	R8 <-- 00000000

0000001C(Core 2): 1100FFFB BEQ R8, R0, 12
	PC <-- 00000020

00000020(Core 2): 03E00008 JR R31
	PC <-- 0000021C

0000021C(Core 2): 340A0240 ORI R10, R0, 576
	PC <-- 00000220
	R10 <-- 00000240

0000001C(Core 1): 1100FFFB BEQ R8, R0, 12
	PC <-- 0000000C

0000000C(Core 1): C0880000 LL R8, 0(R4)
	PC <-- 00000010
	[word read from 00000060]
	R8 <-- 00000001
	RMW <-- 00000060

00000220(Core 2): 8D480000 LW R8, 0(R10)
	PC <-- 00000224
	[word read from 00000240]
	R8 <-- 00000000

00000224(Core 2): 25090001 ADDIU R9, R8, 1
	PC <-- 00000228
	R9 <-- 00000001

00000228(Core 2): AD490000 SW R9, 0(R10)
	PC <-- 0000022C
	[00000240] <-- 00000001

00000010(Core 1): 1500FFFE BNE R8, R0, 12
	PC <-- 0000000C

0000000C(Core 1): C0880000 LL R8, 0(R4)
	PC <-- 00000010
	[word read from 00000060]
	R8 <-- 00000001
	RMW <-- 00000060

00000010(Core 1): 1500FFFE BNE R8, R0, 12
	PC <-- 0000000C

0000022C(Core 2): 34040060 ORI R4, R0, 96
	PC <-- 00000230
	R4 <-- 00000060

00000230(Core 2): 0C000009 JAL 00000024
	PC <-- 00000024
	R31 <-- 00000234

0000000C(Core 1): C0880000 LL R8, 0(R4)
	PC <-- 00000010
	[word read from 00000060]
	R8 <-- 00000001
	RMW <-- 00000060

00000024(Core 2): AC800000 SW R0, 0(R4)
	PC <-- 00000028
	**Coherence Invalidation
	[00000060] <-- 00000000

00000028(Core 2): 03E00008 JR R31
	PC <-- 00000234

00000010(Core 1): 1500FFFE BNE R8, R0, 12
	PC <-- 0000000C

00000234(Core 2): 8FBF0000 LW R31, 0(R29)
	PC <-- 00000238
	[word read from 00007FF8]
	R31 <-- 00000208

0000000C(Core 1): C0880000 LL R8, 0(R4)
	PC <-- 00000010
	[word read from 00000060]
	R8 <-- 00000000
	RMW <-- 00000060

00000010(Core 1): 1500FFFE BNE R8, R0, 12
	PC <-- 00000014

00000014(Core 1): 25080001 ADDIU R8, R8, 1
	PC <-- 00000018
	R8 <-- 00000001

00000238(Core 2): 27BD0004 ADDIU R29, R29, 4
	PC <-- 0000023C
	R29 <-- 00007FFC

00000018(Core 1): E0880000 SC R8, 0(R4)
	PC <-- 0000001C
	[00000060] <-- 00000001
	R8 <-- 00000001
	RMW <-- 00000061

0000001C(Core 1): 1100FFFB BEQ R8, R0, 12
	PC <-- 00000020

00000020(Core 1): 03E00008 JR R31
	PC <-- 0000003C

0000023C(Core 2): 03E00008 JR R31
	PC <-- 00000208

0000003C(Core 1): 340A0240 ORI R10, R0, 576
	PC <-- 00000040
	R10 <-- 00000240

00000040(Core 1): 8D480000 LW R8, 0(R10)
	PC <-- 00000044
	[word read from 00000240]
	R8 <-- 00000001

00000208(Core 2): FFFFFFFF HALT
	PC <-- 0000020C
HALT executed(Core 2).

00000044(Core 1): 25090002 ADDIU R9, R8, 2
	PC <-- 00000048
	R9 <-- 00000003

00000048(Core 1): AD490000 SW R9, 0(R10)
	PC <-- 0000004C
	[00000240] <-- 00000003

0000004C(Core 1): 34040060 ORI R4, R0, 96
	PC <-- 00000050
	R4 <-- 00000060

00000050(Core 1): 0C000009 JAL 00000024
	PC <-- 00000024
	R31 <-- 00000054

00000024(Core 1): AC800000 SW R0, 0(R4)
	PC <-- 00000028
	[00000060] <-- 00000000

00000028(Core 1): 03E00008 JR R31
	PC <-- 00000054

00000054(Core 1): 8FBF0000 LW R31, 0(R29)
	PC <-- 00000058
	[word read from 00003FF8]
	R31 <-- 00000008

00000058(Core 1): 27BD0004 ADDIU R29, R29, 4
	PC <-- 0000005C
	R29 <-- 00003FFC

0000005C(Core 1): 03E00008 JR R31
	PC <-- 00000008

00000008(Core 1): FFFFFFFF HALT
	PC <-- 0000000C
HALT executed(Core 1).
Done simulating...

Instruction Breakdown:

		Core 1
	  JAL:    3 (8.57%)
	  BEQ:    2 (5.71%)
	  BNE:    5 (14.29%)
	 ADDIU:    5 (14.29%)
	  ORI:    4 (11.43%)
	   LW:    2 (5.71%)
	   SW:    3 (8.57%)
	   LL:    5 (14.29%)
	   SC:    2 (5.71%)
	 HALT:    1 (2.86%)
	   JR:    3 (8.57%)
	 TOTAL:   35

	PC: 0000000C

General Purpose Registers:
	R 0: 00000000	R 1: 00000000	R 2: 00000000	R 3: 00000000
	R 4: 00000060	R 5: 00000000	R 6: 00000000	R 7: 00000000
	R 8: 00000001	R 9: 00000003	R10: 00000240	R11: 00000000
	R12: 00000000	R13: 00000000	R14: 00000000	R15: 00000000
	R16: 00000000	R17: 00000000	R18: 00000000	R19: 00000000
	R20: 00000000	R21: 00000000	R22: 00000000	R23: 00000000
	R24: 00000000	R25: 00000000	R26: 00000000	R27: 00000000
	R28: 00000000	R29: 00003FFC	R30: 00000000	R31: 00000008


		Core 2
	  JAL:    3 (12.50%)
	  BEQ:    1 (4.17%)
	  BNE:    1 (4.17%)
	 ADDIU:    4 (16.67%)
	  ORI:    4 (16.67%)
	   LW:    2 (8.33%)
	   SW:    3 (12.50%)
	   LL:    1 (4.17%)
	   SC:    1 (4.17%)
	 HALT:    1 (4.17%)
	   JR:    3 (12.50%)
	 TOTAL:   24

	PC: 0000020C

General Purpose Registers:
	R 0: 00000000	R 1: 00000000	R 2: 00000000	R 3: 00000000
	R 4: 00000060	R 5: 00000000	R 6: 00000000	R 7: 00000000
	R 8: 00000000	R 9: 00000001	R10: 00000240	R11: 00000000
	R12: 00000000	R13: 00000000	R14: 00000000	R15: 00000000
	R16: 00000000	R17: 00000000	R18: 00000000	R19: 00000000
	R20: 00000000	R21: 00000000	R22: 00000000	R23: 00000000
	R24: 00000000	R25: 00000000	R26: 00000000	R27: 00000000
	R28: 00000000	R29: 00007FFC	R30: 00000000	R31: 00000208

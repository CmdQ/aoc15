"
I represent day 8 of the Advent of Code 2015 puzzles.

I solve the 'Matchsticks' problem.
"
Class {
	#name : #Day08,
	#superclass : #Day,
	#category : #AoC2015
}

{ #category : #solution }
Day08 class >> encode1: aString [
	| dict |
	dict := Dictionary new
			at: $\ put: 2;
			at: $" put: 2;
			yourself.
	^ (aString inject: 2 into: [ :acc :elm | acc + (dict at: elm ifAbsent: 1) ])
		- aString size
]

{ #category : #expecting }
Day08 >> answer1 [
	^ 1333
]

{ #category : #'expecting\t' }
Day08 >> answer2 [
	^ 2046
]

{ #category : #solution }
Day08 >> decode1: aString [
	"We need the length of the string minus the number of actual characters."

	| len chars i last ws opened |
	chars := ws := opened := 0.
	last := nil.
	len := aString size.
	i := 1.
	[ i <= len ]
		whileTrue: [ | c |
			c := aString at: i.
			Transcript show: c.
			last = $\
				ifTrue: [ ('"\' includes: c)
						ifTrue: [ chars := chars + 1 ]
						ifFalse: [ c = $x
								ifTrue: [ chars := chars + 1.
									i := i + 2 ] ].
					last := nil ]
				ifFalse: [ c = $\
						ifTrue: [ last := c ]
						ifFalse: [ c = $"
								ifTrue: [ opened := opened + 1 ]
								ifFalse: [ c isSeparator ifTrue: [ ws := ws + 1 ] ifFalse: [ chars := chars + 1 ] ] ] ].
			i := i + 1 ].
	self assert: opened = 2 description: 'more than 2 quotes'.
	^ len - chars - ws
]

{ #category : #'input\t' }
Day08 >> input [
	^ '"sjdivfriyaaqa\xd2v\"k\"mpcu\"yyu\"en"
"vcqc"
"zbcwgmbpijcxu\"yins\"sfxn"
"yumngprx"
"bbdj"
"czbggabkzo\"wsnw\"voklp\"s"
"acwt"
"aqttwnsohbzian\"evtllfxwkog\"cunzw"
"ugvsgfv"
"xlnillibxg"
"kexh\"pmi"
"syvugow"
"m\"ktqnw"
"yrbajyndte\\rm"
"f\"kak\x70sn\xc4kjri"
"yxthr"
"alvumfsjni\"kohg"
"trajs\x5brom\xf1yoijaumkem\"\"tahlzs"
"\"oedr\"pwdbnnrc"
"qsmzhnx\""
"\"msoytqimx\\tbklqz"
"mjdfcgwdshrehgs"
"\"rivyxahf\""
"ciagc\x04bp"
"xkfc"
"xrgcripdu\x4c\xc4gszjhrvumvz\"mngbirb"
"gvmae\"yiiujoqvr\"mkxmgbbut\"u"
"ih"
"ncrqlejehs"
"mkno\x43pcfdukmemycp"
"uanzoqxkpsksbvdnkji\"feamp"
"axoufpnbx\\ao\x61pfj\"b"
"dz\\ztawzdjy"
"ihne\"enumvswypgf"
"\"dgazthrphbshdo\\vuqoiy\""
"dlnmptzt\\zahwpylc\\b\"gmslrqysk"
"mhxznyzcp"
"rebr\"amvxw\x5fmbnfpkkeghlntavj"
"lades\x47ncgdof\"\"jmbbk"
"dwxuis\xa5wdkx\\z\"admgnoddpgkt\\zs"
"g\\k\x27qsl\x34hwfglcdxqbeclt\xca\\"
"lhyjky\\m\"pvnm\\xmynpxnlhndmahjl"
"c\"uxabbgorrpprw\"xas\\vefkxioqpt"
"rfrvjxpevcmma\x71gtfipo"
"fgh\"kcwoqwfnjgdlzfclprg\"q"
"onxnwykrba"
"hkkg\x60f\"tjzsanpvarzgkfipl"
"\"aintes\"ofq\"juiaqlqxmvpe\\a"
"wiyczzs\"ciwk"
"mfqeu"
"v\xe1z\x7ftzalmvdmncfivrax\\rjwq"
"k\"vtg"
"exhrtdugeml\xf0"
"behnchkpld"
"mhgxy\"mfcrg\xc5gnp\"\"osqhj"
"rlvjy"
"awe"
"ctwy"
"vt"
"\x54t"
"zugfmmfomz"
"cv\"cvcvfaada\x04fsuqjinbfh\xa9cq\xd2c\"d"
"oj"
"xazanf\"wbmcrn"
"\\\\zkisyjpbzandqikqjqvee"
"dpsnbzdwnxk\\v"
"sj\"tuupr\\oyoh"
"myvkgnw\x81q\xaaokt\\emgejbsyvxcl\\\xee"
"ejeuqvunjcirdkkpt\"nlns"
"twmlvwxyvfyqqzu"
"\"xwtzdp\x98qkcis\"dm\\\"ep\"xyykq"
"vvcq\\expok"
"wgukjfanjgpdjb"
"\"mjcjajnxy\\dcpc"
"wdvgnecw\\ab\x44klceduzgsvu"
"dqtqkukr\"iacngufbqkdpxlwjjt"
"\"xj\"\x66qofsqzkoah"
"nptiwwsqdep"
"gsnlxql\x30mjl"
"yeezwokjwrhelny\""
"bjauamn\\izpmzqqasid"
"tvjdbkn\"tiziw\x82r"
"w"
"xwoakbbnjnypnaa\xa9wft\"slrmoqkl"
"vwxtnlvaaasyruykgygrvpiopzygf\"vq"
"qdancvnvmhlmpj\\isdxs"
"xzc\\elw"
"b\"wxeqvy\"qf\"g\xcaoklsucwicyw\"dovr"
"yomlvvjdbngz\"rly\"afr"
"bfb\"x\"aweuwbwmoa\x13\"t\"zhr"
"\"dmfoxb\"qvpjzzhykt\xd2\"\"ryhxi"
"psqef\"yu\\qiflie\"\x79w"
"arzewkej\"lqmh\\sayyusxxo\\"
"vuvvp"
"hc\"lg\x6bcpupsewzklai\"l"
"cjdfygc\"auorqybnuqghsh\x10"
"j"
"wqjexk\"eyq\\lbroqhk\\dqzsqk"
"dws\"ru\"dvxfiwapif\"oqwzmle"
"agcykg\\jt\\vzklqjvknoe"
"kksd\"jmslja\\z\"y\\b\xaagpyojct"
"nnpipxufvbfpoz\"jno"
"dtw"
"xlolvtahvgqkx\\dgnhj\\spsclpcxv\\"
"mxea\\mbjpi"
"lgbotkk\"zmxh\\\\qji\"jszulnjsxkqf"
"lwckmhwhx\"gmftlb\x91am"
"xxdxqyxth"
"\"lmqhwkjxmvayxy"
"tf"
"qy"
"wdqmwxdztax\"m\"\x09\x11xdxmfwxmtqgwvf"
"\xcbnazlf\"ghziknszmsrahaf"
"e\x6aupmzhxlvwympgjjpdvo\"kylfa"
"\x81vhtlillb\xactgoatva"
"dvnlgr"
"f"
"xg\xfacwizsadgeclm"
"vnnrzbtw\"\\prod\\djbyppngwayy\""
"lrt\xf4jahwvfz"
"aqpnjtom\"ymkak\\dadfybqrso\\fwv"
"gz\"aac\"mrbk\"ktommrojraqh"
"wycamwoecsftepfnlcdkm"
"nrhddblbuzlqsl\x9cben"
"vckxhyqkmqmdseazcykrbysm"
"sil\xbbtevmt\"gvrvybui\"faw\"j"
"cjex\\tp\x45pzf"
"asjobvtxszfodgf\"ibftg"
"gkyjyjdrxdcllnh\"sjcibenrdnxv"
"oswsdpjyxpbwnqbcpl\"yrdvs\\zq"
"\"\"tyowzc\\fycbp\"jbwrbvgui"
"cbpcabqkdgzmpgcwjtrchxp"
"iyrzfh\x45gw\"fdlfpiaap\x31xqq"
"evgksznidz"
"b\\w\\"
"loufizbiy\x57aim\"bgk"
"qjfyk"
"g\"anmloghvgr\x07zwqougqhdz"
"usbbmwcxd\\bdgg"
"htitqcpczml"
"eke\\cqvpexqqk\"to\"tqmljrpn\xe6lji\""
"g\xd2ifdsej"
"h\"sk\"haajajpagtcqnzrfqn\xe6btzo"
"wfkuffdxlvm\\cvlyzlbyunclhmpp"
"myaavh\"spue"
"hqvez\x68d\"eo\"eaioh"
"s\"qd\"oyxxcglcdnuhk"
"ilqvar"
"srh"
"puuifxrfmpc\"bvalwi\x2blu\\"
"yywlbutufzysbncw\\nqsfbhpz\"mngjq"
"zbl\\jfcuop"
"hjdouiragzvxsqkreup\\"
"qi"
"ckx\\funlj\xa7ahi"
"k"
"ufrcnh\"ajteit"
"cqv\"bgjozjj\x60x\xa8yhvmdvutchjotyuz"
"hkuiet\"oku\x8cfhumfpasl"
"\"\\sbe\x4d"
"vhknazqt"
"eyyizvzcahgflvmoowvs\\jhvygci"
"kki\x3ewcefkgtjap\"xtpxh\"lzepoqj"
"wvtk"
"\"ynet"
"zh\\obk\"otagx\x59txfzf"
"ocowhxlx\xe6zqg\x63wx\\tclkhq\\vmaze"
"w\"cf"
"qpniprnrzrnvykghqnalr"
"jctcqra\"\x05dhlydpqamorqjsijt\\xjdgt"
"sig"
"qhlbidbflwxe\"xljbwls\x20vht"
"irmrebfla\xefsg\"j"
"nep"
"hjuvsqlizeqobepf"
"guzbcdp\"obyh"
"\"mjagins\xf9tqykaxy\""
"knvsdnmtr\"zervsb"
"hzuy"
"zza\"k\"buapb\\elm\xfeya"
"lrqar\"dfqwkaaqifig\"uixjsz"
"\"azuo\x40rmnlhhluwsbbdb\x32pk\\yu\"pbcf"
"dplkdyty"
"rfoyciebwlwphcycmguc"
"ivnmmiemhgytmlprq\\eh"
"lhkyzaaothfdhmbpsqd\\yyw"
"tnlzifupcjcaj"
"\\qiyirsdrfpmu\\\x15xusifaag"
"\\lcomf\\s"
"uramjivcirjhqcqcg"
"kkbaklbxfxikffnuhtu\xc6t\"d"
"n\xefai"
"\"toy\"bnbpevuzoc\"muywq\"gz\"grbm"
"\"muu\\wt"
"\\srby\"ee"
"erf\"gvw\"swfppf"
"pbqcgtn\"iuianhcdazfvmidn\\nslhxdf"
"uxbp"
"up\\mgrcyaegiwmjufn"
"nulscgcewj\\dvoyvhetdegzhs\""
"masv\"k\\rzrb"
"qtx\x79d\"xdxmbxrvhj"
"fid\\otpkgjlh\"qgsvexrckqtn\xf4"
"tagzu"
"bvl\\\"noseec"
"\\xgicuuh"
"w\"a\"npemf"
"sxp"
"nsmpktic\x8awxftscdcvijjobnq\"gjd"
"uks\"\"jxvyvfezz\"aynxoev\"cuoav"
"m"
"lkvokj"
"vkfam\"yllr\"q\x92o\x4ebecnvhshhqe\\"
"efdxcjkjverw"
"lmqzadwhfdgmep\x02tzfcbgrbfekhat"
"cpbk\x9azqegbpluczssouop\x36ztpuoxsw"
"cqwoczxdd\"erdjka"
"cwvqnjgbw\\fxdlby"
"mvtm"
"lt\"bbqzpumplkg"
"ntd\xeeuwweucnuuslqfzfq"
"y\xabl\"dbebxjrlbmuoo\\\x1au"
"qjoqx\\a"
"pu\"ekdnfpmly\xbago\""
"fjhhdy"
"arl"
"xcywisim\"bwuwf\"\"raepeawwjub"
"pbe"
"dbnqfpzyaumxtqnd\xc5dcqrkwyop"
"ojv\x40vtkwgkqepm\x8bzft\\vedrry"
"wggqkfbwqumsgajqwphjec\"mstxpwz"
"zjkbem"
"icpfqxbelxazlls"
"pvpqs\\abcmtyielugfgcv\"tjxapxqxnx"
"oqddwlvmtv\"\x39lyybylfb\"jmngnpjrdw"
"gisgbve"
"\"aglg"
"y\"\"ss\xafvhxlrjv"
"qbgqjsra"
"ihshbjgqpdcljpmdwdprwloy"
"djja\\wcdn\"svkrgpqn\"uz\"hc\x43hj"
"cbjm"
"pnn"
"pqvh\"noh"
"\"\\fdktlp"
"ncea"
"pqgzphiyy"
"\xbedovhxuipaohlcvkwtxwmpz\"ckaif\"r"
"arjuzbjowqciunfwgxtph\"vlhy\"n"
"c"
"nrpdxunulgudqzlhtae"
"iefheu\"uru\""
"aqijysxuijud\"np\\opbichhudil\xbesum"
"pfpevmtstl\"lde\"bzr\"vspdxs"
"vparfbdjwvzsocpnzhp"
"g\x4ffxaarafrsjthq\\\xc1rw"
"ng\\rqx\\gwpzucbh\xafl"
"rw\"nf\\dna"
"jkkeahxurxla\\g\xb3czrlsyimmwcwthr"
"twaailoypu\"oas\"kpuuyedlaw\\\xb0vzt"
"hznex\\gdiqvtugi"
"imdibsunjeswhk"
"ta\\icileuzpxro\"cfmv\"mzp"
"coykr\x57luiysucfaflmilhlehmvzeiepo"
"u\x3dfh\xd4yt"
"piw\x1bz\"eowy\"vfk\"wqiekw"
"gan\"y"
"p\"bevidoazcznr\"hddxuuq\""
"bwzucczznutbxe"
"z\"viqgyqjisior\\iecosmjbknol"
"dmlpcglcfkfsctxydjvayhymv\x3c\\gp"
"bfvkqrintbbvgfv"
"xlzntrgdck\"cprc\xadczyarbznqmuhxyuh"
"uqdxnuwioc\"kdytxq\\ig"
"xrafmucpmfi"
"vr\"hltmfrge"
"eonf\"nt\\wtcnsocs"
"j\xb7xoslyjeyjksplkqixncgkylkw"
"njw\"pefgfbez\x9axshdmplxzquqe"
"di\x58bvptfsafirpc"
"l\x1fkco"
"x"
"mprndo\"n"
"psegit"
"svbdnkkuuqs\"sqxu\"oqcyz\"aizashk"
"cwkljukxer\\\"\\nff\"esjwiyaoy"
"ilxrkgbjjxpvhdtq\"cpiuoofdnkpp"
"hlngi\"ulxep\\qohtmqnqjb\"rkgerho"
"gxws\"bcgm\"p"
"bv\"mds\\zhfusiepgrz\\b\x32fscdzz"
"l\xfampwtme\x69qvxnx\"\"\xc4jruuymjxrpsv"
"qqmxhrn"
"xziq\\\x18ybyv\x9am\"neacoqjzytertisysza"
"aqcbvlvcrzceeyx\\j\"\"x"
"yjuhhb"
"\x5em\"squulpy"
"dpbntplgmwb"
"utsgfkm\\vbftjknlktpthoeo"
"ccxjgiocmuhf\"ycnh"
"lltj\"kbbxi"
'
]

{ #category : #'examples - input' }
Day08 >> inputAbc [
	<gtExample>
	| res |
	res := self solvePart1: ' "abc" '.
	self assert: res equals: 2.
	^ res
]

{ #category : #'examples - input' }
Day08 >> inputEmpty [
	<gtExample>
	| res |
	res := self solvePart1: '""'.
	self assert: res equals: 2.
	^ res
]

{ #category : #'examples - input' }
Day08 >> inputEscapedQuote [
	<gtExample>
	| res |
	res := self solvePart1: '"aaa\"aaa"'.
	self assert: res equals: 3.
	^ res
]

{ #category : #'examples - input' }
Day08 >> inputNumeric [
	<gtExample>
	| res |
	res := self solvePart1: '"\x27"'.
	self assert: res equals: 5.
	^ res
]

{ #category : #solution }
Day08 >> solvePart1: aString [
	^ (aString lines collect: [ :l | self decode1: l ])
		inject: 0
		into: [ :acc :each | acc + each ]
]

{ #category : #solution }
Day08 >> solvePart2: aString [
	^ (aString lines collect: [ :l | Day08 encode1: l ])
		inject: 0
		into: [ :acc :each | acc + each ]
]

{ #category : #'examples - solution' }
Day08 >> solvedPart1 [
	<gtExample>
	^ super solvedPart1
]

{ #category : #'examples - solution' }
Day08 >> solvedPart2 [
	<gtExample>
	^ super solvedPart2
]

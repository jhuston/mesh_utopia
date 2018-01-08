(
SynthDef(\swarmSaw, {
	| out,
	freq1=50,	freq2=50,	freq3=50,	freq4=50,
	amp1=0.05, amp2=0.05, amp3=0.05, amp4=0.05,
	rlpfrq1=440, rlpfrq2=440, rlpfrq3=440, rlpfrq4=440,
	rlpfrqlag1 = 0.5, rlpfrqlag2 = 0.5, rlpfrqlag3 = 0.5, rlpfrqlag4 = 0.5,
	rlprq1=1, rlprq2=1, rlprq3=1, rlprq4=1,
	pan1=0, pan2=0, pan3=0, pan4=0,
	frqlag1=0.5, frqlag2=0.5, frqlag3=0.5, frqlag4=0.5,
	amplag1=0.5, amplag2=0.5, amplag3=0.5, amplag4=0.5,
	panlag1=0.5, panlag2=0.5, panlag3=0.5, panlag4=0.5,
	frqOffset=50, frqSpread=100, panOffset=0
 |

	var arrySaw, arryPan, arryFilt;

	// frqOffset = MouseX.kr(50, 500, 1, 5.0);
	frqSpread = MouseY.kr(0, 100);
	panOffset = MouseX.kr(-1,1);

	arrySaw = [
		SawDPW.ar(Lag.kr(freq1+frqOffset, frqlag1), Lag.kr(amp1, amplag1)),
		SawDPW.ar(Lag.kr(freq2+frqSpread+frqOffset, frqlag2), Lag.kr(amp2, amplag2)),
			SawDPW.ar(Lag.kr(freq3+(2*frqSpread), frqlag3)+frqOffset, Lag.kr(amp3, amplag3)),
				SawDPW.ar(Lag.kr(freq4+(3*frqSpread)+frqOffset, frqlag4), Lag.kr(amp4, amplag4))
	];

	arryFilt = [
		RLPF.ar(arrySaw[0], freq: Lag.kr(rlpfrq1, rlpfrqlag1), rq: rlprq1, mul: 1, add: 0),
		RLPF.ar(arrySaw[1], freq: Lag.kr(rlpfrq2, rlpfrqlag2), rq: rlprq2, mul: 1, add: 0),
		RLPF.ar(arrySaw[2], freq: Lag.kr(rlpfrq3, rlpfrqlag3), rq: rlprq3, mul: 1, add: 0),
		RLPF.ar(arrySaw[3], freq: Lag.kr(rlpfrq4, rlpfrqlag4), rq: rlprq4, mul: 1, add: 0)
	];

	arryPan = [
		LinPan2.ar( arryFilt[0], panOffset),
		LinPan2.ar( arryFilt[1], panOffset/(-1)),
		LinPan2.ar( arryFilt[2], panOffset/(-2)),
		LinPan2.ar( arryFilt[3], panOffset/(2))
	];

	Out.ar( out, arryPan.sum);
}).add;
)

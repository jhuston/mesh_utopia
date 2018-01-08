(
SynthDef(\trigTest, {
	|out, t_trig=0, dur=1.0, freq=440|
	Out.ar(
		out,
		Pan2.ar(
			SinOsc.ar(
				freq, 0,
				Decay2.kr(t_trig, 0.005, dur)
		), 0));
}).add;


(
SynthDef(\avgTrigTest, {
	| out, t_trig=0, freq1, freq2,	amp1, amp2, pan1, pan2,
	frqlag1, frqlag2, amplag1, amplag2, panlag1, panlag2,
	envdur=1.0, nilampL=0, ampattackL=0.99, ampsusL=0.6,
	ampattackT=0.05, ampdecayT=0.2, ampsusT=0.65, amprelT=0.1 |

	var ampenv, avfrq, avamp, avpan, avfrqlag, avamplag, avpanlag;

	ampenv = EnvGen.kr(
		Env.new(
			[nilampL, ampattackL, ampsusL, ampsusL, nilampL],
			[ampattackT, ampdecayT, ampsusT, amprelT]),
		gate: t_trig, timeScale: envdur);

	avfrq = (freq1 + freq2)/2;
	avamp = ((amp1 + amp2)/2) * ampenv;
	avpan = (pan1 + pan2)/2;
	avfrqlag = (frqlag1 + frqlag2)/2;
	avamplag = (amplag1 + amplag2)/2;
	avpanlag = (panlag1 + panlag2)/2;

	Out.ar(
		out,
		Pan2.ar(
			SinOsc.ar(
				Lag.kr(avfrq, avfrqlag), 0,
				Lag.kr(avamp, avamplag)
			), Lag.kr(avpan, avpanlag)
	))
}).add;

)
)

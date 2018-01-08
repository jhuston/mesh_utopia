
u=Synth.new(\swarmSaw);
u.nodeID

~nodeID = u.nodeID;

(
p = Pmono(
	\swarmSaw,
    \id, ~nodeID,
	\dur, Pdefn(\pdur),
	\freq1, Pdefn(\pfrq1),
	\freq2, Pdefn(\pfrq2),
	\freq3, Pdefn(\pfrq3),
	\freq4, Pdefn(\pfrq4),
	\pan1,Pdefn(\ppan1),
	\pan2,Pdefn(\ppan2),
	\pan3,Pdefn(\ppan3),
	\pan4,	Pdefn(\ppan4),
	\panlag1,Pdefn(\ppanlag1),
	\panlag2,Pdefn(\ppanlag2),
	\panlag3,Pdefn(\ppanlag3),
	\panlag4,	Pdefn(\ppanlag4),
	\rlpfrq1, Pdefn(\prlpfrq1),
	\rlpfrq2, Pdefn(\prlpfrq2),
	\rlpfrq3, Pdefn(\prlpfrq3),
	\rlpfrq4, Pdefn(\prlpfrq4),
	\rlprq1, Pdefn(\prlprq1),
	\rlprq2, Pdefn(\prlprq2),
	\rlprq3, Pdefn(\prlprq3),
	\rlprq4, Pdefn(\prlprq4),
	\rlpfrqlag1, Pdefn(\prlpfrqlag1),
	\rlpfrqlag2, Pdefn(\prlpfrqlag2),
	\rlpfrqlag3, Pdefn(\prlpfrqlag3),
	\rlpfrqlag4, Pdefn(\prlpfrqlag4),
	\amp1, Pdefn(\pamp1),
	\amp2, Pdefn(\pamp2),
	\amp3, Pdefn(\pamp3),
	\amp4, Pdefn(\pamp4),
	\amplag1, Pdefn(\pamplag1),
	\amplag2, Pdefn(\pamplag2),
	\amplag3, Pdefn(\pamplag3),
	\amplag4, Pdefn(\pamplag4)

).play;


Pdefn(\pdur, Pshuf([0.25, 0.5, 0.75, 1.0], inf));

Pdefn(\pfrq1, Pshuf([20, 100, 200, 300, 400], inf));
Pdefn(\pfrq2, Pshuf([20, 100, 200, 300, 400], inf));
Pdefn(\pfrq3, Pshuf([20, 100, 200, 300, 400], inf));
Pdefn(\pfrq4, Pshuf([20, 100, 200, 300, 400], inf));

Pdefn(\prlpfrq1, Pshuf([20, 100, 200, 300, 400]*8, inf));
Pdefn(\prlpfrq2, Pshuf([20, 100, 200, 300, 400]*6, inf));
Pdefn(\prlpfrq3, Pshuf([20, 100, 200, 300, 400]*3, inf));
Pdefn(\prlpfrq4, Pshuf([20, 100, 200, 300, 400]*4, inf));

Pdefn(\prlprq1, Pshuf([0.020, 0.100, 0.200, 0.300, 0.400], inf));
Pdefn(\prlprq2, Pshuf([0.020, 0.100, 0.200, 0.300, 0.400], inf));
Pdefn(\prlprq3, Pshuf([0.020, 0.100, 0.200, 0.300, 0.400], inf));
Pdefn(\prlprq4, Pshuf([0.020, 0.100, 0.200, 0.300, 0.400], inf));

Pdefn(\prlpfrqlag1, Pshuf([0.25, 0.5, 0.75, 1.0], inf));
Pdefn(\prlpfrqlag2, Pshuf([0.25, 0.5, 0.75, 1.0], inf));
Pdefn(\prlpfrqlag3, Pshuf([0.25, 0.5, 0.75, 1.0], inf));
Pdefn(\prlpfrqlag4, Pshuf([0.25, 0.5, 0.75, 1.0], inf));
)



(
Pdefn(\pdur, Pwhite(0,0.5));

Pdefn(\pfrq1, Pwhite(0,1000));
Pdefn(\pfrq2, Pwhite(0,1000));
Pdefn(\pfrq3, Pwhite(0,1000));
Pdefn(\pfrq4, Pwhite(0,1000));

Pdefn(\prlpfrq1, Pwhite(0,1000));
Pdefn(\prlpfrq2, Pwhite(0,1000));
Pdefn(\prlpfrq3, Pwhite(0,1000));
Pdefn(\prlpfrq4, Pwhite(0,1000));

Pdefn(\prlprq1, Pwhite(0,10));
Pdefn(\prlprq2, Pwhite(0,10));
Pdefn(\prlprq3, Pwhite(0,10));
Pdefn(\prlprq4, Pwhite(0,10));

Pdefn(\prlpfrqlag1, Pwhite(0,1));
Pdefn(\prlpfrqlag2, Pwhite(0,1));
Pdefn(\prlpfrqlag3, Pwhite(0,1));
Pdefn(\prlpfrqlag4, Pwhite(0,1));

)
p.stop





u.set(\frqlag1, 5.0,\frqlag2, 15.0,\frqlag3, 10.0,\frqlag4, 20.0)

(
Pdefn(\ptrig, Pseq([0.5, 0.75, 0.25], inf));


Pdefn(\qfreq, Pshuf([20, 100, 200, 300, 400], inf));

Pdefn(\pfreq, Pseq([100], inf) );

Pdefn(\pdur, Pseq([0.5, 0.25], inf) );

Pdefn(\qtrig, Pseq([0.5, 0.25], inf) );

Pdefn(\qdur, Pseq([0.5, 0.25, 1.5], inf) );

Pdefn(\qfreq, Pseq([100, 200, 300], inf) );

)

u.free

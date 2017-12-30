// Sample session.
// first run the code in ../mesh_startup
"synthdefs".loadRelative;
// Anyone can instantiate a synth.
// only the person who instantiates the synth can .set args on the synth
u=Synth.new(\trigTest, [freq: 800, dur: 0.75], s, \addToHead)
v=Synth.new(\trigTest2, [freq: 800, dur: 0.75], s, \addToHead)

u.free;
v.free;

u.set(\t_trig, 1);
u.set(\freq, 00);
v.set(\t_trig, 0.05);
v.set(\len, 2);
v.set(\freq, 400);
v.set(\freq1, 200);
v.set(\freq3, 200);
v.set(\freq4, 200);

// replace this node id with the desired one
~nodeID = 67109864;
~nodeID2 = 67109864;
(
p = Pmono(
  \trigTest,
  \id, ~nodeID,
  \t_trig, 1,
  \dur, Pdefn(\pdur),
  \freq, Pdefn(\pfreq)
).play(quant: TempoClock.default.beats);
)
p.stop;
p.reset.play;
p.free;

q = Pmono(
  \trigTest2,
  \id, ~nodeID2,
  \t_trig, Pdefn(\ptrig),
  \dur, Pdefn(\pdur),
  \len, Pdefn(\plen),
  \freq, Pdefn(\pfreq),
  \freq2, Pdefn(\pfreq2),
  \freq3, Pdefn(\pfreq3),
  \freq4, Pdefn(\pfreq4)
).play(quant: TempoClock.default.beats);

q.stop;
q.reset.play;
q.free;

// some sample Pdefns 
Pdefn(\pfreq, Prand([100, 100, 220, 120], inf));
Pdefn(\pfreq2, Prand([90, 300, 140], inf));
Pdefn(\pfreq3, Prand([300, 620, 740, 400], inf));
Pdefn(\pfreq4, Prand([60, 140, 340, 520], inf));
Pdefn(\t_trig, Pseq([0.15], inf));
Pdefn(\pdur, Pseq([0.25], inf));
Pdefn(\plen, Pseq([0.125], inf));

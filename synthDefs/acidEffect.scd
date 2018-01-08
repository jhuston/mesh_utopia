(
// efx synthdef- dig the timing on the delay and the pbind. :-P
SynthDef(\pbindefx, { arg out, in, time1=0.25, time2=0.5;
    var audio, efx;
    audio = In.ar([20, 21], 2);
    efx=CombN.ar(audio, 0.5, [time1, time2], 10, 1, audio);
    Out.ar(out, efx);
}).add;


SynthDef(\acid, { arg out, freq = 1000, gate = 1, pan = 0, cut = 4000, rez = 0.8, amp = 1;
    Out.ar(out,
        Pan2.ar(
            RLPF.ar(
                Pulse.ar(freq, 0.05),
            cut, rez),
        pan) * EnvGen.kr(Env.linen(0.02, 1, 0.3), gate, amp, doneAction: Done.freeSelf);
    )
}).add;
)

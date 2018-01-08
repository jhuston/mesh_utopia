// create efx synth
a = Synth.after(1, \pbindefx);

// if you don't like the beats change to 0.4, 0.24
// a.set(\time1, 0.4, \time2, 0.24);

(
Pbind(\instrument, \acid, \out, 20, \dur, Pseq([0.25, 0.5, 0.25], inf), \root, [-24, -17],
    \degree, Pseq([0, 3, 5, 7, 9, 11, 5, 1], inf), \pan, Pfunc({1.0.rand2}),
    \cut, Pxrand([1000, 500, 2000, 300], inf), \rez, Pfunc({0.7.rand +0.3}), \amp, 0.12).play;
)

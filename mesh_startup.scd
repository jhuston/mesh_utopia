// load remote server options
"server_options.scd".loadRelative;
// join Utopia, setup chat, SynthDescRelay and CodeRelay
"setup_utopia.scd".loadRelative;

// load any SynthDefs or other one time code
// saved in separate files



// cleanup everything
"cleanup.scd".loadRelative;
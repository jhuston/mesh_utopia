// [OPTIONAL]
// load remote server options for the mesher
"mesher_server_options.scd".loadRelative;

// [OPTIONAL]
// load server options for local server
// Can be used when doing a remote session over VPN and all participants will be running
// the same code at the same time.
"server_options.scd".loadRelative;

// [OPTIONAL]
// If setting up a remote session using the mesher streisand VPN, set ~streisand variable
~streisand = NMLNetAddrMP("192.168.0.255", 57120 + (0..7));
// [OPTIONAL]
// To enable all code executed by all Peers to be executed on all machines
~enableRemoteCodeExecution = true;

// join Utopia, setup chat, SynthDescRelay and CodeRelay
"setup_utopia.scd".loadRelative;

// load any SynthDefs or other one time code
// saved in separate files


// cleanup everything
"cleanup.scd".loadRelative;
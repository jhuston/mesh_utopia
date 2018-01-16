// On the designated SERVER, run the following, before the other computers join:
// 1. set options and boot the server

Server.default = Server.local;
o = Server.local.options;
o.memSize = 4096;
o.maxLogins_(16);
o.numOutputBusChannels = 4;
//o.device ="MOTU Traveler";     // use a specific soundcard
o.device = nil;            // use the system default soundcard

s.reboot;

// 2. join Utopia, setup chat, SynthDescRelay and CodeRelay
"setup_utopia.scd".loadRelative;

// 3. get the ip and port information for THIS machine
// look for something like inet 10.0.1.x
// NOT  127.0.0.1

// IP address:
"ifconfig |grep inet".systemCmd;

// Port Number
NetAddr.langPort.postln;

// maxLogins:
Server.local.options.maxLogins.postln;

//4. use the above information to run client_session on all clients.

// 4. load any SynthDefs or other one time code
// saved in separate files

// 5. when you are finished, at the end of the session:
//    cleanup everything

"cleanup.scd".loadRelative;

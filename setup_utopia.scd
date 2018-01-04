//set up display of network peers
~peers = Window("Mesh Collaborative").front;
~peers.layout = VLayout.new.add(~listView = ListView.new);
~peers.alwaysOnTop = true;

~addrBook = AddrBook.new;
// to get updates, just add a dependant
~addrBook.addDependant({|addrBook, what, who|
{~listView.items = addrBook.peers.collectAs({|peer|
peer.name ++ " | " ++ peer.addr.ip ++ " | " ++ if(peer.online, "online", "offline");
}, Array)}.defer;
});

~addrBook.addMe("hostname".unixCmdGetStdOut.split($.)[0];); // add this machine
if (~streisand.class == NMLNetAddrMP, {
	"using streisand broadcast address".postln;
	~hail = Hail(~addrBook, 1, broadcastAddr: ~streisand);
}, {
	"using default broadcast address".postln;
	~hail = Hail(~addrBook);
});
~me = ~addrBook.me;
// assumes ~addrBook contains the appropriate Peers
// everybody run this
~synthDescRel = SynthDescRelay(~addrBook);

// now adds an action for new descs
~synthDescRel.addDependant({|descRelay, what, desc, defcode|
    "Check out this new def!!\n\n%\n".format(defcode).postln;
});

~chatter = Chatter(~addrBook);
// make a GUI to see the results
~chatWin = Window("Mesh Chat").front;
~chatWin.layout = VLayout(~textField = TextField(), ~textView = TextView());
~textField.action_({|v| ~chatter.send(v.string); v.string = "" });
// to get updates, just add a dependant
~chatter.addDependant({|chatter, what, who, chat|
    { ~textView.string_(who ++ ": " ++ "\n" ++ chat ++ "\n" ++ ~textView.string) }.defer;
});
~chatWin.alwaysOnTop = true;

// make a shared relay
~codeRelay = CodeRelay(~addrBook);
// only send working code to peers
~codeRelay.onlyWorkingCode_(true);
// start History and make its gui for testing
History.start.localOff;
History.makeWin(20@20);
// code relay now sends to History window:
~codeRelay.addHistory;

if(~enableRemoteCodeExecution == true, {
// Enables executing code from all peers in the addressBook.
~codeRelay.addDependant({|codeRelay, what, who, code|
	codeRelay.postln;
	what.postln;
	who.postln;
	code.postln;
	if(who != ~me.name,
		{code.interpret},
		{"not interpreting code from you twice!".postln});
});} ,{"not executing remote code"});

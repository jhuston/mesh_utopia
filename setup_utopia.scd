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
~hail = Hail(~addrBook);
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
(
~chatWin = Window("Mesh Chat").front;
~chatWin.layout = VLayout(~textField = TextField(), ~textView = TextView());
~textField.action_({|v| ~chatter.send(v.string); v.string = "" });
// to get updates, just add a dependant
~chatter.addDependant({|chatter, what, who, chat|
    { ~textView.string_(who ++ ": " ++ "\n" ++ chat ++ "\n" ++ ~textView.string) }.defer;
});
~chatWin.alwaysOnTop = true;
)

// cleanup
~chatter.free; ~chatWin.close;

// make a shared relay
~codeRelay = CodeRelay(~addrBook);

// start History and make its gui for testing
History.start.localOff;
History.makeWin(20@20);

// code relay now sends to History window:
~codeRelay.addHistory;

// remove coderelay and free its resources.
~codeRelay.free;
History.end;

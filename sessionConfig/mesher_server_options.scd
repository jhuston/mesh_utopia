// Set up the server to use mesher
// Set up any additional server options too
(
~netAddr = NetAddr(~serverIP, ~serverPort);
~serverOptions = ServerOptions.new;
~serverOptions.maxLogins_(16);
Server.default = Server.remote(\mesher, ~netAddr, ~serverOptions);
)

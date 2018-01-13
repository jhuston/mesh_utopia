// Set up the server to use mesher
// Set up any additional server options too
(
~netAddr = NetAddr("192.168.0.6", 57110);
~serverOptions = ServerOptions.new;
~serverOptions.maxLogins_(16);
Server.default = Server.remote(\mesher, ~netAddr, ~serverOptions);
)

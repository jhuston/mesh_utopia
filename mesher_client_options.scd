// Set up the server to use mesher
// Set up any additional server options too
(
~netAddr = NetAddr("10.0.10.100", 57110);
~serverOptions = ServerOptions.new;
~serverOptions.maxLogins_(16);
Server.default = Server.remote(\mesher, ~netAddr, ~serverOptions);
)

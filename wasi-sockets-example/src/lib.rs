#[allow(warnings)]
mod bindings;

use crate::bindings::exports::wasi::cli::run::Guest;

use crate::bindings::wasi::sockets::network::{IpAddressFamily, Ipv4SocketAddress, IpSocketAddress, Network, ErrorCode};
use crate::bindings::wasi::sockets::tcp::TcpSocket;
use crate::bindings::wasi::io::streams::{InputStream, OutputStream};

use crate::bindings::wasi::sockets::instance_network::instance_network;
use crate::bindings::wasi::sockets::tcp_create_socket::create_tcp_socket;

struct Component;

impl Guest for Component {
    fn run() -> Result<(), ()> {
        let (_socket, (input, output)) = connect().unwrap();
        let _ = output.blocking_write_and_flush(b"hello!");
        drop((input, output));
        return Ok(());
    }
}

fn connect() -> Result<(TcpSocket, (InputStream, OutputStream)), ErrorCode> {
    let network: Network = instance_network();
    let socket: TcpSocket = create_tcp_socket(IpAddressFamily::Ipv4).unwrap();
    let addr = Ipv4SocketAddress { port: 8000, address: (127, 0, 0, 1) };
    socket.start_connect(&network, IpSocketAddress::Ipv4(addr)).unwrap();
    Ok(loop {
        match socket.finish_connect() {
            Err(ErrorCode::WouldBlock) => socket.subscribe().block(),
            result => break (socket, result?),
        }
    })
}

bindings::export!(Component with_types_in bindings);

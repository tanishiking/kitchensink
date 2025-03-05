//> using scala 3

import java.net.*
import java.io.*
import scala.io.*

@main def runServer(): Unit =
  val server = ServerSocket(8000)
  println("Server started on 127.0.0.1:8000")

  while true do
    val s = server.accept()
    println(s"Client connected: ${s.getInetAddress}")

    val in = BufferedSource(s.getInputStream).getLines()
    val out = PrintStream(s.getOutputStream, true)

    for line <- in do
      println(s"Received: $line")
    s.close()

// Generated by `wit-bindgen` 0.43.0. DO NOT EDIT!

///|
fn wasmImportResourceDropPollable(resource : Int) = "wasi:io/poll@0.2.0" "[resource-drop]pollable"

///|
fn wasmImportMethodPollableReady(p0 : Int) -> Int = "wasi:io/poll@0.2.0" "[method]pollable.ready"

///|
fn wasmImportMethodPollableBlock(p0 : Int) = "wasi:io/poll@0.2.0" "[method]pollable.block"

///|
fn wasmImportPoll(p0 : Int, p1 : Int, p2 : Int) = "wasi:io/poll@0.2.0" "poll"

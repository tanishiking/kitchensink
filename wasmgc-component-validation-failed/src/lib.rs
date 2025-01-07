#[allow(warnings)]
mod bindings;

use crate::bindings::exports::tanishiking::wasmgc_component_test::tester::Guest;

struct Component;

impl Guest for Component {
    fn test() {
        println!("test")
    }
}

bindings::export!(Component with_types_in bindings);

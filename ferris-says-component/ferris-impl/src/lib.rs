#[allow(warnings)]
mod bindings;

use bindings::exports::tanishiking::ferris::ferris_says::Guest;

use ferris_says::say;
use std::io::{stdout, BufWriter};

struct Component;

impl Guest for Component {
    fn say(content: String, width: u32) {
        let stdout = stdout();
        let mut writer = BufWriter::new(stdout.lock());
        say(content.as_str(), width.try_into().unwrap(), &mut writer).unwrap();
    }
}

bindings::export!(Component with_types_in bindings);

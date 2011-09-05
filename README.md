#log-tests

Logs Rails tests actually run

For any test (or test system) using test/test_helper.rb (as testing does in Rails).

Have you ever wondered, about a newly-minted test, which you *thought* you had saved (perhaps in a directory well
below 'test/functional' or 'test/unit'), whether it actually ran, in a your full test suite?

This code verifies that it ran, and quickly: it automatically logs to a file, 'out/test-should-include-this-file.log',
all the test files that actually ran -- you don't have to do anything, beyond the usual:

```ruby
require 'test_helper'
```

Copyright (c) 2011 Mark D. Blackwell. See [MIT-LICENSE](MIT-LICENSE) for details.

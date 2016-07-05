Testsuite suite for the Proofler API.

It consists of a couple of shell scripts that sometimes expect options, but always will tell you what to do if you execute them.
The file `config` provides a couple of configuration options.

# Mocking mode

This also works against the [Apiary mock](http://docs.proofler.apiary.io/). See the `MOCK_MODE` option in the `config` file for details.

# TODO

- [ ] Is `linkedOptions` and `linkedFacts` really the best idea to represent this concept. What about a resource like `optionFactLinking` with a compound id like `2-572` (optiond id, a dash and the fact id).

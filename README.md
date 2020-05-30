# Remove curses from texts

The bad_words gem removes offensives words of texts.
The actual configuration removes offensives words to pt-br, but you can make the configuration to all languages.

## Usage

### Generating Binary Input files

The binary input files can be generated using the `gen` rake task:

```sh
$ cd shared
$ bundle update
$ bundle exec rake gen
```

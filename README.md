# MusicFeed

Small Elixir library to retrieve now playing data from various streaming music stations

## Installation

```elixir
def deps do
  [
    {:music_feed, "~> 0.9.0"}
  ]
end
```

## Usage

    > MusicFeed.counterstream()
    %{ title: "Title of Piece", composer: "Composer of Piece" }

An example of this library in use is available at [https://github.com/bhoggard/now-playing-api-ex](https://github.com/bhoggard/now-playing-api-ex).

## Contributing

If you would like to add additional stations, add a method to `MusicFeed.Parse` and a test
for it in `MusicFeed.ParserTest`.

## Copyright

&copy; [Barry Hoggard](http://tristanmedia.com/), 2019

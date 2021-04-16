# inferkit-ruby

This gem is a Ruby wrapper for [InferKit](https://inferkit.com/), an AI-based
text generator.

## Installation

```
gem install inferkit-ruby
```

## Requirements

- Ruby 3.0.0 or higher
- An InferKit API-Key

## Usage

```
require 'inferkit'
require 'inferkit/client'

Inferkit.configure(api_key: 'YOUR_INFERKIT_API_KEY')

client = Inferkit::Client.new
puts client.generate('This is the story of',
  length: 500,
  start_from_beginning: true,
  force_no_end: false,
  top_p: 0.8,
  temperature: 1.5
)
```

## Configuration

You can provide your API-key as parameter when calling `Inferkit.configure` as in the example above. Or you can set the `INFERKIT_API_KEY` environment variable and call `Inferkit.configure` without parameter.

## Generating text

You generate text by calling the `generate` method of `Inferkit::Client` and providing a text prompt. All additional parameters, such as length, are optional.

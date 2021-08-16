# Archallenge

This is a gem built to fulfill [The Picking Problem](https://gist.github.com/luctus/3db17f4eb1a6d32eebaceb86afcc30e2). Its a simple ruby exercise to get the most homogenous selection of tokens from a JSON file containing multiple recomendations of articles. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'archallenge'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install archallenge

## Usage

This library takes a JSON input with the n recomendations on a given article based on 3 different algorithms:  **logs**, **content**, and **myad**, and returns an Array of tokens with the most homogenous list of recomendations, with a maximum of 4 recomendations (if needed, a different number can be specified).
### Example
 ```ruby
 file = {
  "logs": [
    {
      "url": "//www.archdaily.com/345048/nirma-vidyavihar-apurva-amin-architects",
      "token": "345048",
      "thumbnail": "//images.adsttc.com/media/images/5143/8a8e/b3fc/4baa/2c00/000e/small_jpg/NVV1_AAA_09.jpg?1363380874",
      "title": "Nirma Vidyavihar / Apurva Amin Architects"
    }
  ],
  "content": [],
  "myad": []
}
=> {:logs=>[{:url=>"//www.archdaily.com/345048/nirma-vidyavihar-apurva-amin-architects", :token=>"345048", :thumbnail=>"//images.adsttc.com/media/images/5143/8a8e/b3fc/4baa/2c00/000e/small_jpg/NVV1_AAA_09.jpg?1363380874", :title=>"Nirma Vidyavihar / Apurva Amin Architects"}], :content=>[], :myad=>[]} 

recomendation = Archallenge::ADSelector.new(file)
 => #<Archallenge::ADSelector:0x0000559129b73378 @file={:logs=>[{:url=>"//www.archdaily.com/345048/nirma-vidyavihar-apurva-amin-architects", :token=>"345048", :thumbnail=>"//images.adsttc.com/media/images/5143/8a8e/b3fc/4baa/2c00/000e/small_jpg/NVV1_AAA_09.jpg?1363380874", :title=>"Nirma Vidyavihar / Apurva Amin Architects"}], :content=>[], :myad=>[]}> 

#If required, you can specify a different recomendation number for articles, default is 4
recomendation.select
=> [345048] 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joaquinsd/archallenge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Archallenge project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/joaquinsd/archallenge/blob/master/CODE_OF_CONDUCT.md).

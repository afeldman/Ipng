# Ipng

This small lib makes it possible to store date into an png image. I use chunky_png.
This library supports openssl encryption if you want to store data in the image safe.
If the data is set into the image the png can be open in an abitrary image viewer. the  

```ruby

require 'chunky_png'

@image = ChunkyPNG::Image.from_file('spec/img/gentoo_tux.png') 

IPNG.set (@image, 'THIS_IS_A_TAG', 'THIS is a string data')
IPNG.set_encr(@image, 'THIS_IS_A_DIFFERENT_TAG', 'This is another string', 'key phrase')

IPNG.set_func (@image, 'puts "this is a small ruby evaluation script"')

@image.save('path to the new file')

```

There is only one function in the image for the moment. you can extend this usind different tags.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/afeldman/Ipng. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ipng project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/afeldman/Ipng/blob/master/CODE_OF_CONDUCT.md).

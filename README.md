# LondonSpas

This is a demo CLI app for teaching purposes.
Also for finding-the-best-rated-spas-in-London purposes.

Showing use of [HTTParty](https://github.com/jnunemaker/httparty) to retrieve data from the [Yelp Fusion API](https://www.yelp.com/developers/documentation/v3), make new instances of Ruby classes to represent the data and making the data visible to users through an interactive CLI app.

This also makes use of the [dotenv](https://github.com/bkeepers/dotenv) gem to keep private variable safe. Whilst that's pretty great for me and also you as I gave step by step description of how to implement this in the API Class file, it does mean that you'll need to provide your own API key if you want this to actually run. Just replace `ENV[YELP_API_KEY]` in the api call, with your own Yelp-provided key if you want to see it in action locally.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Gingertonic/london_spas. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LondonSpas project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Gingertonic/london_spas/blob/master/CODE_OF_CONDUCT.md).

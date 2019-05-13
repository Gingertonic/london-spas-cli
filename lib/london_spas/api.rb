class LondonSpas::API

    # Yelp (and many other APIs) require an authentication key. 
    # Yelp's instructions are at: https://www.yelp.com/developers/documentation/v3/authentication

    # You'll get one or both of & API Key Client ID
    # It's not ideal to share these with the world 
    # so instead of putting them right in your API class,
    # you can hide then in a .env file.

    # The dotenv gem is a great way to do this. https://github.com/bkeepers/dotenv
    # 1. Add the dotenv gem to your gemfile and run a `bundle install`
    # 2. Require dotenv in the same place you required things like pry, HTTParty etc 
    #   (This is you environment file, usually called either the same name as your app - in this case, `lib/london_spas.rb`  or just `environment.rb`)
    # 3. Make a file called simply `.env` in the root of your app (this is the same level as your `bin`, `lib`, `README.md etc. live)
    # 4. In your new .env file, add your 'secrets'! eg:
    #   YELP_API_KEY=nsdfjgkjh4jh2bd8dnsflkgnXnf
    #   YELP_CLIENT_ID=ajfbebn44f
    # 5. Now you can access them in the rest of your code with `ENV[NAME_OF_SECRET]`
    #   See code below for example
    # 6. Finally, remember to hide you .env file from Github! In your `.gitignore` file, just add `.env` and you're ready to push to GH!

    def self.get_spas
        resp = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=Spas&location=London&limit=10", {
            # Some parameters are passed in via query string (eg term & location above - ?term=Spas&location=London) 
            # And some in headers (eg authorization below)
            # This can depend on the API itself - check the documentation if you're not sure where to start.
            headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"},
        })
        # binding.pry - this is a great place to debug. See what `resp` is - is it the data you want? 
        #                                               Is it a message saying you forgot some authorization?
        spas = resp["businesses"]
        LondonSpas::Spa.new_from_collection(spas)
    end
end
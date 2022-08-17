# instagram_graph_api

An API Client for Instagram Graph API.

You can get:
* Business accounts
* User details
* Recent posted media
* Media details
* Media Insights

Supported media:
* Image
* Video/Reel
* Story


You can only get data, not update or post right now.

Based on the Ruby library https://github.com/rakeshpatra/instagram_graph_api

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     instagram_graph_api:
       github: confact/instagram_graph_api.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "instagram_graph_api"
```

```crystal
access_token = "your_access_token"

instagram = InstagramGraphApi::Client.new(access_token)

p! instagram.ig_business_accounts # list of all business accounts for these access token
p! instagram.business_account_id # only return the business account id, for api calls like below
p! instagram.user_recent_media(instagram.business_account_id)
p! instagram.user_recent_media(instagram.business_account_id, type: "story") # get stories
p! instagram.insights("media_id")
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/confact/instagram_graph_api.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Håkan Nylén](https://github.com/confact) - creator and maintainer

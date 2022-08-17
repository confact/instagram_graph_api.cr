# TODO: Write documentation for `InstagramGraphApi`
require "./instagram_graph_api/*"
module InstagramGraphApi
  VERSION = "0.1.0"


  def self.client(token)
    InstagramGraphApi::Client.new(token)
  end
end

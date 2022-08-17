require "./*"
require "http/client"
require "json"
require "log"
module InstagramGraphApi
  class Client

    include InstagramGraphApi::Client::Users
    include InstagramGraphApi::Client::Media
    include InstagramGraphApi::Client::Stories
    include InstagramGraphApi::Client::Discovery

    HOST = "https://graph.facebook.com/"

    property access_token : String = ""

    def initialize(@access_token)
    end

    def get(path, headers = HTTP::Headers.new) : HTTP::Client::Response
      uri = URI.parse("#{HOST}#{path}")
      #params = uri.query_params
      #params.add("access_token", @access_token)
      #uri.query_params = params
      Log.info { "GET #{uri}" }
      HTTP::Client.get(uri, headers: headers)
    end

    def get_connection(id, connection_name, args = {} of String => String)
      # Fetches the connections for given object.
      graph_call("#{id}/#{connection_name}", args, "get")
    end

    def get_connections(id, connection_name, args = {} of String => String)
      get_connection(id, connection_name, args)
    end

    def graph_call(path, args = {} of String => String, type = "get") : JSON::Any
      # Makes the HTTP API call.
      headers = HTTP::Headers{"Authorization" => "Bearer #{access_token}"}
      headers.merge!(args)
      if type == "get"
        response = get(path, headers)
      else
        raise "Unsupported HTTP type #{type}"
      end

      if response.status_code == 200
        JSON.parse(response.body).as_h["data"]
      else
        raise "Error: #{response.status_code} #{response.body}"
      end
    end

    def get_pages(params="")
      graph_call(["me", "accounts#{params}"].join("/"))
    end
  end
end
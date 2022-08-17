module InstagramGraphApi
  class Client
    module Discovery
      def discover_user(ig_account_id : String, username : String, fields = nil)
        fields ||= "id,followers_count,media_count,ig_id"
        query = "?fields=business_discovery.username(#{username}){#{fields}}"
        get_connections(ig_account_id, query)
      end

      def discover_user_media(ig_account_id : String, username : String, fields = nil, options={} of String => String)
        fields ||= "caption,media_url,media_type,like_count,comments_count,id"
        page_options = ".after(#{options["after"]})" if options["after"]?
        page_options = ".after(#{options["before"]})" if options["before"]?
        discover_user(ig_account_id, username, "media#{page_options}{#{fields}}")
      end
    end
  end
end
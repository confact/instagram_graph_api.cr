module InstagramGraphApi
  class Client
    module Stories
      def user_stories(ig_account_id : String, fields = nil, options = {} of String => String)
        fields ||= "caption,children,comments_count,id,like_count,media_type,media_url,permalink,timestamp,username"
        query = "stories?fields=#{fields}"
        query += "&after=#{options["after"]}" if options["after"]?
        query += "&before=#{options["before"]}" if options["before"]?
        query += "&limit=#{options["limit"]}" if options["limit"]?
        get_connections(ig_account_id, query)
      end

      def user_recent_stories(id : String, fields = nil, options = {} of String => String)
        user_recent_media(id, fields, "story", options)
      end
    end
  end
end
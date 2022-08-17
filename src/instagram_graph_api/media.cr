module InstagramGraphApi
  class Client
    module Media
      property media_info

      METRIC_HASH = {
        "image": "impressions,reach",
        "video": "impressions,reach,video_views",
        "story": "impressions,replies,reach,taps_forward,taps_back,exits"
      }

      MEDIA_INFO_HASH = {
        "image": "comments_count,like_count,media_type,"\
                    "media_url,permalink,timestamp,thumbnail_url",
        "video": "comments_count,like_count,media_type,"\
                    "media_url,permalink,timestamp,thumbnail_url",
        "story": "media_type,media_url,permalink,"\
                      "timestamp,thumbnail_url"
      }

      def user_recent_media(id : String, fields = nil, type = "image", options = {} of String => String)
        entity = type == "story" ? "stories" : "media"
        fields ||= MEDIA_INFO_HASH[type]
        query = "#{entity}?fields=#{fields}"
        query += "&after=#{options["after"]}" if options["after"]?
        query += "&before=#{options["before"]}" if options["before"]?
        query += "&limit=#{options["limit"]}" if options["limit"]?
        Array(Data::Media).from_json(get_connections(id, query).to_json)
      end

      def media_details(media_id : String, fields = nil, type = "image")
        fields ||= MEDIA_INFO_HASH[type]
        get_connections(media_id , "?fields=#{fields}")
      end

      def insights(media_id : String, type = "image", metrics : String? = nil) : Array(Data::Insight)
        metrics ||= METRIC_HASH[type]
        Array(Data::Insight).from_json(get_connections(media_id , "insights?metric=#{metrics}").to_json)
      end
    end
  end
end
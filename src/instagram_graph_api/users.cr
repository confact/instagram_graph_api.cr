module InstagramGraphApi
  class Client
    module Users

      ACCOUNT_METRIC_HASH = {
        "day": "email_contacts,follower_count,get_directions_clicks,impressions,phone_call_clicks,profile_views,reach,text_message_clicks,website_clicks",
        "week": "impressions,reach",
        "days_28": "impressions,reach",
        "lifetime": "audience_city,audience_country,audience_gender_age,audience_locale,online_followers"
      }

      @business_account_id : String? = nil

      def account_insights(ig_account_id, period = "day", since_time = Time.utc-30.days, until_time = Time.utc, metrics = nil)
        metrics ||= ACCOUNT_METRIC_HASH[period]
        if period == "lifetime"
          get_connections(ig_account_id, "insights?metric=#{metrics}&period=#{period}")
        else
          get_connections(ig_account_id, "insights?metric=#{metrics}&since=#{since_time.to_unix}&until=#{until_time.to_unix}&period=#{period}")
        end
      end

      def connected_ig_accounts(fields = nil) : Array(Data::BusinessAccount)
        fields ||= "id,name,biography,ig_id,followers_count,profile_picture_url,username"
        accounts = get_pages("?fields=connected_instagram_account{#{fields}}")
        Array(Data::BusinessAccount).from_json(accounts.map do |a|
          a.as_h
        end.compact.to_json)
      end

      def ig_business_accounts(fields = nil) : Array(Data::BusinessAccount)
        fields ||= "id,name,biography,ig_id,followers_count,profile_picture_url,username"
        accounts = get_pages("?fields=instagram_business_account{#{fields}}").as_a
        Array(Data::BusinessAccount).from_json(accounts.map do |a|
          a.as_h["instagram_business_account"]
        end.compact.to_json)
      end

      def business_account_id : String?
        @business_account_id ||= ig_business_accounts.first.try(&.id)
      end
    end
  end
end
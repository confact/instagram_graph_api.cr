module InstagramGraphApi
  module Data
    struct BusinessAccount
      include JSON::Serializable

      property id : String
      property name : String
      property biography : String
      property username : String
      property ig_id : Int64

      property followers_count : Int32
      property media_count : Int32?
      property website : String?

      property profile_picture_url : String

      def external_url
        website
      end

    end
  end 
end
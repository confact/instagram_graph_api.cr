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

      property profile_picture_url : String

    end
  end 
end
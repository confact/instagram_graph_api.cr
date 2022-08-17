module InstagramGraphApi
  module Data
    struct Media
      include JSON::Serializable

      property media_type : String
      # Reel dont link to media, but have a thumbnail, and vice versa for the others
      property media_url : String?
      property thumbnail_url : String?
      property permalink : String
      property timestamp : Time
      property id : String
      
      #likes and comments only on image and video
      property like_count : Int32?
      property comments_count : Int32?
    end
  end 
end
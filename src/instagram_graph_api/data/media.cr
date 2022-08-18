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
      property caption : String?
      property shortcode : String
      property media_product_type : String
      property video_url : String? # only for reels and video
      
      #likes and comments only on image and video
      property like_count : Int32?
      property comments_count : Int32?

      def likes
        like_count
      end

      def comments
        comments_count
      end

      def date
        timestamp
      end

      def code
        shortcode
      end

      def is_video
        media_type == "VIDEO" || media_type == "REEL"
      end

      def display_src
        media_url || thumbnail_url || ""
      end
    end
  end 
end
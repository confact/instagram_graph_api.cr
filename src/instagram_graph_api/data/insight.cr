module InstagramGraphApi
  module Data
    struct Insight
      include JSON::Serializable

      property name : String
      property period : String
      property title : String
      property description : String
      property id : String

      @[JSON::Field(key: "values")]
      property values : Array(InsightValue)

      struct InsightValue
        include JSON::Serializable

        property value : Int64
      end
    end
  end 
end
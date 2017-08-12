class Content
# - title: String
# - description: String
# - starring: Array of String
# - genre: Array of String
# - year_released: Integer
# - duration: String
# - region: Array of String (countries)
# - file: String
# TODO:
# - photo #String (Use emoji for now)

    attr_accessor :title #String
    attr_accessor :description #String
    attr_accessor :starring #String
    attr_accessor :genre #Array of String (Can have multiple genre)
    attr_accessor :year_released #Integer
    attr_accessor :material_rating #String
    attr_accessor :duration #String - # of Seasons for Series or # of Hours for a movie
    attr_accessor :region #String (e.g. Australia)
    attr_accessor :url #String (Url source file of the content)
end

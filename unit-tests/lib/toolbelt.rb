class Toolbelt
    def self.generate_string_of_length(len)
        r = Random.new
        (1..len).map {
            r.rand(0..9).to_s
        }.join
    end

end
class Params

    attr_accessor :question, :value

    def initialize(params)
        @question = params[:question]
        @value = params[:value]
    end

end

val = Params.new(question: "What is the answer?", value: "This is the answer")
p val.question
p val.value

# val.question = ""

if !val.question.empty?
    p "It has a value"
end
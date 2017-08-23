def calculate(a, b, operator)
    case operator
        when 'add'; a.to_f+b.to_f
        when 'subtract'; a.to_f-b.to_f
        when 'multiply'; a.to_f*b.to_f
        when 'divide'; a.to_f/b.to_f
    end
end

puts calculate(5,10,"add")
puts calculate(5,10,"subtract")
puts calculate(5,10,"multiply")
puts calculate(5,10,"divide")
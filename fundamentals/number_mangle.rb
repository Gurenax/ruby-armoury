class NumberMangle
    def five_times(number)
        number * 5.0
    end

    def hund_times(number)
        number * 100.0
    end

    def div_seven(number)
        number / 7.0
    end
    
    def number_mangle(number)
        div_seven(hund_times(five_times(number)))
    end
end

nm = NumberMangle.new
result = nm.number_mangle(10)  # ((10*5)*100)/7 = 714.285714285714286
p result # 714.2857142857143
a = [1,2,43,34,5,6,8,7,9]
p(a.select { |e|  e%2==0 })
p(a.reject { |e| e%2==0 })#返回结果为假的
p(a.detect { |e| e%2 ==0 })#返回第一个符合条件的
p(a.partition { |e| e%2==0 })#真和假作为块返回

puts("-------------------------")
##排序与比较大小
ary = ["1","3","123","99","4","2","-2","-99"]
p ary.max #99

p ary.max { |a, b| a.to_i <=> b.to_i } #123

p ary.sort { |a, b| a.to_i <=> b.to_i }
p ary #sort 没有改变原ary对象

p ary.map { |e| [e.to_i,e] }.sort.map { |i| i[-1] }

p ary.sort_by { |x| x.to_i }

p ary.max_by {|x| x.to_i}#1.9 only

p ary.min_by {|x| x.to_i}#1.9 only


puts ("type exit")
gets ("exit")


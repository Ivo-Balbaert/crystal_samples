macro for(expr)
  {{expr.args.first.args.first}}.each do |{{expr.name.id}}|
    {{expr.args.first.block.body}}
  end
end

for i in [1,2,3] do
 puts i
end

# Output
# 1
# 2
# 3

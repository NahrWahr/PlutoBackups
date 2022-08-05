### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# ╔═╡ b55acb2c-97c4-47f9-9bb6-ff1c17c08171
test = [join(map(Char, rand(97:120, 10))) for _=1:5]

# ╔═╡ 547209dd-d54a-4deb-b5bd-486661766a3b
function uniqstr(str::String)
	return length(unique(str)) == length(str)
end

# ╔═╡ 9f4738ac-0c5c-4603-87c9-4311fdeadaa5
function largestuniqstr(Str::String, 
						n::Int64 = length(unique(Str)))
	
	for i=1:length(Str)-n
		if uniqstr(Str[i:i+n])
			return n+1, Str[i:i+n]
		end
	end
	largestuniqstr(Str, n-1)
end

# ╔═╡ ca854b32-11b5-488a-8c3c-51d6bce90dcb
map(largestuniqstr, test)

# ╔═╡ 23752765-d5cf-4cf5-84c9-bdb6ae284599
md"""
---
---
"""

# ╔═╡ 4092509a-aeb6-4741-859a-5ded8938a961
test2 = [rand(-10:10, 30) for _=1:10]; target = 3

# ╔═╡ 77260d30-9beb-4cce-8d8c-05149933077e
function Sum2(v)
	l = length(v)

	vo = []
	for i in 1:l-1
		for j in i+1:l
			#println(i," ", j, " ", ((i-1)*(j-1)) + (j-i))
			push!(vo, v[i]+v[j])
		end
	end
	return vo
end

# ╔═╡ a86e52d4-066a-4dd1-9a64-da9c70b4e675
function Sum3Closest(nums, target)
	sort!(nums)
	numspositive = filter(x->x>0, nums)
	numsnegative = filter(x->x<0, nums)
	s2nums = Sum2(nums)

	s2MaxValue, s2MaxIndex = findmax(s2nums .- target)
	
	if target > s2MaxValue
		s2nums = s2nums[s2MaxIndex:end]
		for i in numsnegative
			s2nums .+ i
		end
				
	else
		s2nums = s2nums[begin:s2MaxIndex]
		for i in numspositive
			s2nums .+ i
		end
		
	end
	
end

# ╔═╡ 2abd714f-5ce6-4bab-9f60-392509a5c460
let x = sort!(rand(-10:10,5))
	x, Sum2(x)
end

# ╔═╡ 1bcb7066-b572-4dd0-bd2d-8ace14a5576a
function ding(target)
	if rem(target, 3) == 2
		step = [target÷3, 1]
	elseif rem(target, 3) == 1
		step = [(target÷3)+1, -1]
	else
		step = [target÷3, 0]
	end

	if sum(abs.(step + [-2,3])) < sum(abs.(step))
		return sum(abs.(step + [-2,3]))
	else
		return sum(abs.(step))
	end
end

# ╔═╡ 12fd95fc-ee7c-4076-bdaa-4e4a5c67ba8b


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╠═b55acb2c-97c4-47f9-9bb6-ff1c17c08171
# ╠═547209dd-d54a-4deb-b5bd-486661766a3b
# ╠═9f4738ac-0c5c-4603-87c9-4311fdeadaa5
# ╠═ca854b32-11b5-488a-8c3c-51d6bce90dcb
# ╟─23752765-d5cf-4cf5-84c9-bdb6ae284599
# ╠═4092509a-aeb6-4741-859a-5ded8938a961
# ╠═a86e52d4-066a-4dd1-9a64-da9c70b4e675
# ╠═77260d30-9beb-4cce-8d8c-05149933077e
# ╠═2abd714f-5ce6-4bab-9f60-392509a5c460
# ╠═1bcb7066-b572-4dd0-bd2d-8ace14a5576a
# ╠═12fd95fc-ee7c-4076-bdaa-4e4a5c67ba8b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

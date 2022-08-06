### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

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
begin
	q1test = [join(map(Char, rand(97:120, 10))) for _=1:5]
	map(largestuniqstr, q1test)
end

# ╔═╡ 23752765-d5cf-4cf5-84c9-bdb6ae284599
md"""
---
---
"""

# ╔═╡ 4092509a-aeb6-4741-859a-5ded8938a961
q2test = [rand(1:30, 30) for _=1:10]; target = 3

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

# ╔═╡ 5c5b8963-1bfb-4d65-b84d-a840d38e4c28
md"""
---
---
"""

# ╔═╡ 12fd95fc-ee7c-4076-bdaa-4e4a5c67ba8b
begin
	function iqded(v, q)
		t = zeros(Int64, length(v))
	
		if q <= 0 || length(v) == 0
			return t
		end
	
		#println("$v $q")
		
		c1 = begin
			t[begin] = 1
			if v[begin] > q
				iqded(v[begin+1:end], q-1)
			else
				iqded(v[begin+1:end], q)
			end
		end
	
		c2 = begin
			t[begin] = 0
			iqded(v[begin+1:end], q)
		end
		
		return sum(c1)+1 > sum(c2) ? [1;c1] : [0;c2]
	end
	
	iqded(rand(1:5,20), 3)
end

# ╔═╡ 64c0f682-15b1-4112-92d7-2ca30d270bb2
md"""
---
---
"""

# ╔═╡ 78faf3db-b26d-4aa2-84a5-ab82be7d2dcd
begin
	function ltower(v)
		c = sort(unique(v))
		h = zeros(Int64, length(v))
		for i in 1:length(c)
			h[c[i]] = sum(c[i] .== v)
		end
		return h
	end
	
	let N = 10_000
		ltower(rand(1:1000, N))
	end
end

# ╔═╡ cbb3574a-1063-4296-af2f-780511933ffd
md"""
---
---
"""

# ╔═╡ 970bf15a-544d-4ad8-be02-c9f1f7528867
begin
	function cewlbld(v)
		n = length(v)
		if n%2 == 0
			cost1, cost2 = 0, 0;
			
			for i in 2:2:n-1
				addedfloor = max(v[i-1],v[i+1]) - v[i]
				if addedfloor > 0
					cost1 += addedfloor
				end
			end
			
			for i in 3:2:n-1
				addedfloor = max(v[i-1],v[i+1]) - v[i]
				if addedfloor > 0
					cost2 += addedfloor
				end
			end
			cost = min(cost1,cost2)
			
		else
			cost = 0
			for i in 2:2:n-1
				addedfloor = max(v[i-1],v[i+1]) - v[i]
				if addedfloor > 0
					cost += addedfloor
				end
			end
		end
		return cost
	end
	cewlbld([1 10 11 1 10 11 10 1])
end

# ╔═╡ 65cf904a-5f81-42b2-b9fd-769a92bf350e
md"""
---
---
"""

# ╔═╡ d1ec8bc8-8361-46e9-872d-1ef1ce5f1828
begin
	function shortestsalepath(v::Array)
		xmax = maximum(v[:,1])
		xmin = minimum(v[:,1])
		ymax = maximum(v[:,2])
		ymin = minimum(v[:,2])
		
		return 2*reduce(+, map(abs, [xmax,xmin,ymax,ymin]))
	end
	ssptest = [0 2
			  -3 0
			   0 -1]
	shortestsalepath(ssptest)
end

# ╔═╡ 9d62d103-10bb-43a6-9188-133a20636470
md"""
---
---
"""

# ╔═╡ 2cb755ea-9359-4c74-bea5-9994e0e1c80c


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
# ╠═547209dd-d54a-4deb-b5bd-486661766a3b
# ╠═9f4738ac-0c5c-4603-87c9-4311fdeadaa5
# ╠═ca854b32-11b5-488a-8c3c-51d6bce90dcb
# ╟─23752765-d5cf-4cf5-84c9-bdb6ae284599
# ╠═4092509a-aeb6-4741-859a-5ded8938a961
# ╠═a86e52d4-066a-4dd1-9a64-da9c70b4e675
# ╠═77260d30-9beb-4cce-8d8c-05149933077e
# ╟─5c5b8963-1bfb-4d65-b84d-a840d38e4c28
# ╠═12fd95fc-ee7c-4076-bdaa-4e4a5c67ba8b
# ╟─64c0f682-15b1-4112-92d7-2ca30d270bb2
# ╠═78faf3db-b26d-4aa2-84a5-ab82be7d2dcd
# ╟─cbb3574a-1063-4296-af2f-780511933ffd
# ╠═970bf15a-544d-4ad8-be02-c9f1f7528867
# ╟─65cf904a-5f81-42b2-b9fd-769a92bf350e
# ╠═d1ec8bc8-8361-46e9-872d-1ef1ce5f1828
# ╟─9d62d103-10bb-43a6-9188-133a20636470
# ╠═2cb755ea-9359-4c74-bea5-9994e0e1c80c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

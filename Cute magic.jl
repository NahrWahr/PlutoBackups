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

# ╔═╡ d9833230-4d7f-483a-9693-e13d0bc372de
begin
	function optred(v::Vector)
		for i in 2:length(v) #range(1, len(v))
			if v[i-1] > v[i]
				return false
			end
		end
		return true
	end
	v = [collect(1:10000); 1]#; 100]
	optred(v)
end

# ╔═╡ 9076d9bd-b5a2-4ef4-8a72-4ee914a46bf9
md"""
---
---
"""

# ╔═╡ aaad674f-233a-4802-b57a-da6132b9fb44
md"""
A 0-indexed array a of size n is called good if for all valid indices i (0≤i≤n−1), ai+i is a perfect square†

.

Given an integer n
. Find a permutation‡ p of [0,1,2,…,n−1]

that is good or determine that no such permutation exists.

†
An integer x is said to be a perfect square if there exists an integer y such that x=y2

.

‡
An array b is a permutation of an array a if b consists of the elements of a in arbitrary order. For example, [4,2,3,4] is a permutation of [3,2,4,4] while [1,2,2] is not a permutation of [1,2,3]

.
Input

The first line contains a single integer t
(1≤t≤104

) — the number of test cases.

The only line of each test case contains a single integer n
(1≤n≤105) — the length of the permutation p

.

It is guaranteed that the sum of n
over all test cases does not exceed 105

.
Output

For each test case, output n
distinct integers p0,p1,…,pn−1 (0≤pi≤n−1) — the permutation p — if the answer exists, and −1 otherwise.
"""

# ╔═╡ 441a45bf-b2ab-421f-9e40-ff6aeac75c99
function goodarray(n)
	for i = 0:n-1
		p = floor(Int, √(i))
		qpossible = Vector{Int}(undef,0)
		
		for q = 0:n-1
			r² = (p + q)^2
			if (r² - i >= 0 && r² - i < n-1)
				push!(qpossible, r² - i)
			end
		end
		println("$i $qpossible")
	end
end

# ╔═╡ 2adeb08d-0a36-4af0-9aa4-b99abd6258c4
goodarray(17)

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
# ╠═d9833230-4d7f-483a-9693-e13d0bc372de
# ╟─9076d9bd-b5a2-4ef4-8a72-4ee914a46bf9
# ╟─aaad674f-233a-4802-b57a-da6132b9fb44
# ╠═441a45bf-b2ab-421f-9e40-ff6aeac75c99
# ╠═2adeb08d-0a36-4af0-9aa4-b99abd6258c4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

### A Pluto.jl notebook ###
# v0.19.12

using Markdown
using InteractiveUtils

# ╔═╡ 6729b23e-b7d9-48d0-af16-6e4e74c15651
md"""
---
---
---
"""

# ╔═╡ 35796b75-8693-46e4-9303-7e05c851a8d7
v = [12,3,53,4,2,1,25,3]

# ╔═╡ 35002d79-b3a8-49fb-9a63-d0fe74dbfdb9
function twoSum(x,t)
	
	sort!(x)
	
	n = length(x)
	l = 1
	r = n
	while (l < r)
		s = x[l]+x[r]
		if (s==t)
			return [l,r]
			
		elseif (s<t)
			l+=1
			
		else (s>t)
			r-=1		
		end
	end

	return [-1,-1];
end

# ╔═╡ cfb459ac-4a1f-4bf5-9a33-8bfba297461e
function twoSumOptim(x::Vector{Int64},t::Int64)::Tuple{Int64,Int64}
	
	sort!(x)
	
	n = length(x)
	l = 1
	r = n
	while (l < r)
		@inbounds s = x[l]+x[r]
		if (s==t)
			return (l,r);
			
		elseif (s<t)
			l+=1;
			
		else (s>t)
			r-=1;	
		end
	end

	return (-1,-1);
end

# ╔═╡ be07d64b-c05e-4ab1-8bcb-651dd14d35ef
@code_llvm twoSumOptim(rand(1:1000,10000), rand(1000:2000))

# ╔═╡ f0f74d3b-c853-48a6-8ea5-c5a474cb8b0c
@code_llvm twoSum(rand(1:1000,10000), rand(1000:2000))

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
# ╟─6729b23e-b7d9-48d0-af16-6e4e74c15651
# ╠═35796b75-8693-46e4-9303-7e05c851a8d7
# ╠═35002d79-b3a8-49fb-9a63-d0fe74dbfdb9
# ╠═cfb459ac-4a1f-4bf5-9a33-8bfba297461e
# ╠═be07d64b-c05e-4ab1-8bcb-651dd14d35ef
# ╠═f0f74d3b-c853-48a6-8ea5-c5a474cb8b0c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

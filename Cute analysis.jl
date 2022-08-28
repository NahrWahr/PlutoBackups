### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# ╔═╡ c51838a6-10d5-11ed-1962-b963fd023b6d
x, y = (rand(1:100, 50),rand(1:100, 50))

# ╔═╡ 47291fa6-70a8-4321-b06a-0f3f34becb43
map(sort, [x,y])

# ╔═╡ cc96fa9d-33df-46bc-9286-ef157e655dce
function median(v::Vector)
	v = sort(v)
	n = length(v)
	if n%2==0
		return v[n÷2]
	else
		return (v[n÷2]+v[n÷2+1])/2
	end
end

# ╔═╡ 4552ff3a-c7cf-4d13-bb65-565a92a7cb0d
let x=rand(41)
	median(x), x
end

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
# ╠═c51838a6-10d5-11ed-1962-b963fd023b6d
# ╠═47291fa6-70a8-4321-b06a-0f3f34becb43
# ╠═cc96fa9d-33df-46bc-9286-ef157e655dce
# ╠═4552ff3a-c7cf-4d13-bb65-565a92a7cb0d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

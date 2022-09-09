using DynamicalSystems
using ForwardDiff
using Roots
using QuadGK
using Plots

function GravEV(u, p, t)

    function H(x)
        # v[1:3] :: Position Vector
        # v[4:6] :: Momentum Vector

        function Ωalt(x)
            # if |(x[1]>1, x[2]>1, x[3]>1)
	    #     return 1000*(12/x[1]+15/x[2]+18/x[3]);
            # else
	    #     Inf
            # end
            return 1000*(12/x[1]+15/x[2]+18/x[3]);
        end

        Pot = Ωalt(x[1:3]);
        KE = 0.5*x[4:6]'x[4:6];
        return Pot + KE;
    end

    dH(x) = ForwardDiff.gradient(H, x)

    
    x = reverse(dH(u))
    return SVector{6}(x);
end

xinit=[15.0, 12.0, 9.0, 0, 0, 1]
ds = ContinuousDynamicalSystem(GravEV, xinit, [])
tr=trajectory(ds, 10.0);
plot(tr[:,1],tr[:,2],tr[:,3])

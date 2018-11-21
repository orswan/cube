# cube.jl

module cube
using Statistics
using Plots
using StatPlots
using Distributions

function getpts(n,m)
	# n is the dimension of the hypercube
	# m is the number of points
	dat = []
	for i=1:m
		v = rand(Float64,n)
		push!(dat,sqrt(sum(v.^2)))
	end
	return dat
end

function mc(n,m)
	pts = getpts(n,m)
	return mean(pts),std(pts)
end


function showhist(n,m)
	pts = getpts(n,m)
	av, stdev = mean(pts),std(pts)
	
	density(pts)
	x=[0:.01:sqrt(n);]
	plot!(x,1/sqrt(2*pi*stdev^2) * exp.(-(x .- av).^2 / (2 * stdev^2)),title="n=$n")
end

#----------------- Normal -----------------

function getn(n,m)
	# n is the dimension of the hypercube
	# m is the number of points
	d = Truncated(Normal(), 0, 1)
	dat = []
	for i=1:m
		v = rand(d,n)
		push!(dat,sqrt(sum(v.^2)))
	end
	return dat
end

function nc(n,m)
	pts = getn(n,m)
	return mean(pts),std(pts)
end


function shown(n,m)
	pts = getn(n,m)
	av, stdev = mean(pts),std(pts)
	
	density(pts)
	x=[0:.01:sqrt(n);]
	plot!(x,1/sqrt(2*pi*stdev^2) * exp.(-(x .- av).^2 / (2 * stdev^2)),title="n=$n")
end











end
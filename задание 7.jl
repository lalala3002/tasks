include("функция к 7.jl")
function drawPerim(r)
    listOfShags = []
    while !isborder(r, West) || !isborder(r, Sud)
        push!(listOfShags, goToSide!(r, West, save = true))
        push!(listOfShags, goToSide!(r, Sud, save = true))
    end
    for side = (Nord, Ost, Sud, West)
        goToSide!(r, side, mark = true)
    end
    goToStart!(r, listOfShags)
end
module GLWindow
using ModernGL, GLUtil, Events
export glDisplay, glRemove, createWindow


global const RENDER_DICT = Dict{Symbol, Any}()


function renderLoop()
    for elem in RENDER_DICT
        if isa(elem[2], Tuple)
            if isa(elem[2][1], Function)
                elem[2][1](elem[2][2:end]...)
            else
        	   render(elem[2]...)
            end
        else
            render(elem[2]...)
        end
    end
end

function glDisplay(id::Symbol, x...) 
    RENDER_DICT[id] = x
    nothing
end
function glRemove(id::Symbol)
    delete!(RENDER_DICT, id)
    nothing
end

include("reactglfw.jl")


end

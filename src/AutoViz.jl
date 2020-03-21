__precompile__(true)

module AutoViz

using Reexport
using Parameters
using StaticArrays
using AutomotiveDrivingModels
using Printf
using Rsvg

@reexport using Colors
using Cairo

const DEFAULT_CANVAS_WIDTH = 1000
const DEFAULT_CANVAS_HEIGHT = 600
export DEFAULT_CANVAS_WIDTH, DEFAULT_CANVAS_HEIGHT

global rendermode = :basic # :fancy

function set_render_mode(m::Symbol)
    global rendermode
    rendermode = m
end

include("colorscheme.jl")
export
    COLOR_ASPHALT,
    COLOR_LANE_MARKINGS_WHITE,
    COLOR_LANE_MARKINGS_YELLOW,
    COLOR_CAR_EGO,
    COLOR_CAR_OTHER,
    MONOKAY,
    OFFICETHEME,
    LIGHTTHEME,
    set_color_theme,
    get_pastel_car_colors,
    id_to_color

# Cameras
include("cameras.jl")
export
    CameraState,
    Camera,
    update_camera!,
    StaticCamera,
    TargetFollowCamera,
    ZoomingCamera,
    ComposedCamera,
    SceneFollowCamera,
    set_camera!,
    camera_move!,
    camera_move_pix!,
    camera_rotate!,
    camera_zoom!,
    reset_camera!


include("rendermodels.jl")
export
        RenderModel,
        render_to_canvas,
        add_instruction!,
        reset_instructions!,
        set_background_color!

# Cairo drawing utilities
include("render_instructions.jl")
export
        render_paint,
        render_text,
        render_circle,
        render_arc,
        render_rect,
        render_round_rect,
        render_car,
        render_vehicle,
        render_point_trail,
        render_line,
        render_closed_line,
        render_fill_region,
        render_line_segment,
        render_dashed_line,
        render_arrow,
        render_colormesh,
        grayscale_transform,
        render_fancy_car,
        render_fancy_pedestrian

include("fancy_render.jl")

# renderable interface
include("renderable.jl")

export
    Renderable,
    render,
    render!,
    add_renderable!,
    isrenderable,
    ArrowCar,
    EntityRectangle,
    VelocityArrow,
    FancyCar,
    FancyPedestrian


# Overlays
include("overlays.jl")
export  TextOverlay,
        Overwash,
        NeighborsOverlay,
        CarFollowingStatsOverlay,
        MarkerDistOverlay,
        HistogramOverlay,
        IDOverlay,
        TextParams,
        drawtext,
        LineToCenterlineOverlay,
        LineToFrontOverlay,
        BlinkerOverlay

# Convenient implementation for roadway and vehicle rendering
include("roadways.jl")

# old render methods that should be removed in future versions
include("deprecated.jl")
export render, render!

end # module

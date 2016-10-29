p = Beta[a + x, b + n - x]/Beta[a, b]

p /. {x -> 4, n -> 9}

ml = p /. {x -> 3, n -> 500}

ContourPlot[Beta[4 + a, 5 + b]/Beta[a, b], {a, 0, 80}, {b, 0, 80}]

ContourPlot[Beta[3 + a, 497 + b]/Beta[a, b], {a, 0, 4}, {b, 0, 800}]

ContourPlot[Beta[3 + a, 497 + b]/Beta[a, b], {a, 0, 8}, {b, 0, 1600}, 
 PlotLegends -> Automatic, 
 FrameLabel -> {{HoldForm[b], None}, {HoldForm[a], None}}, 
 ImageSize -> Large, LabelStyle -> {18, GrayLevel[0]}]




p = Beta[a + x, b + n - x]/Beta[a, b]



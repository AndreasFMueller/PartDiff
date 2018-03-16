g[x_] := 1/4 Exp[-32 (x - 1/2)^2]

graphic = ParametricPlot3D[{ t g[x0] + x0, t, g[
    x0]}, {x0, 0, 1}, {t, 0, 1.5}, PlotPoints -> {50, 50}]

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > welle.eps", graphic]


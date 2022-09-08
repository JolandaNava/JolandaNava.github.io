module Illustrations exposing (..)

import Svg exposing (Svg, svg, path, g, defs, text, node)
import Svg.Attributes exposing (class, id, d, viewBox, height, preserveAspectRatio, style, width, transform, markerHeight, refX, refY, markerWidth, orient, markerEnd, markerUnits, points)

openBook : Svg msg
openBook =
    svg [ class "smart-selection", height "100%", preserveAspectRatio "none", style "--color-cd0102e9-80c4-4d80-8d48-c650392b1234:black; --5fdc1130:10px;", viewBox "0 0 492.38323974609375 186.06564331054688", width "100%" ]
        [ path [ d "m 0,0 c 9.105,1.216 18.363,4.66 28.164,8.307 7.906,2.94 16.082,5.982 24.885,8.142 0.545,0.134 0.899,0.658 0.819,1.213 -0.078,0.538 -0.539,0.935 -1.078,0.935 -0.017,0 -0.033,0 -0.05,-0.001 C 31.704,17.642 8.96,12.721 2.219,11.168 c 1.12,2.382 3.066,6.506 4.869,10.318 5.695,0.769 15.312,2.127 29.275,4.289 15.43,2.395 26.462,1.37 32.998,0.091 0.494,-0.095 0.971,0.225 1.067,0.715 0.096,0.494 -0.224,0.971 -0.719,1.067 -6.682,1.31 -17.935,2.354 -33.625,-0.078 -13.027,-2.016 -22.273,-3.332 -28.067,-4.122 0.372,0.785 0.73,1.542 1.063,2.244 1.17,2.478 3.49,4.17 6.204,4.527 9.085,1.184 40.014,4.785 56.589,1.418 C 87.724,28.415 94.928,15.036 96.897,10.641 95.833,10.522 94.772,10.292 93.721,9.947 90.909,9.018 88.156,7.281 85.551,4.781 85.34,4.886 85.129,4.978 84.923,5.061 83.787,5.519 81.892,6.274 36.936,1.95 21.746,0.495 6.658,-1.072 -1.248,-1.897 v 0.47 c 0,0.729 0.525,1.328 1.248,1.427 m 36.503,41.203 c 0.006,0.002 0.011,0.004 0.016,0.006 3.197,1.145 7.634,2.721 13.565,4.805 15.59,5.472 32.705,1.63 39.812,-8.941 4.906,-7.286 6.596,-16.24 7.182,-21.483 10e-4,-0.005 10e-4,-0.01 0.002,-0.015 -4.214,8.594 -14.37,20.696 -31.501,24.421 -9.329,2.03 -19.911,1.968 -29.076,1.207 M 98.718,-2.482 h -0.179 c -4.044,0.063 -6.535,2.215 -8.935,4.299 -0.692,0.601 -1.365,1.182 -2.052,1.7 2.802,2.579 6.563,4.927 10.955,4.927 h 0.032 c 2.235,-0.004 4.47,-0.608 6.646,-1.799 1.515,-0.82 3.013,-1.928 4.479,-3.302 -0.609,-0.472 -1.205,-0.994 -1.823,-1.526 -2.442,-2.115 -4.965,-4.299 -9.123,-4.299 m 26.422,34.119 c 16.571,3.369 47.506,-0.234 56.592,-1.418 2.713,-0.353 5.033,-2.046 6.205,-4.534 0.324,-0.678 0.672,-1.414 1.037,-2.185 -5.815,0.796 -14.941,2.097 -27.686,4.07 -15.69,2.432 -26.943,1.388 -33.626,0.078 -0.494,-0.096 -0.814,-0.573 -0.719,-1.067 0.097,-0.49 0.573,-0.81 1.068,-0.715 6.535,1.279 17.568,2.304 32.998,-0.091 13.658,-2.115 23.157,-3.461 28.896,-4.238 l 0.228,-0.482 c 1.735,-3.668 3.581,-7.573 4.663,-9.883 -5.307,1.223 -23.136,5.12 -41.486,6.799 -3.265,0.297 -6.22,0.501 -9.036,0.625 l -0.307,-2.147 c 2.715,-0.667 5.524,-1.455 8.353,-2.345 5.725,-1.783 11.222,-3.827 16.537,-5.803 9.799,-3.644 19.055,-7.085 28.161,-8.301 0.722,-0.097 1.247,-0.696 1.247,-1.427 v -0.428 c -8.014,0.841 -22.836,2.376 -37.76,3.805 -44.956,4.324 -46.857,3.569 -47.975,3.119 -0.315,-0.124 -0.622,-0.27 -0.92,-0.43 -1.722,1.685 -3.508,3.032 -5.326,4.016 -0.985,0.541 -1.983,0.971 -2.986,1.301 -1.054,0.346 -2.119,0.572 -3.186,0.687 0.034,0.075 0.07,0.153 0.109,0.237 0.785,1.746 2.55,5.217 5.537,8.854 5.236,6.351 11.758,10.355 19.382,11.903 m 79.213,-34.133 c -0.057,0.004 -1.472,0.155 -3.91,0.412 v 0.657 c 0,1.808 -1.349,3.349 -3.138,3.586 -8.863,1.184 -18.006,4.584 -27.688,8.184 -1.245,0.463 -2.501,0.929 -3.766,1.395 17.017,-5.329 29.072,-6.81 29.19,-6.824 0.037,-0.005 0.074,-0.01 0.11,-0.01 0.453,0 0.848,0.339 0.903,0.802 0.059,0.499 -0.298,0.952 -0.797,1.012 -0.119,0.013 -12.196,1.503 -29.238,6.875 -1.432,0.45 -2.856,0.868 -4.271,1.261 15.113,-1.914 28.48,-4.862 32.731,-5.845 0.786,-0.182 1.59,0.095 2.097,0.722 0.509,0.629 0.611,1.475 0.268,2.207 -1.072,2.289 -2.964,6.291 -4.741,10.048 l -0.239,0.504 c -0.209,0.445 -0.416,0.883 -0.617,1.299 -0.474,1.004 -0.928,1.964 -1.341,2.829 -1.489,3.159 -4.439,5.313 -7.892,5.761 -9.171,1.196 -40.408,4.83 -57.308,1.393 -4.264,-0.865 -8.196,-2.456 -11.779,-4.739 4.877,4.042 11.14,7.5 18.898,9.186 21.823,4.749 50.791,-2.198 51.084,-2.268 0.486,-0.119 0.976,0.179 1.095,0.669 0.119,0.485 -0.179,0.981 -0.664,1.1 -0.298,0.068 -29.664,7.112 -51.903,2.275 -17.34,-3.769 -27.538,-16.127 -31.657,-24.735 0.012,0.143 0.023,0.29 0.033,0.442 3.06,17.665 14.297,30.372 33.464,37.795 15.622,6.055 30.923,6.128 31.079,6.128 0.499,0 0.908,0.407 0.908,0.911 0,0.499 -0.409,0.907 -0.908,0.907 -0.156,0 -15.754,-0.069 -31.688,-6.228 -16.836,-6.512 -27.993,-17.424 -32.812,-31.918 -0.219,4.146 -0.872,9.13 -2.42,14.404 -2.33,7.936 -6.212,14.844 -11.54,20.535 -6.651,7.105 -15.573,12.306 -26.518,15.461 -0.481,0.138 -0.984,-0.138 -1.123,-0.621 -0.139,-0.481 0.139,-0.984 0.62,-1.124 19.267,-5.553 31.648,-17.227 36.8,-34.698 1.781,-6.042 2.341,-11.769 2.426,-16.197 C 97.086,26.194 95.143,32.54 91.408,38.09 83.852,49.324 65.825,53.465 49.484,47.727 34.843,42.583 29.314,40.54 28.935,40.398 28.932,40.396 28.93,40.396 28.928,40.396 20.061,39.249 13.813,37.751 13.679,37.718 c -0.488,-0.119 -0.787,-0.611 -0.668,-1.099 0.119,-0.487 0.608,-0.786 1.098,-0.668 0.29,0.07 29.26,7.016 51.083,2.269 7.825,-1.702 14.128,-5.206 19.024,-9.293 -3.284,2.116 -7.232,3.894 -11.909,4.845 C 55.4,37.208 24.171,33.574 15.002,32.379 11.548,31.926 8.598,29.774 7.11,26.624 4.931,22.027 1.704,15.195 0.175,11.942 -0.171,11.212 -0.071,10.367 0.434,9.738 0.938,9.106 1.743,8.825 2.537,9.006 6.982,10.032 19.092,12.687 33.043,14.563 32.334,14.352 31.624,14.141 30.91,13.916 13.866,8.54 1.788,7.055 1.668,7.04 1.17,6.98 0.813,6.528 0.873,6.029 c 0.056,-0.462 0.448,-0.8 0.902,-0.8 0.037,0 0.073,0.001 0.11,0.005 0.121,0.015 12.352,1.517 29.572,6.947 1.638,0.516 3.264,0.988 4.877,1.425 C 33.31,12.538 30.335,11.438 27.404,10.348 17.722,6.746 8.575,3.343 -0.291,2.159 -2.079,1.916 -3.427,0.375 -3.427,-1.427 v -0.7 c -2.175,-0.231 -3.429,-0.365 -3.481,-0.369 -1.502,-0.165 -2.583,-1.512 -2.423,-3.01 0.152,-1.396 1.333,-2.436 2.712,-2.436 0.096,0 0.192,0.009 0.288,0.018 31.995,3.426 84.233,8.556 89.381,7.86 0.11,-0.055 0.229,-0.12 0.362,-0.198 0.778,-0.453 1.672,-1.222 2.615,-2.042 2.716,-2.354 6.43,-5.574 12.512,-5.633 0.06,-0.005 0.119,-0.005 0.179,-0.005 6.196,0 9.957,3.261 12.695,5.638 0.943,0.82 1.837,1.589 2.643,2.056 0.114,0.073 0.224,0.129 0.334,0.184 5.138,0.7 57.381,-4.434 89.381,-7.86 0.096,-0.009 0.197,-0.018 0.292,-0.018 1.379,0 2.561,1.04 2.708,2.436 0.165,1.498 -0.921,2.845 -2.418,3.01", id "svgjspath1212xoc0qguj", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-cd0102e9-80c4-4d80-8d48-c650392b1234);", transform "matrix(2.2781357365208645,0,0,-2.2781357365208645,21.293014862082828,167.9726735113441)" ]
            []
        , path [ d "M 0,0 C 0.233,0 0.468,0.09 0.645,0.269 7.528,7.19 26.934,2.488 27.129,2.44 27.614,2.319 28.109,2.617 28.23,3.104 28.351,3.592 28.054,4.085 27.566,4.205 26.728,4.413 6.962,9.201 -0.645,1.551 -0.999,1.194 -0.997,0.619 -0.641,0.265 -0.464,0.089 -0.231,0 0,0", id "svgjspath1210wjaphe0e", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-cd0102e9-80c4-4d80-8d48-c650392b1234);", transform "matrix(2.2781357365208645,0,0,-2.2781357365208645,276.375161271886,149.4694242518379)" ]
            []
        , path [ d "m 0,0 c 0.195,0.048 19.601,4.75 26.483,-2.172 0.178,-0.179 0.412,-0.268 0.645,-0.268 0.232,0 0.464,0.088 0.642,0.264 0.355,0.355 0.357,0.93 0.002,1.286 C 20.167,6.761 0.4,1.973 -0.437,1.765 -0.925,1.645 -1.222,1.151 -1.102,0.664 -0.98,0.177 -0.486,-0.121 0,0", id "svgjspath120831l4mv82", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-cd0102e9-80c4-4d80-8d48-c650392b1234);", transform "matrix(2.2781357365208645,0,0,-2.2781357365208645,154.0477537103617,143.90989812168192)" ]
            []
        , g []
            [ defs []
                []
            ]
        ]

bookStack : Svg msg
bookStack =
    svg [ class "smart-selection", height "100%", preserveAspectRatio "none", style "--color-0ef7fb78-56e4-4331-82e3-dc88e05f5763:black; --5fdc1130:10px;", viewBox "0 0 303.4617004394531 218.98179626464844", width "100%" ]
    [ path [ d "m 0,0 c 0,-0.007 -0.001,-0.013 -0.001,-0.02 h -33.353 c -0.439,0 -0.793,-0.355 -0.793,-0.792 0,-0.438 0.354,-0.793 0.793,-0.793 h 33.242 c -0.09,-1.447 -0.143,-3.034 -0.157,-4.713 h -54.13 c -1.363,0 -1.72,-0.353 -1.72,-0.792 0,-0.435 0.357,-0.793 0.792,-0.793 h 55.058 c 0.009,-1.65 0.056,-3.229 0.139,-4.703 h -12.889 c -0.439,0 -0.792,-0.357 -0.792,-0.792 0,-0.44 0.353,-0.793 0.792,-0.793 h 12.998 c 0.001,-0.007 0.001,-0.014 0.002,-0.021 0.127,-1.618 0.301,-3.108 0.516,-4.439 h -109.699 c -1.228,0 -2.438,-0.199 -3.6,-0.579 -0.723,1.887 -1.622,5.552 -1.622,12.121 0,6.553 0.903,10.228 1.626,12.122 1.16,-0.38 2.37,-0.577 3.596,-0.577 H 0.542 C 0.317,3.106 0.135,1.617 0,0 m -126.413,2.192 c 0.34,1.497 0.758,2.771 1.24,3.786 0.181,0.379 0.372,0.715 0.569,1.012 0.408,0.334 1.079,0.683 2.327,0.683 3.718,0 5.917,-0.851 7.103,-1.566 0.148,-0.087 0.297,-0.171 0.446,-0.253 -0.854,-2.183 -1.796,-6.136 -1.796,-12.963 0,-6.813 0.952,-10.775 1.801,-12.954 -0.151,-0.082 -0.301,-0.167 -0.451,-0.256 -1.186,-0.714 -3.385,-1.566 -7.103,-1.566 -1.498,0 -2.171,0.504 -2.547,0.879 -1.965,1.984 -1.923,7.282 -1.887,11.958 0.005,0.655 0.014,1.301 0.014,1.938 v 0.004 c 0,0.637 -0.009,1.287 -0.014,1.942 -0.016,2.246 -0.035,4.64 0.167,6.737 0.043,0.208 0.085,0.418 0.131,0.619 m -5.052,-11.203 c -0.046,-5.881 -0.096,-11.958 3.266,-15.343 1.507,-1.52 3.499,-2.29 5.922,-2.29 4.813,0 7.854,1.228 9.557,2.254 1.068,0.645 2.286,0.985 3.518,0.985 H 6.467 c 1.314,0 2.377,1.062 2.377,2.377 0,1.314 -1.063,2.377 -2.377,2.377 H 2.704 c -0.01,0.06 -0.02,0.118 -0.031,0.178 -0.217,1.314 -0.392,2.805 -0.52,4.44 -0.041,0.468 -0.072,0.954 -0.103,1.457 -0.084,1.472 -0.131,3.063 -0.141,4.748 -0.004,0.194 -0.004,0.387 -0.004,0.585 v 0.133 c 0,0.245 0,0.489 0.004,0.738 0.014,1.699 0.068,3.29 0.159,4.741 0.024,0.45 0.057,0.908 0.103,1.447 0.136,1.63 0.32,3.122 0.548,4.435 0.01,0.063 0.021,0.123 0.033,0.185 h 3.715 c 1.314,0 2.377,1.066 2.377,2.381 0,1.314 -1.063,2.377 -2.377,2.377 h -115.669 c -1.232,0 -2.45,0.339 -3.518,0.985 -1.703,1.026 -4.744,2.253 -9.557,2.253 -2.423,0 -4.415,-0.769 -5.922,-2.29 -3.362,-3.385 -3.312,-9.462 -3.266,-15.343 0.005,-0.641 0.01,-1.278 0.01,-1.905 V -7.11 c 0,-0.628 -0.005,-1.26 -0.01,-1.901", id "svgjspath1196vg8irst5", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-0ef7fb78-56e4-4331-82e3-dc88e05f5763);", transform "matrix(1.9702399184827988,0,0,-1.9702399184827988,272.53834730246604,95.49085530852585)" ]
        []
    , path [ d "m 0,0 h 23.611 c 0.358,0 0.647,0.29 0.647,0.647 0,0.357 -0.289,0.647 -0.647,0.647 H 0 c -0.357,0 -0.647,-0.29 -0.647,-0.647 C -0.647,0.29 -0.357,0 0,0", id "svgjspath1194dgz2nhb7", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-0ef7fb78-56e4-4331-82e3-dc88e05f5763);", transform "matrix(1.9702399184827988,0,0,-1.9702399184827988,64.21049134880525,123.16463923466074)" ]
        []
    , path [ d "m 0,0 c 0.002,0.027 0.004,0.056 0.006,0.083 h 13.172 c 0.439,0 0.792,0.353 0.792,0.792 0,0.435 -0.353,0.792 -0.792,0.792 H 0.114 c 0.087,1.45 0.136,3.031 0.15,4.704 h 55.222 c 0.436,0 0.792,0.357 0.792,0.792 0,0.44 -0.356,0.793 -1.718,0.793 H 0.263 C 0.251,9.611 0.2,11.184 0.113,12.668 h 33.401 c 0.438,0 0.793,0.355 0.793,0.793 0,0.438 -0.355,0.793 -0.793,0.793 H 0.002 c -0.13,1.603 -0.306,3.094 -0.531,4.456 h 123.425 c 1.225,0 2.439,0.198 3.6,0.582 0.724,-1.888 1.622,-5.553 1.622,-12.121 0,-6.557 -0.904,-10.232 -1.627,-12.125 -1.157,0.379 -2.37,0.577 -3.595,0.577 H -0.528 C -0.306,-3.016 -0.128,-1.547 0,0 m 140.404,5.227 c 0.036,-4.676 0.077,-9.979 -1.887,-11.958 -0.375,-0.375 -1.049,-0.879 -2.546,-0.879 -3.719,0 -5.913,0.852 -7.099,1.566 -0.149,0.088 -0.3,0.168 -0.45,0.25 0.854,2.182 1.797,6.135 1.797,12.965 0,6.813 -0.952,10.774 -1.802,12.954 0.152,0.083 0.305,0.163 0.455,0.252 1.186,0.719 3.38,1.571 7.099,1.571 1.497,0 2.171,-0.504 2.546,-0.884 1.964,-1.978 1.923,-7.277 1.887,-11.953 -0.005,-0.655 -0.009,-1.305 -0.009,-1.942 V 6.977 c 0,-0.573 0.004,-1.159 0.009,-1.75 m 4.744,1.75 v 0.192 c 0,0.623 0.005,1.264 0.014,1.905 0.046,5.876 0.092,11.958 -3.269,15.343 -1.502,1.516 -3.499,2.285 -5.922,2.285 -4.814,0 -7.855,-1.223 -9.559,-2.248 -1.066,-0.646 -2.28,-0.985 -3.516,-0.985 H -6.473 c -1.314,0 -2.377,-1.063 -2.377,-2.377 0,-1.315 1.063,-2.382 2.377,-2.382 h 3.736 c 0.01,-0.061 0.021,-0.12 0.032,-0.182 0.527,-3.115 0.795,-6.937 0.795,-11.359 V 6.979 C -1.914,5.099 -1.966,3.334 -2.064,1.732 -2.096,1.191 -2.132,0.673 -2.172,0.178 -2.3,-1.375 -2.479,-2.847 -2.706,-4.198 -2.716,-4.259 -2.727,-4.316 -2.737,-4.377 h -3.736 c -1.314,0 -2.377,-1.062 -2.377,-2.377 0,-1.314 1.063,-2.377 2.377,-2.377 h 129.369 c 1.236,0 2.45,-0.343 3.516,-0.984 1.704,-1.026 4.745,-2.254 9.559,-2.254 2.423,0 4.42,0.77 5.922,2.29 3.361,3.385 3.315,9.462 3.269,15.343 -0.009,0.577 -0.014,1.149 -0.014,1.713", id "svgjspath119246i6ass6", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-0ef7fb78-56e4-4331-82e3-dc88e05f5763);", transform "matrix(1.9702399184827988,0,0,-1.9702399184827988,17.436606279790226,194.6118755078752)" ]
        []
    , path [ d "m 0,0 h -34.898 c -0.323,0 -0.622,-0.22 -0.673,-0.539 -0.067,-0.405 0.245,-0.755 0.637,-0.755 H 0.312 C 0.961,-0.723 0.564,0 0,0", id "svgjspath1190mw0m0dai", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-0ef7fb78-56e4-4331-82e3-dc88e05f5763);", transform "matrix(1.9702399184827988,0,0,-1.9702399184827988,226.0779190775446,191.61412595127211)" ]
        []
    , path [ d "m 0,0 c 1.222,0 2.435,0.198 3.593,0.577 0.726,-1.897 1.63,-5.571 1.63,-12.126 0,-6.552 -0.905,-10.225 -1.627,-12.117 -1.158,0.382 -2.372,0.579 -3.596,0.579 h -89.891 c 0.218,1.331 0.395,2.797 0.524,4.371 0.027,0.327 0.053,0.667 0.077,1.013 h 13.291 c 0.439,0 0.792,0.353 0.792,0.792 0,0.436 -0.353,0.793 -0.792,0.793 h -13.2 c 0.057,1.232 0.091,2.492 0.096,3.754 0.005,0.227 0.005,0.458 0.005,0.69 v 0.128 c 0,0.046 -0.001,0.087 -0.001,0.131 h 55.409 c 0.435,0 0.792,0.358 0.792,0.793 0,0.439 -0.357,0.792 -0.792,0.792 h -55.422 c -0.02,1.308 -0.066,2.599 -0.138,3.848 -0.018,0.295 -0.037,0.583 -0.059,0.865 h 33.647 c 0.437,0 0.792,0.354 0.792,0.792 0,0.438 -0.355,0.793 -0.792,0.793 h -33.781 c -0.12,1.261 -0.27,2.445 -0.448,3.532 z m 5.972,1.667 c 1.186,0.714 3.384,1.566 7.103,1.566 1.498,0 2.171,-0.504 2.547,-0.879 1.965,-1.983 1.923,-7.282 1.887,-11.958 -0.005,-0.655 -0.014,-1.305 -0.014,-1.942 v -0.128 c 0,-0.596 0.009,-1.205 0.014,-1.814 0.036,-4.676 0.078,-9.975 -1.887,-11.953 -0.376,-0.38 -1.049,-0.884 -2.547,-0.884 -3.719,0 -5.917,0.852 -7.103,1.571 -0.146,0.087 -0.296,0.167 -0.446,0.248 0.855,2.183 1.797,6.134 1.797,12.957 0,6.819 -0.953,10.782 -1.803,12.963 0.151,0.083 0.302,0.164 0.452,0.253 M -91.28,-12.337 c -0.009,-1.58 -0.058,-3.143 -0.146,-4.646 -0.031,-0.54 -0.072,-1.059 -0.112,-1.554 -0.13,-1.583 -0.308,-3.053 -0.529,-4.371 -0.011,-0.061 -0.022,-0.119 -0.032,-0.179 h -3.735 c -1.314,0 -2.381,-1.067 -2.381,-2.382 0,-1.31 1.067,-2.377 2.381,-2.377 H 0 c 0.021,0 0.04,-0.002 0.061,-0.002 0.827,-0.133 1.571,-0.272 2.265,-0.413 0.412,-0.151 0.812,-0.34 1.192,-0.57 1.703,-1.025 4.744,-2.248 9.557,-2.248 2.423,0 4.415,0.769 5.922,2.285 3.361,3.385 3.312,9.467 3.266,15.343 -0.005,0.595 -0.009,1.195 -0.009,1.777 v 0.128 c 0,0.628 0.004,1.264 0.009,1.905 0.046,5.881 0.095,11.958 -3.266,15.343 -1.507,1.52 -3.499,2.29 -5.922,2.29 C 8.262,7.992 5.221,6.764 3.518,5.738 2.45,5.097 1.231,4.754 0,4.754 h -95.834 c -1.314,0 -2.381,-1.063 -2.381,-2.377 0,-1.315 1.067,-2.377 2.381,-2.377 h 3.735 c 0.01,-0.061 0.022,-0.119 0.032,-0.181 0.22,-1.313 0.398,-2.785 0.529,-4.374 0.04,-0.495 0.081,-1.013 0.112,-1.554 0.088,-1.503 0.137,-3.068 0.146,-4.662 0.004,-0.256 0.004,-0.511 0.004,-0.775 v -0.128 c 0,-0.218 0,-0.435 -0.004,-0.663", id "svgjspath1188fzv39huz", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-0ef7fb78-56e4-4331-82e3-dc88e05f5763);", transform "matrix(1.9702399184827988,0,0,-1.9702399184827988,226.54366246494124,15.746155721813835)" ]
        []
    , path [ d "m 0,0 h 23.611 c 0.358,0 0.648,0.29 0.648,0.647 0,0.357 -0.29,0.647 -0.648,0.647 H 0 c -0.356,0 -0.646,-0.29 -0.646,-0.647 C -0.646,0.29 -0.356,0 0,0", id "svgjspath1186l3so3e1e", style "fill-opacity: 1; fill-rule: nonzero; stroke: none; stroke-width: 1; fill: var(--color-0ef7fb78-56e4-4331-82e3-dc88e05f5763);", transform "matrix(1.9702399184827988,0,0,-1.9702399184827988,163.24377880607676,50.339834313285735)" ]
        []
    , g []
        [ defs []
            []
        ]
    ]

arrow : Svg msg
arrow =
    svg [ viewBox "0 0 800 800" ]
    [ defs []
        [ node "style" []
            [ text "path, polyline {            fill: none;            stroke: #231F20;            vector-effect: non-scaling-stroke;            stroke-width: 2;       }        path {            stroke-dasharray: 11, 5;         }    " ]
        , node "marker" [ id "pointer", markerHeight "8", markerUnits "userSpaceOnUse", markerWidth "10", orient "-45", refX "9.5", refY "5.1" ]
            [ node "polyline" [ points "1 1, 9 5, 1 7" ]
                []
            , text "    "
            ]
        ]
    , path [ d "M 0 600 Q 150 400 300 300 Q 550 150 800 350" ]  []
    , text ""
    ]
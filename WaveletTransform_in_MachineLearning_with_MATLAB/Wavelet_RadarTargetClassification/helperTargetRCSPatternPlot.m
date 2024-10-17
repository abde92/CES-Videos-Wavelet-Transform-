function helperTargetRCSPatternPlot(az,el,rcs)
% This function helperTargetRCSPatternPlot is only in support of
% TargetRCSExample. It may change in a future release.

% Copyright 2015 The MathWorks, Inc.

clf;
[az_grid,el_grid] = meshgrid(deg2rad(az),deg2rad(el));
rcsdb = pow2db(rcs);
% Define floor (dB)
minthresh = max(rcsdb(:))-100;
rcsdb(rcsdb<minthresh) = minthresh; % Replace -Inf with minthresh
r = rcsdb-minthresh;                % Radius must be positive
[x,y,z] = sph2cart(az_grid,el_grid,r);
surf(x,y,z,rcsdb,'EdgeColor','none');
axis off;
c = colorbar;
ylabel(c,'dBsm')


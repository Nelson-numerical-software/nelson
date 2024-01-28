%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% <--ADV-CLI MODE-->
%=============================================================================
f = figure();
surf(peaks);
colormap('sky');
r = f.Colormap;
assert_isapprox(r(1:2, :), [0.9000, 0.9447, 0.9741;0.8965, 0.9427, 0.9732], 1e-3); 
%=============================================================================
%=============================================================================
% Copyright (c) 2017 Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
% <-- Issue URL -->
% https://github.com/nelson-lang/nelson/issues/1210
% <-- Short Description -->
% Function "bode" did not unwrap phase
%=============================================================================
% <--ADV-CLI MODE-->
%=============================================================================
S = tf(1, [1 0.5 1]);
[magnitude, phase, w] = bode(S*S*S);
assert_isequal(size(phase), [1 1 1000])
assert_isapprox(phase(1:10), [-0.8595   -0.8675   -0.8755   -0.8836   -0.8918   -0.9001   -0.9084   -0.9168   -0.9253   -0.9339], 1e-4);
%=============================================================================
bode(S*S*S)
%=============================================================================
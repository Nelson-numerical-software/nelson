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
% https://github.com/nelson-lang/nelson/issues/36
% <-- Short Description -->
% datenum did not support some string format.
%=============================================================================
dv = datevec(datenum('10-Mar-2010 16:48:17'));
REF = [2010 3 10 16 48 17];
assert_isequal(dv, REF);
%=============================================================================
dv = datevec(datenum('Mar.10,2010'));
REF = [2010 3 10 0 0 0];
assert_isequal(dv, REF);
%=============================================================================
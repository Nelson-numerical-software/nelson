%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% SPDX-License-Identifier: LGPL-3.0-or-later
% LICENCE_BLOCK_END
%=============================================================================
function TF = isequal(T1, T2)
  st1 = struct(T1);
  st2 = struct(T2);
  TF = isequal(st1, st2);
end
%=============================================================================
%=============================================================================
% Copyright (c) 2016-present Allan CORNET (Nelson)
%=============================================================================
% This file is part of the Nelson.
%=============================================================================
% LICENCE_BLOCK_BEGIN
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% Alternatively, you can redistribute it and/or
% modify it under the terms of the GNU General Public License as
% published by the Free Software Foundation; either version 2 of
% the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public
% License along with this program. If not, see <http://www.gnu.org/licenses/>.
% LICENCE_BLOCK_END
%=============================================================================
assert_isequal(nargin('isinteger'), 1);
assert_isequal(nargout('isinteger'), 1);
%=============================================================================
A = 3;
res = isinteger(A);
assert_isfalse(res);
%=============================================================================
A = single([3, i]);
res = isinteger(A);
assert_isfalse(res);
%=============================================================================
B = int8(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
B = int16(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
B = int32(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
B = int64(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
B = uint8(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
B = uint16(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
B = uint32(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
B = uint64(3);
res = isinteger(B);
assert_istrue(res);
%=============================================================================
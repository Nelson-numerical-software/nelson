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
format('short')
%=============================================================================
A = complex(1.8e99, -eps);
R = evalc('A');
REF = '
A =

   1.8000e+99 - 2.2204e-16i

';
assert_isequal(R, REF)
%=============================================================================
A = complex(2, 3);
R = evalc('A');
REF = '
A =

   2.0000 + 3.0000i

';
assert_isequal(R, REF)
%=============================================================================
A = complex(1e2, pi);
R = evalc('A');
REF = '
A =

   1.0000e+02 + 3.1416e+00i

';
assert_isequal(R, REF)
%=============================================================================
A = complex(rand(2, 2), 1);
A(2, 2) = NaN;
R = evalc('A');
REF =    '
A =

   0.8147 + 1.0000i   0.1270 + 1.0000i
   0.9058 + 1.0000i      NaN + 0.0000i

';
assert_isequal(R, REF)
%=============================================================================
R = evalc('A = complex([6.5574e-04, 6.5574e-04], pi)');
REF = '
A =

   0.0007 + 3.1416i   0.0007 + 3.1416i

';
assert_isequal(R, REF)
%=============================================================================
R = evalc('A = complex(ones(2,2), pi*1e6)');
REF = '
A =

   1.0e+06 *

   0.0000 + 3.1416i   0.0000 + 3.1416i
   0.0000 + 3.1416i   0.0000 + 3.1416i

';
assert_isequal(R, REF)
%=============================================================================
R = evalc('A = complex(ones(2,2)*1000,pi*1e6)');
REF =     '
A =

   1.0e+06 *

   0.0010 + 3.1416i   0.0010 + 3.1416i
   0.0010 + 3.1416i   0.0010 + 3.1416i

';
assert_isequal(R, REF)
%=============================================================================
R = evalc('A = [0.3729   6.5574e-04    0.1393]+ eps * i');
REF = '
A =

   0.3729 + 0.0000i   0.0007 + 0.0000i   0.1393 + 0.0000i

';
assert_isequal(R, REF)
%=============================================================================
A = complex(eye(3,3)*pi,-Inf);
A(2,2) = pi*i;
R = evalc('A');
REF =     '
A =

   3.1416 -    Infi   0.0000 -    Infi   0.0000 -    Infi
   0.0000 -    Infi   0.0000 + 3.1416i   0.0000 -    Infi
   0.0000 -    Infi   0.0000 -    Infi   3.1416 -    Infi

';
assert_isequal(R, REF)
%=============================================================================
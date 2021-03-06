//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// This file is part of the Nelson.
//=============================================================================
// LICENCE_BLOCK_BEGIN
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// Alternatively, you can redistribute it and/or
// modify it under the terms of the GNU General Public License as
// published by the Free Software Foundation; either version 2 of
// the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this program. If not, see <http://www.gnu.org/licenses/>.
// LICENCE_BLOCK_END
//=============================================================================
#include "epsBuiltin.hpp"
#include "Epsilon.hpp"
#include "Error.hpp"
//=============================================================================
using namespace Nelson;
//=============================================================================
ArrayOfVector
Nelson::ConstructorsGateway::epsBuiltin(int nLhs, const ArrayOfVector& argIn)
{
    nargoutcheck(nLhs, 0, 1);
    nargincheck(argIn, 0, 1);
    ArrayOfVector retval(1);
    if (argIn.empty()) {
        retval << ArrayOf::doubleConstructor(Epsilon(1.0));
    } else {
        if (argIn[0].getDataClass() == NLS_DOUBLE || argIn[0].getDataClass() == NLS_DCOMPLEX) {
            if (!argIn[0].isScalar()) {
                Error(ERROR_WRONG_ARGUMENT_1_SIZE_SCALAR_EXPECTED);
            }
            auto* pV = (double*)argIn[0].getDataPointer();
            double dV = pV[0];
            retval << ArrayOf::doubleConstructor(Epsilon(dV));
        } else if (argIn[0].getDataClass() == NLS_SINGLE
            || argIn[0].getDataClass() == NLS_SCOMPLEX) {
            if (!argIn[0].isScalar()) {
                Error(ERROR_WRONG_ARGUMENT_1_SIZE_SCALAR_EXPECTED);
            }
            auto* pV = (single*)argIn[0].getDataPointer();
            single dV = pV[0];
            retval << ArrayOf::singleConstructor(Epsilon(dV));
        } else if (argIn[0].isRowVectorCharacterArray()) {
            std::wstring arg = argIn[0].getContentAsWideString();
            if (arg == L"single") {
                retval << ArrayOf::singleConstructor(Epsilon(static_cast<single>(1.0)));
            } else if (arg == L"double") {
                retval << ArrayOf::doubleConstructor(Epsilon(1.0));
            } else {
                Error(_W("Type \'double\' or \'single\' expected."));
            }
        } else {
            Error(_W("Type \'double\' or \'single\' expected."));
        }
    }
    return retval;
}
//=============================================================================

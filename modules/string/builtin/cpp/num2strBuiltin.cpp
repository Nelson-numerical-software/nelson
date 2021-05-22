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
#include "num2strBuiltin.hpp"
#include "Error.hpp"
#include "OverloadFunction.hpp"
#include "OverloadRequired.hpp"
#include "NumberToString.hpp"
//=============================================================================
using namespace Nelson;
//=============================================================================
ArrayOfVector
Nelson::StringGateway::num2strBuiltin(Evaluator* eval, int nLhs, const ArrayOfVector& argIn)
{
    ArrayOfVector retval;
    nargoutcheck(nLhs, 0, 1);
    nargincheck(argIn, 1, 2);
    // Call overload if it exists
    bool bSuccess = false;
    if (eval->mustOverloadBasicTypes()) {
        retval = OverloadFunction(eval, nLhs, argIn, "num2str", bSuccess);
    }
    if (!bSuccess) {
        ArrayOf res;
        bool needToOverload;
        if (argIn.size() == 2) {
            ArrayOf arg1 = argIn[1];
            if (argIn[1].isNumeric()) {
                double N = arg1.getContentAsDoubleScalar();
                res = NumberToString(argIn[0], N, needToOverload);
            } else {
                std::wstring format = arg1.getContentAsWideString();
                res = NumberToString(argIn[0], format, needToOverload);
            }
        } else {
            res = NumberToString(argIn[0], needToOverload);
        }
        if (needToOverload) {
            retval = OverloadFunction(eval, nLhs, argIn, "num2str", bSuccess);
            if (!bSuccess) {
                OverloadRequired(eval, argIn, Overload::OverloadClass::UNARY);
            }
        } else {
            retval << res;
        }
    }
    return retval;
}
//=============================================================================
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
#include "evalBuiltin.hpp"
#include "Error.hpp"
#include "EvaluateCommand.hpp"
//=============================================================================
using namespace Nelson;
//=============================================================================
ArrayOfVector
Nelson::CoreGateway::evalBuiltin(Evaluator* eval, int nLhs, const ArrayOfVector& argIn)
{
    nargincheck(argIn, 1, 2);
    std::wstring command;
    std::wstring catchCommand;
    if (argIn[0].isRowVectorCharacterArray()) {
        command = argIn[0].getContentAsWideString();
    } else {
        Error(_W("#1 string expected."));
    }
    if (argIn.size() > 1) {
        if (argIn[1].isRowVectorCharacterArray()) {
            catchCommand = argIn[1].getContentAsWideString();
        } else {
            Error(_W("#2 string expected."));
        }
    }
    return EvaluateCommand(eval, nLhs, command, catchCommand);
}
//=============================================================================

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
#include "dlsymBuiltin.hpp"
#include "CreateDynamicLinkLibraryObject.hpp"
#include "Error.hpp"
//=============================================================================
using namespace Nelson;
//=============================================================================
ArrayOfVector
Nelson::DynamicLinkGateway::dlsymBuiltin(int nLhs, const ArrayOfVector& argIn)
{
    ArrayOfVector retval;
    nargincheck(argIn, 4, 4);
    ArrayOf param1 = argIn[0];
    ArrayOf param2 = argIn[1];
    std::wstring symbolName = param2.getContentAsWideString();
    ArrayOf param3 = argIn[2];
    std::wstring returnTypeString = param3.getContentAsWideString();
    ArrayOf param4 = argIn[3];
    wstringVector argumentsString = param4.getContentAsWideStringVector(true);
    retval << createDynamicLinkSymbolObject(param1, symbolName, returnTypeString, argumentsString);
    return retval;
}
//=============================================================================

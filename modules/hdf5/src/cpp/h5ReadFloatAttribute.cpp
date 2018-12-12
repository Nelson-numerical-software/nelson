//=============================================================================
// Copyright (c) 2016-2018 Allan CORNET (Nelson)
//=============================================================================
// LICENCE_BLOCK_BEGIN
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// LICENCE_BLOCK_END
//=============================================================================
#include "h5ReadFloatAttribute.hpp"
#include "h5ReadAttributeHelpers.hpp"
#include "Exception.hpp"
//=============================================================================
namespace Nelson {
//=============================================================================
ArrayOf
h5ReadFloatAttribute(hid_t attr_id, std::wstring& error)
{
    ArrayOf res;
    hid_t type = H5Aget_type(attr_id);
    if (type < 0) {
        error = _W("Attribute have an invalid type.");
        return res;
    }
    hsize_t storageSize = H5Aget_storage_size(attr_id);
    hsize_t sizeType = H5Tget_size(type);
    size_t numVal = storageSize / sizeType;
    hid_t aspace = H5Aget_space(attr_id);
    Dimensions dims = getDimensions(aspace);
    Class outputClass;
    if (sizeType == 4) {
        outputClass = NLS_SINGLE;
    } else if (sizeType == 8) {
        outputClass = NLS_DOUBLE;
    } else {
        H5Sclose(aspace);
        H5Aclose(type);
        error = _W("Type not managed.");
        return res;
    }
    if (dims.isEmpty(false)) {
        res = ArrayOf::emptyConstructor(dims);
        res.promoteType(outputClass);
    } else {
        void* ptr = ArrayOf::allocateArrayOf(outputClass, numVal, stringVector(), false);
        if (H5Aread(attr_id, type, ptr) < 0) {
            res = ArrayOf::ArrayOf(outputClass, dims, ptr);
            res = ArrayOf();
            error = _W("Cannot read attribute.");
        } else {
            res = ArrayOf::ArrayOf(outputClass, dims, ptr);
        }
    }
    H5Sclose(aspace);
    H5Aclose(type);
    return res;
}
//=============================================================================
}  // namespace Nelson
//=============================================================================
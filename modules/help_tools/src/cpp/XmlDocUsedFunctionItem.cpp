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
#include "XmlDocUsedFunctionItem.hpp"
#include "HtmlTags.hpp"
#include "XmlDocumentTags.hpp"
#include "characters_encoding.hpp"
#include "i18n.hpp"
//=============================================================================
namespace Nelson {
//=============================================================================
XmlDocUsedFunctionItem::XmlDocUsedFunctionItem(const std::wstring& usedfunction)
{
    this->_usedfunction.assign(usedfunction);
}
//=============================================================================
XmlDocUsedFunctionItem::~XmlDocUsedFunctionItem() { this->_usedfunction.clear(); }
//=============================================================================
std::wstring
XmlDocUsedFunctionItem::getItemType()
{
    return utf8_to_wstring(USED_FUNCTION_TAG);
}
//=============================================================================
bool
XmlDocUsedFunctionItem::writeAsHtml(std::string& utf8stream)
{
    if (!this->_usedfunction.empty()) {
        utf8stream = utf8stream + HTML_H3_IN_TAG + _("Used function(s)") + HTML_H3_OUT_TAG + "\n";
        utf8stream = utf8stream + HTML_HR_OUT_TAG + "\n";
        utf8stream = utf8stream + "\n";
        utf8stream = utf8stream + wstring_to_utf8(this->_usedfunction) + "\n";
        utf8stream = utf8stream + "\n";
    }
    return true;
}
//=============================================================================
bool
XmlDocUsedFunctionItem::writeAsMarkdown(std::string& utf8stream)
{
    if (!this->_usedfunction.empty()) {
        utf8stream = utf8stream + _("Used function(s)") + "\n";
        utf8stream = utf8stream + "\n";
        utf8stream = utf8stream + wstring_to_utf8(this->_usedfunction) + "\n";
        utf8stream = utf8stream + "\n";
    }
    return true;
}
//=============================================================================
}
//=============================================================================

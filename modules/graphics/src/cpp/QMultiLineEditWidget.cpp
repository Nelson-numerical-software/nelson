//=============================================================================
// Copyright (c) 2016-present Allan CORNET (Nelson)
//=============================================================================
// This file is part of the Nelson.
//=============================================================================
// LICENCE_BLOCK_BEGIN
// SPDX-License-Identifier: LGPL-3.0-or-later
// LICENCE_BLOCK_END
//=============================================================================
#include "QMultiLineEditWidget.h"
#include "QStringConverter.hpp"
#include "GOPropertyNames.hpp"
//=============================================================================
namespace Nelson {
//=============================================================================
QMultiLineEditWidget::QMultiLineEditWidget(GOUIControl* gouiParent, QWidget* parent)
    : goParent(gouiParent), QMultiLineEdit(parent)
{
    setObjectName("QMultiLineEditWidget");
    setObjectName("multiLine");
    this->setParent(parent);
    setFocusPolicy(Qt::ClickFocus);
}
//=============================================================================
void
QMultiLineEditWidget::keyPressEvent(QKeyEvent* event)
{
    goParent->handleKeyEvent(event, GO_KEY_PRESS_FCN_PROPERTY_NAME_STR, L"KeyPress");
    QMultiLineEdit::keyPressEvent(event);
}
//=============================================================================
void
QMultiLineEditWidget::keyReleaseEvent(QKeyEvent* event)
{
    goParent->handleKeyEvent(event, GO_KEY_RELEASE_FCN_PROPERTY_NAME_STR, L"KeyRelease");
    QMultiLineEdit::keyReleaseEvent(event);
}
//=============================================================================
void
QMultiLineEditWidget::mousePressEvent(QMouseEvent* event)
{
    goParent->handleMouseEvent(event, GO_BUTTON_DOWN_FCN_PROPERTY_NAME_STR, L"ButtonDown");
    QMultiLineEdit::mousePressEvent(event);
}
//=============================================================================
void
QMultiLineEditWidget::mouseReleaseEvent(QMouseEvent* event)
{
    QMultiLineEdit::mouseReleaseEvent(event);
    goParent->clicked();
}
//=============================================================================
}
//=============================================================================
import QtQuick 2.0

Rectangle {
    id: root

    property alias text: textItem.text
    property alias font: textItem.font
    property alias font.color: textItem.color

    Text{
        id: textItem
        anchors.centerIn: root

    }
}


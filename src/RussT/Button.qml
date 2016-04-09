import QtQuick 2.5

Rectangle {
    id: root

    signal clicked
    signal hoverStarted
    signal hoverFinished

    property alias text: textArea.text
    property alias font: textArea.font
    property alias fontColor: textArea.color

    Text{
        id:textArea
        anchors.centerIn: root
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: hoverStarted()
        onExited: hoverFinished()

        Component.onCompleted: {
            mouseArea.clicked.connect(root.clicked)
        }
    }
}

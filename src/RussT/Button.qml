import QtQuick 2.5

Rectangle {
    id: root

    signal clicked
    signal hoverStarted
    signal hoverFinished

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

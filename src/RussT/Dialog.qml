import QtQuick 2.5

TextRect{
    id: root

    signal clicked
    signal hoverStarted
    signal hoverFinished

    property alias bFont: textButton.font
    property alias bText: textButton.text
    property alias bColor: textButton.color
    property alias bWidth: textButton.width
    property alias bHeight: textButton.height
    property alias bRadius: textButton.radius
    property alias bAnchors: textButton.anchors
    property alias bFontColor: textButton.color

    property alias mouseArea:dragArea
    property real  maximumDragX:0
    property real  maximumDragY:0
    property alias drag:dragArea.drag

    MouseArea{
        id: dragArea
        anchors.fill: root
        drag.target: root
        drag.maximumX: maximumDragX
        drag.maximumY: maximumDragY
    }

    Button{
        id: textButton
        /*onClicked: clicked()
        onHoverStarted: hoverStarted()
        onHoverFinished: hoverFinished()*/
        Component.onCompleted: {
            //mouseArea.clicked.connect(root.clicked)
            textButton.clicked.connect(root.clicked)
            textButton.hoverStarted.connect(root.hoverStarted)
            textButton.hoverFinished.connect(root.hoverFinished)
        }
    }
}

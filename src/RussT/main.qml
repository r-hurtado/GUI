/****************************
* Name:     Russ, Travis
* Lab:      2, Splashscreen
* Project:  RussT
****************************/
import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    height: 450
    width: 0800
    color: "black"

    /*TextRect{
        height: 225
        width: 0400
        color: "blue"
        text: "Hello world."
        anchors.centerIn: parent
        font.pointSize: 24
        font.bold: true
        fontColor: "white"

        Button{
            height: 45
            width: 160
            radius: height/5
            color: "red"
            fontColor: "white"
            text: "Click Me!"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: height/5
            anchors.horizontalCenter: parent.horizontalCenter

            onHoverStarted: color = "green"
            onHoverFinished: color = "red"
            onClicked: parent.visible = false
        }
    }*/

    Dialog{
        height: 225
        width: 0400
        color: "blue"
        text: "Hello world."
        //anchors.centerIn: parent
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        font.pointSize: 24
        font.bold: true
        fontColor: "white"

        bHeight: 45
        bWidth: 160
        bRadius: bHeight/5
        bColor: "red"
        bFontColor: "white"
        bText: "Click Me!"
        bAnchors.bottom: bottom
        bAnchors.bottomMargin: bHeight/5
        bAnchors.horizontalCenter: horizontalCenter

        DropArea{
            id:dropArea
            anchors.fill: parent
            Drag.dragType: Drag.Automatic
            keys:[]
        }

        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        Drag.hotSpot.x: width/2
        Drag.hotSpot.y: height/2

        onHoverStarted: bColor = "green"
        onHoverFinished: bColor = "red"
        onClicked:{
            x = parent.width/2 - width/2
            y = parent.height/2 - height/2
        }
    }
}


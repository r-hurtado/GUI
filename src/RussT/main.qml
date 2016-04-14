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

    Text{
     text: Users.first.getUsername()

    }

    Dialog{

        Image{
            source: "../../img/gear.png"
            height:80
            width:80
            x: parent.width/2 - width/2
        }

        id: secondBox
        visible: false
        height: 200
        width: 0300
        font.pointSize: 10
        color: "silver"
        text: "\tPresented by:\nRussell Hurtado and Travis Miller"
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2

        bHeight: 45
        bWidth: 160
        bRadius: bHeight/5
        bColor: "red"
        bFontColor: "white"
        bText: "Close"
        bAnchors.bottom: bottom
        bAnchors.bottomMargin: bHeight/5
        bAnchors.horizontalCenter: horizontalCenter

        onHoverStarted: bColor = "blue"
        onHoverFinished: bColor = "red"

        DropArea{
            anchors.fill: parent
            Drag.dragType: Drag.Automatic
            keys:[]
        }

        Drag.active: mouseArea.drag.active
        maximumDragX: parent.width
        maximumDragY: parent.height
        Drag.hotSpot.x: width/2
        Drag.hotSpot.y: height/2

        onClicked: Qt.quit()
    }

    Dialog{


        id: firstBox
        height: 300
        width: 0700
        color: "blue"
        text: "Welcome!\nOur program is a photo sharing app.\nUsers will upload photos, then rate and comment on other photos.\n"
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        font.pointSize: 12
        font.bold: true
        fontColor: "white"

        tZ: 3
        bHeight: 45
        bWidth: 160
        bRadius: bHeight/5
        bColor: "red"
        bFontColor: "white"
        bText: "Click Me"
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
            visible = false
            x = parent.width/2 - width/2
            y = parent.height/2 - height/2
            secondBox.visible = true
        }

        Image{
            source: "../../img/gear.png"
            height:240
            width:240
            x: parent.width/2 - width/2
            z:2
        }
    }
}

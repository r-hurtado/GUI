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

    TextRect{
        height: 225
        width: 0400
        color: "blue"
        text: "Hello world."
        anchors.centerIn: parent
        font.pointSize: 24
        font.bold: true

        Button{
            height: 45
            width: 160
            radius: height/5
            color: "red"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: height/5
            anchors.horizontalCenter: parent.horizontalCenter

            onHoverStarted: color = "green"
            onHoverFinished: color = "red"
            onClicked: visible = false
        }
    }
}


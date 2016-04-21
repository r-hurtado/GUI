import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Rectangle {
    signal menuClicked
    signal refreshedClicked
    signal sharedClicked
    signal uploadClicked
    signal starClicked
    signal commentClicked
    signal rateClicked

    id: home_screen
    height: 300
    width: 200
    color: "silver"

    MouseArea{
        id: mouse_behind
        enabled: false
        anchors.fill: parent
        onClicked: {
            pop_menu.visible = false
            enabled = false
        }
    }

    // pop out side menu
    Rectangle{
        id: pop_menu
        visible: false
        height: parent.height * .4
        width: parent.width * .5
        color: "black"
        z:1
        MouseArea{
            anchors.fill: parent
            z:0
            onClicked: {
                //pop_menu.visible = false

            }
        }
    }

    Row{
        spacing: parent.width / 7
        x: parent.width * 0.05
        y: 40
        width: parent.width * 0.9

        // menu button
        Rectangle{
            height: 40
            width: parent.width / 7
            Text{
                text: "menu"
                font.pointSize: 8
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    pop_menu.visible = true
                    mouse_behind.enabled = true
                }
            }
        }

        // Refresh images button
        Rectangle{
            height: 40
            width: parent.width / 7
            Text{
                text: "refresh"
                font.pointSize: 8
            }
            MouseArea{
                anchors.fill: parent
                onClicked: refreshedClicked()
            }
        }
        // share button
        Rectangle{
            height: 40
            width: parent.width / 7
            Text{
                text: "share"
                font.pointSize: 8
            }
            MouseArea{
                anchors.fill: parent
                onClicked: sharedClicked()
            }

        }
        // upload photo button
        Rectangle{
            height: 40
            width: parent.width / 7
            Text{
                text: "upload"
                font.pointSize: 8
            }
            MouseArea{
                anchors.fill: parent
                onClicked: uploadClicked()
            }

        }
    }
    // star image
    Rectangle{
        height: 40
        width: 40
        x: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40

        Text{
            text: "star"
            font.pointSize: 8
        }
        MouseArea{
            anchors.fill: parent
            onClicked: starClicked()
        }
    }

    // Comment image
    Rectangle{
        height: 40
        width: 40
        x: 120
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40

        Text{
            text: "comment"
            font.pointSize: 8
        }
        MouseArea{
            anchors.fill: parent
            onClicked: commentClicked()
        }
    }

    // Rate button
    Rectangle{
        height: 40
        width: 120
        x: 320
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40

        Text{
            text: "rate"
            font.pointSize: 8
        }
        MouseArea{
            anchors.fill: parent
            onClicked: rateClicked()
        }
    }
}

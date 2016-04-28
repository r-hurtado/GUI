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
            pop_menu.unMenu()//pop_menu.visible = false
            enabled = false
        }
    }

    // pop out side menu
    Rectangle{
        id: pop_menu
        visible: true//false
        height: parent.height * .4
        width: parent.width * .5
        color: "blue"
        x: -width
        z:1

        signal menu
        PropertyAnimation {
            id: pop_animation
            target: pop_menu;
            property: "x";
            to: 0;
            duration: 250
        }
        signal unMenu
        PropertyAnimation {
            id: unpop_animation
            target: pop_menu;
            property: "x";
            to: -width;
            duration: 250
        }

        onMenu:
        {
            pop_animation.start()
        }
        onUnMenu:
        {
            unpop_animation.start()
        }

        Column{
            //anchors.fill: parent
            height: parent.height
            width: parent.width

            Rectangle{
                height: parent.height / 3 //number of elements
                width: parent.width
                border.width: 1
                MouseArea{
                    anchors.fill: parent
                    z:0
                    onClicked: {
                        console.log("1")//pop_menu.visible = false
                    }
                }
            }
            Rectangle{
                height: parent.height / 3 //number of elements
                width: parent.width
                border.width: 1
                MouseArea{
                    anchors.fill: parent
                    z:0
                    onClicked: {
                        console.log("2")//pop_menu.visible = false
                    }
                }
            }
            Rectangle{
                height: parent.height / 3 //number of elements
                width: parent.width
                border.width: 1
                MouseArea{
                    anchors.fill: parent
                    z:0
                    onClicked: {
                        console.log("3")//pop_menu.visible = false
                    }
                }
            }
        }

    }

    Row{
        //y: 40
        width: parent.width

        // menu button
        Rectangle{
            height: 40
            width: parent.width / 4
            border.width: 1
            Text{
                text: "menu"
                font.pointSize: 8
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //animate on x from x = -width -> x = 0
                    menuClicked()
                    pop_menu.menu()
                    pop_menu.visible = true
                    mouse_behind.enabled = true
                }
            }
        }

        // Refresh images button
        Rectangle{
            height: 40
            width: parent.width / 4
            border.width: 1
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
            width: parent.width / 4
            border.width: 1
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
            width: parent.width / 4
            border.width: 1
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

    Row{
        width: parent.width
        anchors.bottom: parent.bottom
        //anchors.bottomMargin: 40

        // star image
        Rectangle{
            height: 40
            width: parent.width / 4
            border.width: 1

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
            width: parent.width / 4
            border.width: 1

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
            width: parent.width / 2
            border.width: 1

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
}

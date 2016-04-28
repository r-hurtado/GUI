import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0

Rectangle {
    signal menuClicked
    signal refreshedClicked
    signal sharedClicked
    signal uploadClicked
    signal starClicked
    signal commentClicked
    signal rateClicked

    Settings{

    }

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

    Rectangle{
        id: choose_theme
        height: settings_rect.height
        width: settings_rect.width
        color: "black"
        visible: false
        anchors.centerIn: parent
        z:1

        Rectangle{ // close choose theme
            height: 20
            width: 20
            color: "plum"
            anchors.top: parent.top
            anchors.right: parent.right

            Text{
                anchors.centerIn: parent
                text: "X"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    choose_theme.visible = false
                }
            }
        }
    }

    // pop up settings rect
    Rectangle{
        id: settings_rect
        height: parent.height / 3
        width: (parent.width * 8) / 10
        visible: false
        anchors.centerIn: parent

        Text{
            id: settings_txt
            text: "Settings"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
        }

        // options inside settings
        Rectangle{ // Sounds option
            id: sounds_opt
            height: (parent.height - settings_txt.contentHeight) / 3
            width: parent.width
            anchors.top: settings_txt.bottom
            border.width: 1

            Text {
                text: "Sounds"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.height
            }

            Switch{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.height
            }
        }

        Rectangle{ // Push notification option
            id: push_opt
            height: (parent.height - settings_txt.contentHeight) / 3
            width: parent.width
            anchors.top: sounds_opt.bottom
            border.width: 1

            Text {
                text: "Push Notifications"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.height
            }

            Switch{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.height
            }
        }

        Rectangle{ // Change theme option
            id: theme_opt
            height: (parent.height - settings_txt.contentHeight) / 3
            width: parent.width
            anchors.top: push_opt.bottom
            border.width: 1

            Text {
                text: "Theme"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.height
            }

            Rectangle{ // Change theme
                color: "cadetblue"
                height: 20
                width: 60
                anchors.right: parent.right
                anchors.rightMargin: width
                anchors.verticalCenter: parent.verticalCenter


                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("Change theme clicked")
                        choose_theme.visible = true
                    }
                }
            }
        }

        // close settings rect button
        Rectangle{
            id: settings_close
            height: settings_txt.contentHeight
            width: (parent.width / parent.height) * height
            anchors.top: parent.top
            anchors.right: parent.right
            color: "plum"

            Text{
                text: "X"
                anchors.centerIn: parent
                font.pointSize: settings_txt.font.pointSize
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    settings_rect.visible = false

                }
            }
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

                Text{
                    text: "Settings"
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea{
                    anchors.fill: parent
                    z:0
                    onClicked: {
                        console.log("Settings clicked")//pop_menu.visible = false
                        settings_rect.visible = true
                        unpop_animation.start()

                    }
                }
            }
            Rectangle{
                height: parent.height / 3 //number of elements
                width: parent.width
                border.width: 1

                Text{
                    text: "My Profile"
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea{
                    anchors.fill: parent
                    z:0
                    onClicked: {
                        console.log("My Profile clicked")//pop_menu.visible = false
                    }
                }
            }
            Rectangle{
                height: parent.height / 3 //number of elements
                width: parent.width
                border.width: 1

                Text{
                    text: "Log Out"
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea{
                    anchors.fill: parent
                    z:0
                    onClicked: {
                        console.log("Log Out clicked")//pop_menu.visible = false
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

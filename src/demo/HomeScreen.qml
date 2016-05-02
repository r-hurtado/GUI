import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Rectangle {
    signal menuClicked
    signal refreshedClicked
    signal sharedClicked
    signal uploadClicked
    signal starClicked
    signal commentClicked
    signal rateClicked
    signal logoutClicked
    signal profileClicked

    signal themeSet

    Settings{
        //property alias theme: CurrentTheme
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
        height: settings_rex.height
        width: settings_rex.width
        color: "black"
        visible: false
        anchors.centerIn: parent
        z:2

        MouseArea{anchors.fill: parent}//Makes choose_theme modal

        Rectangle{ // close choose theme
            height: parent.height * .1
            width: height * 1.5
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

        Rectangle{
            color: "transparent"
            height: settings_rex.height * .1
            width: settings_rex.width
            anchors.top: parent.top
            Text{text: "Themes"; color: "white"; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    CurrentTheme.setThemeIcon(5)
                    themeSet()
                }
            }
        }

        Rectangle{ // choose individual theme color
            height: settings_rex.height * .9
            width: settings_rex.width/2
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            color: "blue"
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.top: parent.top
                anchors.left: parent.left
                border.width: 1
                color: "#dadddc"
                Text{text: "Theme 1"; anchors.centerIn: parent; color: "lightseagreen"; font.bold: true}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeBackColor("#dadddc")
                        CurrentTheme.setThemeForeColor("lightseagreen")
                        themeSet()
                    }
                }
            }
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.top: parent.top
                anchors.right: parent.right
                border.width: 1
                color: "#750042"
                Text{text: "Theme 2"; anchors.centerIn: parent; color: "#220013"; font.bold: true}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeBackColor("#750042")
                        CurrentTheme.setThemeForeColor("#220013")
                        themeSet()
                    }
                }
            }
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                border.width: 1
                color: "#0d1d39"
                Text{text: "Theme 3"; anchors.centerIn: parent; color: "#d3a7f8"; font.bold: true}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeBackColor("#0d1d39")
                        CurrentTheme.setThemeForeColor("#d3a7f8")
                        themeSet()
                    }
                }
            }
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                border.width: 1
                color: "#7be35a"
                Text{text: "Theme 4"; anchors.centerIn: parent; color: "#696168"; font.bold: true}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeBackColor("#7be35a")
                        CurrentTheme.setThemeForeColor("#696168")
                        themeSet()
                    }
                }
            }
        }

        Rectangle{ // choose individual icon set
            height: settings_rex.height * .9
            width: settings_rex.width/2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "red"
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.top: parent.top
                anchors.left: parent.left
                border.width: 1
                Image{source: "../Theme 1/user.png"; anchors.centerIn: parent; height: parent.height * .9; width: parent.width * .9}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeIcon(1)
                        themeSet()
                    }
                }
            }
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.top: parent.top
                anchors.right: parent.right
                border.width: 1
                Image{source: "../Theme 2/user.png"; anchors.centerIn: parent; height: parent.height * .9; width: parent.width * .9}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeIcon(2)
                        themeSet()
                    }
                }
            }
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                border.width: 1
                Image{source: "../Theme 3/user.png"; anchors.centerIn: parent; height: parent.height * .9; width: parent.width * .9}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeIcon(3)
                        themeSet()
                    }
                }
            }
            Rectangle{
                height: parent.height/2
                width: parent.width/2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                border.width: 1
                Image{source: "../Theme 4/user.png"; anchors.centerIn: parent; height: parent.height * .9; width: parent.width * .9}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        CurrentTheme.setThemeIcon(4)
                        themeSet()
                    }
                }
            }
        }

    }

    // pop up settings rect
    MouseArea{
        anchors.fill: home_screen
        z: 1
        id: settings_rect
        visible: false

        Rectangle{
            id: settings_rex
            height: parent.height / 3
            width: (parent.width * 8) / 10
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
                    id: sounds_switch
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
                    id: push_switch
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: parent.height
                    style: SwitchStyle{
                        groove: Rectangle{
                            implicitHeight: sounds_switch.height
                            implicitWidth: sounds_switch.width
                            color: push_switch.checked ? "red" : "#BBBBBB"
                            radius: 2
                            border.width: 1
                            border.color: "grey"

                        }
                    }
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
                    height: sounds_switch.height
                    width: sounds_switch.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: parent.height

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
                id: settingsRectRex
                height: parent.height / 3 //Settings
                width: parent.width
                border.width: 1

                Text{
                    id: settingsText
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
            Rectangle{ //Profile
                id: profileRect
                height: parent.height / 3
                width: parent.width
                border.width: 1

                Text{
                    id: profileText
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
            Rectangle{ //Logout
                id: logoutRect
                height: parent.height / 3
                width: parent.width
                border.width: 1

                Text{
                    id: logoutText
                    text: "Log Out"
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea{
                    anchors.fill: parent
                    z:0
                    onClicked: {
                        logoutClicked()
                    }
                }
            }

            signal theme
            onTheme: {
                logoutRect.color = CurrentTheme.getThemeBackColor()
                logoutText.color = CurrentTheme.getThemeForeColor()
                profileRect.color = CurrentTheme.getThemeBackColor()
                profileText.color = CurrentTheme.getThemeForeColor()
                settingsRectRex.color = CurrentTheme.getThemeBackColor()
                settingsText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }

    }

    Row{
        height: parent.height * .1
        width: parent.width

        // menu button
        Rectangle{
            height: parent.height
            width: parent.width / 4
            border.width: 1
            Image{id: menuIcon; source: "../All images/menu.png"; height: parent.height * .9; width: height; anchors.centerIn: parent}
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

            ColorOverlay {
                id: menuIconOverlay
                anchors.fill: menuIcon
                source: menuIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                menuIconOverlay.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }

        // Refresh images button
        Rectangle{
            height: parent.height
            width: parent.width / 4
            border.width: 1
            Image{id: refreshIcon; source: "../Theme 5/refresh.png"; height: parent.height * .9; width: height; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: refreshedClicked()
            }
            ColorOverlay {
                id: refreshIconOverlay
                anchors.fill: refreshIcon
                source: refreshIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                refreshIconOverlay.color = CurrentTheme.getThemeForeColor()
                refreshIcon.source = "../Theme " + CurrentTheme.getThemeIcon() + "/refresh.png"
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        // share button
        Rectangle{
            height: parent.height
            width: parent.width / 4
            border.width: 1
            Image{id: shareIcon; source: "../Theme 5/share.png"; height: parent.height * .9; width: height; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: sharedClicked()
            }

            ColorOverlay {
                id: shareIconOverlay
                anchors.fill: shareIcon
                source: shareIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                shareIconOverlay.color = CurrentTheme.getThemeForeColor()
                shareIcon.source = "../Theme " + CurrentTheme.getThemeIcon() + "/share.png"
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        // upload photo button
        Rectangle{
            height: parent.height
            width: parent.width / 4
            border.width: 1
            Image{id: uploadIcon; source: "../Theme 5/upload.png"; height: parent.height * .9; width: height; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: uploadClicked()
            }

            ColorOverlay {
                id: uploadIconOverlay
                anchors.fill: uploadIcon
                source: uploadIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                uploadIconOverlay.color = CurrentTheme.getThemeForeColor()
                uploadIcon.source = "../Theme " + CurrentTheme.getThemeIcon() + "/upload.png"
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
    }

    Row{
        height: parent.height * .1
        width: parent.width
        anchors.bottom: parent.bottom
        //anchors.bottomMargin: 40

        // star image
        Rectangle{
            height: parent.height
            width: parent.width / 4
            border.width: 1

            Image{id: starIcon; source: "../Theme 5/star.png"; height: parent.height * .9; width: height; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: starClicked()
            }

            ColorOverlay {
                id: starIconOverlay
                anchors.fill: starIcon
                source: starIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                starIconOverlay.color = CurrentTheme.getThemeForeColor()
                starIcon.source = "../Theme " + CurrentTheme.getThemeIcon() + "/star.png"
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }

        // Comment image
        Rectangle{
            height: parent.height
            width: parent.width / 4
            border.width: 1

            Image{id: commentIcon; source: "../Theme 5/comment.png"; height: parent.height * .9; width: height; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: commentClicked()
            }

            ColorOverlay {
                id: commentIconOverlay
                anchors.fill: commentIcon
                source: commentIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                commentIconOverlay.color = CurrentTheme.getThemeForeColor()
                commentIcon.source = "../Theme " + CurrentTheme.getThemeIcon() + "/comment.png"
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }

        // Rate button
        Rectangle{
            height: parent.height
            width: parent.width / 2
            border.width: 1

            Text{
                id: rateText
                text: "RATE"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: rateClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                rateText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
    }
}

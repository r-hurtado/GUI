import QtQuick 2.2
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    border.width: 1

    signal close
    signal theme
    onTheme: color = CurrentTheme.getThemeBackColor()

    Component.onCompleted:
    {
        theme()
        themeSet.connect(theme)
    }

    Rectangle{ //Browse
        id: browse_opt
        height: parent.height * 0.2
        width: parent.width
        border.width: 1
        color: "transparent"

        Text {
            id: browse_text
            text: "Browse Photo Library"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.height / 12
            font.pointSize: parent.height / 6
        }

        Rectangle{
            id: browse_button
            height: parent.height * (1/3)
            width: parent.width * 0.2
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.height / 5
            border.width: 1

            signal theme
            onTheme: {color = CurrentTheme.getThemeForeColor(); buttonText.color = CurrentTheme.getThemeBackColor()}

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }

            Text{id: buttonText; text: "Browse"; anchors.centerIn: parent; font.pointSize: parent.height/3.5}
            MouseArea{
                anchors.fill: parent
                onClicked: fileDialog.visible = true
            }
        }

        signal theme
        onTheme: {
            color = CurrentTheme.getThemeBackColor()
            browse_text.color = CurrentTheme.getThemeForeColor()
        }

        Component.onCompleted:
        {
            theme()
            themeSet.connect(theme)
        }
    }

    FileDialog {
        id: fileDialog
        title: "Choose a Photo to upload"
        folder: shortcuts.pictures
        nameFilters: [ "Image files (*.jpg *.png)" ]
        onAccepted: {
            console.log("\nYou chose: " + fileDialog.fileUrls)
            photo.source = fileDialog.fileUrls[0]
            gearOverlay.visible = false
        }
        onRejected: {
            console.log("Canceled")
        }
        //Component.onCompleted: visible = true
    }

    Image {
        id: photo
        height: parent.height * 0.6
        width: parent.width * .9
        x: parent.width * .05
        anchors.top: browse_opt.bottom
        anchors.topMargin: parent.height * .05
        fillMode: Image.PreserveAspectFit
        source: "qrc:/../../img/gear.png"

        ColorOverlay {
            id: gearOverlay
            anchors.fill: parent
            source: parent
        }

        signal theme
        onTheme: gearOverlay.color = CurrentTheme.getThemeForeColor()

        Component.onCompleted:
        {
            theme()
            themeSet.connect(theme)
        }
    }

    Rectangle{
        id: browse
        height: parent.height * 0.1
        width: parent.width
        anchors.bottom: parent.bottom
        border.width: 1
        color: "transparent"

        Rectangle{
            height: parent.height
            width: parent.width /2
            border.width: 1
            id: cancel
            Image{id: cancelIcon; height: parent.height * .9; width: height; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: {browse_text.text = "Browse Photo Library"; close()}
            }

            ColorOverlay {
                id: cancelIconOverlay
                anchors.fill: cancelIcon
                source: cancelIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                cancelIconOverlay.color = CurrentTheme.getThemeForeColor()
                cancelIcon.source = "../Theme " + CurrentTheme.getThemeIcon() + "/cancel.png"
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: parent.height
            width: parent.width /2
            x: width
            border.width: 1
            id: ok
            Image{id: okIcon; height: parent.height * .9; width: height; anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(gearOverlay.visible === true)
                    {
                        console.log("ERROR: no file chosen")
                        browse_text.text = "ERROR: Choose photo"
                    }
                    else
                    {
                        console.log("Ok clicked -> uploading file: " + fileDialog.fileUrls[0])
                        close()
                        browse_text.text = "Browse Photo Library"
                    }
                }
            }

            ColorOverlay {
                id: okIconOverlay
                anchors.fill: okIcon
                source: okIcon
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                okIconOverlay.color = CurrentTheme.getThemeForeColor()
                okIcon.source = "../Theme " + CurrentTheme.getThemeIcon() + "/ok.png"
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
    }
}

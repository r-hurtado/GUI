import QtQuick 2.2
import QtQuick.Dialogs 1.2

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
            anchors.leftMargin: parent.height / 10
            font.pointSize: parent.height / 5
        }

        Rectangle{
            id: browse_button
            height: parent.height * (8/30)
            width: parent.width * 0.2
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.height / 5

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
            //Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            //Qt.quit()
        }
        //Component.onCompleted: visible = true
    }

    Image {
        id: photo
        height: parent.height * 0.7
        width: parent.width
        anchors.top: browse_opt.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/../../img/gear.png"
    }

    Rectangle{ //Browse
        height: parent.height * 0.1
        width: parent.width
        anchors.top: photo.bottom
        border.width: 1
        color: "transparent"       

        MouseArea{
            anchors.fill: parent
            onClicked: close()
        }
    }
}

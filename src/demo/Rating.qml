import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4

Rectangle {
    id: root
    border.width: 1

    signal theme
    onTheme: color = CurrentTheme.getThemeBackColor()

    Component.onCompleted:
    {
        theme()
        themeSet.connect(theme)
    }

    signal backClicked

    signal oneClicked
    signal twoClicked
    signal threeClicked
    signal fourClicked
    signal fiveClicked
    signal sixClicked
    signal sevenClicked
    signal eightClicked
    signal nineClicked
    signal tenClicked

    signal submitClicked

    //Back arrow
    Rectangle{
        id: backArrow
        height: parent.height * 0.1
        width: height
        color: "transparent"
        x: 5
        Image{
            id: backArrowIcon
            anchors.fill: parent
            source: "/../All images/left-arrow.png"
        }

        ColorOverlay {
            id: backArrowOverlay
            anchors.fill: backArrowIcon
            source: backArrowIcon
        }

        signal theme
        onTheme: backArrowOverlay.color = CurrentTheme.getThemeForeColor()

        Component.onCompleted:
        {
            theme()
            themeSet.connect(theme)
        }

        MouseArea{
            anchors.fill: parent
            onClicked: backClicked()
        }
    }

    //Number pad
    Grid {
        id: numberPad
        anchors.top: backArrow.bottom
        columns: 3

        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: oneText
                text: "1"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: oneClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                oneText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: twoText
                text: "2"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: oneClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                twoText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: threeText
                text: "3"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: oneClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                threeText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: fourText
                text: "4"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: oneClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                fourText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: fiveText
                text: "5"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: oneClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                fiveText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: sixText
                text: "6"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: oneClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                sixText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: sevenText
                text: "7"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: sevenClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                sevenText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: eightText
                text: "8"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: eightClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                eightText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            Text{
                id: nineText
                text: "9"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: nineClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                nineText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            id: tenRect
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"

            Text{
                id: tenText
                text: "1"
                font.pointSize: parent.height/2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }

            MouseArea{
                anchors.fill: parent
                onClicked: tenClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                tenText.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"

            Text{
                id: ten2Text
                text: "0"
                font.pointSize: parent.height/2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
            }

            MouseArea{
                anchors.fill: parent
                onClicked: tenClicked()
            }

            signal theme
            onTheme: {
                color = CurrentTheme.getThemeBackColor()
                ten2Text.color = CurrentTheme.getThemeForeColor()
            }

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
        Rectangle{
            id: submitRect
            height: root.height * 0.2
            width: root.width / 3
            color: "transparent"
            border.width: 1

            /*Text{
                id: submitText
                text: "submit"
                font.pointSize: parent.height/2
                anchors.centerIn: parent
            }*/

            PathView{
                anchors.fill: parent
                model: ["S", "u", "b", "m", "i", "t"]
                delegate: Text {
                    text: modelData
                    font.pointSize: parent.height/6

                    signal theme
                    onTheme: color = CurrentTheme.getThemeForeColor()

                    Component.onCompleted:
                    {
                        theme()
                        themeSet.connect(theme)
                    }
                }
                path: Path{
                    startX: 10
                    startY: 10
                    PathLine { x: submitRect.width; y: submitRect.height }
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: submitClicked()
            }

            signal theme
            onTheme: color = CurrentTheme.getThemeBackColor()

            Component.onCompleted:
            {
                theme()
                themeSet.connect(theme)
            }
        }
    }
    //Border for "10"
    Rectangle{
        height: tenRect.height
        width: root.width / 3 * 2
        x: tenRect.x
        y: tenRect.y + (parent.height * 0.1)
        color: "transparent"
        border.width: 1
    }

    //Comment box
    Rectangle{
        id: commentBox
        height: parent.height * 0.1
        width: parent.width
        color: "transparent"
        border.width: 1
        anchors.bottom: parent.bottom

        TextField{
            id: commentText
            placeholderText: "Comment box (optional)"
            anchors.fill: parent
            font.pointSize: parent.height / 4
        }
    }
}

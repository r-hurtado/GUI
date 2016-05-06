import QtQuick 2.5
import QtQuick.Controls 1.4

// Comment out
import QtMultimedia 5.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Poor Man's Snapchat")

    property int xpos
    property int ypos
    property bool is_pen

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        VideoOutput{
            id: vid
            source: camera
            anchors.fill: parent
            visible: parent.visible
            Camera{ id: camera }
        }

        Image
        {
            id: img_crayon
            source: "../../img/crayon.png"
            height: 50
            width: 50
            opacity: 1
            anchors.right: big_wrapper.right
            anchors.rightMargin: 20
            z: 4

            MouseArea
            {
                id: ma_mousearea_crayon
                anchors.fill: parent

                onPressed:
                {
                    img_crayon.opacity = 0.2
                }

                onReleased:
                {
                    img_crayon.opacity = 1
                }

                preventStealing: false
            }
        }

        Image
        {
            id: img_text
            source: "../../img/text.png"
            height: 50
            width: 50
            opacity: 1
            anchors.right: img_crayon.left
            anchors.rightMargin: 20
            z: 4

            MouseArea
            {
                id: ma_mousearea_text
                anchors.fill: parent

                onPressed:
                {
                    img_text.opacity = 0.2
                }

                onReleased:
                {
                    img_text.opacity = 1
                }

                preventStealing: false
            }
        }

        Image
        {
            id: img_pen
            source: "../../img/pen.png"
            height: 50
            width: 50
            opacity: 1
            anchors.right: img_text.left
            anchors.rightMargin: 20
            z: 4

            MouseArea
            {
                id: ma_mousearea_pen
                anchors.fill: parent

                onPressed:
                {
                    img_pen.opacity = 0.2
                    is_pen = !is_pen
                }

                onReleased:
                {
                    img_pen.opacity = 1
                }

                preventStealing: false
            }
        }

        Canvas
        {
            id: canvas_canvas
            anchors.fill: parent

            z: 3

            onPaint:
            {
                var ctx = getContext("2d")
                ctx.fillStyle = "red"
                ctx.lineCap = "round"
                ctx.fillRect(xpos-1, ypos-1, 25, 25)

            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    xpos = mouseX
                    ypos = mouseY
                    if(is_pen)
                        canvas_canvas.requestPaint()
                }
                onMouseXChanged: {
                    xpos = mouseX
                    ypos = mouseY
                    if(is_pen)
                        canvas_canvas.requestPaint()
                }
                onMouseYChanged: {
                    xpos = mouseX
                    ypos = mouseY
                    if(is_pen)
                        canvas_canvas.requestPaint()
                }

                preventStealing: true
            }
        }

        Image
        {
            id: img_camera
            source: "../../img/camera.png"
            height: 50
            width: 50
            opacity: 1

            z:5

            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.bottom: big_wrapper.bottom
            anchors.bottomMargin: 60

            MouseArea
            {
                id: ma_mousearea
                anchors.fill: parent

                onPressed:
                {
                    img_camera.opacity = 0.2
                    se_shutter_camera.play()
                    camera.imageCapture.capture()
                }

                onReleased:
                {
                    img_camera.opacity = 1
                }

                preventStealing: false
            }
        }


        Audio
        {
            id: se_shutter_camera
            source: "../../sound_effects/shutter_camera.mp3"
        }
    }

}

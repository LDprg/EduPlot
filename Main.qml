import QtQuick
import QtCharts
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: "Hello World"

    RowLayout {
        anchors.fill: parent
        Layout.margins: 0

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            spacing: 10

            TextField {
                text: "Hello World"
            }

            Button {
                text: "Click Me"
                onClicked: {
                    line.append(Math.random()*10, Math.random()*10);
                }
            }
        }

        ChartView {
            id: chart
            Layout.fillHeight: true
            Layout.fillWidth: true
            antialiasing: true
            legend.visible: false

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                cursorShape: if (containsPress) Qt.DragMoveCursor

                property real xStart: 0
                property real yStart: 0

                onPressed: {
                    xStart = mouseX
                    yStart = mouseY
                }

                onMouseYChanged: {
                    chart.scrollUp(mouseY - yStart)
                    yStart = mouseY
                }

                onMouseXChanged: {
                    chart.scrollLeft(mouseX - xStart)
                    xStart = mouseX
                }
            }

            LineSeries {
                id: line

                XYPoint {
                    x: 0; y: 0
                }
                XYPoint {
                    x: 6; y: 7
                }
                XYPoint {
                    x: 10; y: 10
                }
            }
        }
    }
}

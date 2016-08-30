import QtQuick 2.0
import Ubuntu.Components 1.1
import Qt.labs.settings 1.0

MainView {
    id: root
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "sensorapp.xiaoguo"

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

//    property string address : "http://192.168.1.103:9000/"
//    property string address: "http://" + settings.ipaddr + ":" + settings.port + "/"
//    property alias ipaddr : settings.ipaddr
//    property alias port : settings.port

    Settings {
        id: settings
        property string ipaddr: "192.168.61.172"
        property string topic: "data"
    }

    Page {
        id: main
        title: i18n.tr("Sensor App")

        ParallaxView {
            id: parallax
            anchors.fill: parent

            Item {
                id: sensors
                property url icon: "images/camera.png"
                width: main.width; height: main.height
                Loader {
                    anchors.fill: parent
                    clip: true;
                    source: "Sensors.qml"
                }
            }

            Item {
                property url icon: "images/setting.png"
                width: main.width; height: main.height
                Loader {
                    id: setting
                    anchors { top: parent.top; horizontalCenter: parent.horizontalCenter }
                    width: main.width; height: main.height
                    clip: true;
                    source: "Settings.qml"
                }
            }
        }
    }
}


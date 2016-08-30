import QtQuick 2.0
import Ubuntu.Components 1.1
import Sensorapp 1.0

Item {

    function interpreteData(data) {
//        console.log("json: " + JSON.stringify(json));
        var json = JSON.parse(data)

        console.log("Temp: " + json.Temp)
        console.log("Humidity: " + json.Humidity)

        var temp = json.Temp
        var value = temp.replace(/[\(\)]/g,'').split(',');
        console.log("temp[0]: " + value[0])
        console.log("temp[1]: " + value[1])
        meter.appendDataPoint( value[0] )

        var humi = json.Humidity
        value = humi.replace(/[\(\)]/g,'').split(',');
        console.log("humidity[0]: " + value[0])
        console.log("humidity[1]: " + value[1])
        meter1.appendDataPoint( value[0] )
    }

    MQTT {
        id: _MQTT
        host: "192.168.61.172"
        port: 1883
        topic: "data"
        username: "guest"
        password: "guest"
        onMessageReceived: {
            interpreteData(message)
        }
        onDisconnected: {
            _MQTT.connect();
        }
    }

    Timer {
        id: timer;
        interval: 3000;
        repeat: false;
        running: true;

        onTriggered: {
            line.visible = false
        }
    }

    Column {
        spacing: units.gu(2)
        anchors.fill: parent

        Rectangle {
            id: line
            height: 0.01
            width: parent.width
        }

        PlotArea {
            height: parent.height/2 - parent.spacing/2
            width: parent.width

            yScaleEngine: FixedScaleEngine {
                max: 30
                min: -10
            }

            items: [
                ScrollingCurve {
                    id: meter
                    numPoints: 50
                    color: "red"
                }
            ]
        }

        Rectangle {
            id: line1
            height: 0.1
            width: parent.width
        }

        PlotArea {
            id: plotarea1
            height: parent.height/2 - parent.spacing/2
            width: parent.width

            yScaleEngine: FixedScaleEngine {
                max: 30
                min: 0
            }

            items: [
                ScrollingCurve {
                    id: meter1
                    numPoints: 50
                }
            ]
        }
    }
}

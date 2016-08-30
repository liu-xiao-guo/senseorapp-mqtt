import QtQuick 2.0
import Ubuntu.Components 1.1

Item {

    Column {
        id: layout
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
        }

        Row {
            Label { anchors.verticalCenter: parent.verticalCenter;text: "IP Address: "}
            TextField {
                id: ipaddress
                placeholderText: "Please input IP address"
                text: settings.ipaddr

                onTextChanged: {
                    settings.ipaddr = text;
                }
            }
        }

        Row {
            Label { anchors.verticalCenter: parent.verticalCenter; text: "Port:             " }
            TextField {
                id: topic
                placeholderText: "Please input topic"
                text: settings.topic
                onTextChanged: {
                    settings.topic = text;
                }

            }
        }
    }
}


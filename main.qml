/*
 * Copyright (C) 2020 - Louis Marchand <prog@tioui.com>
 * Copyright (C) 2016 - Sylvia van Os <iamsylvie@openmailbox.org>
 * Copyright (C) 2015 - Florent Revest <revestflo@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import org.asteroid.controls 1.0
import org.asteroid.utils 1.0

Application {
    id: app

    centerColor: "#4b45b9"
    outerColor: "#161537"

    Component { id: timeLayer;       TimePage       { } }
    Component { id: dateLayer;       DatePage       { } }
    Component { id: languageLayer;   LanguagePage   { } }
    Component { id: vibrationLayer;  VibrationPage  { } }
    Component { id: bluetoothLayer;  BluetoothPage  { } }
    Component { id: brightnessLayer; BrightnessPage { } }
    Component { id: soundLayer;      SoundPage      { } }
    Component { id: unitsLayer;      UnitsPage      { } }
    Component { id: wallpaperLayer;  WallpaperPage  { } }
    Component { id: watchfaceLayer;  WatchfacePage  { } }
    Component { id: usbLayer;        USBPage        { } }
    Component { id: poweroffLayer;   PoweroffPage   { } }
    Component { id: rebootLayer;     RebootPage     { } }
    Component { id: aboutLayer;      AboutPage      { } }

    LayerStack {
        id: layerStack
        firstPage: firstPageComponent
    }

    Component {
        id: firstPageComponent

        Flickable {
            function elementsNb() {
                var nb = 12;
                if(DeviceInfo.hasSpeaker) nb ++
                return nb;
            }
            contentHeight: elementsNb()*Dims.h(16) + (DeviceInfo.hasRoundScreen ? Dims.h(20) : 0)
            contentWidth: width
            boundsBehavior: Flickable.DragOverBounds
            flickableDirection: Flickable.VerticalFlick

            Column {
                anchors.fill: parent

                Item { width: parent.width; height: DeviceInfo.hasRoundScreen ? Dims.h(10) : 0 }

                ListItem {
                    //% "Time"
                    title: qsTrId("id-time-page")
                    iconName: "ios-clock-outline"
                    onClicked: layerStack.push(timeLayer)
                }
                ListItem {
                    //% "Date"
                    title: qsTrId("id-date-page")
                    iconName: "ios-calendar-outline"
                    onClicked: layerStack.push(dateLayer)
                }
                ListItem {
                    //% "Language"
                    title: qsTrId("id-language-page")
                    iconName: "ios-globe-outline"
                    onClicked: layerStack.push(languageLayer)
                }
                ListItem {
                    //% "Vibration"
                    title: qsTrId("id-vibration-page")
                    iconName: "ios-watch-vibrating"
                    onClicked: layerStack.push(vibrationLayer)
                }
                ListItem {
                    //% "Bluetooth
                    title: qsTrId("id-bluetooth-page")
                    iconName: "ios-bluetooth-outline"
                    onClicked: layerStack.push(bluetoothLayer)
                }
                ListItem {
                    //% "Brightness"
                    title: qsTrId("id-brightness-page")
                    iconName: "ios-sunny-outline"
                    onClicked: layerStack.push(brightnessLayer)
                }
                ListItem {
                    //% "Sound"
                    title: qsTrId("id-sound-page")
                    iconName: "ios-volume-up"
                    onClicked: layerStack.push(soundLayer)
                    height: DeviceInfo.hasSpeaker ? Dims.h(16) : 0
                    clip: true
                }
                ListItem {
                    //% "Units"
                    title: qsTrId("id-units-page")
                    iconName: "ios-speedometer-outline"
                    onClicked: layerStack.push(unitsLayer)
                }
                ListItem {
                    //% "Wallpaper"
                    title: qsTrId("id-wallpaper-page")
                    iconName: "ios-images-outline"
                    onClicked: layerStack.push(wallpaperLayer)
                }
                ListItem {
                    //% "Watchface"
                    title: qsTrId("id-watchface-page")
                    iconName: "ios-color-wand-outline"
                    onClicked: layerStack.push(watchfaceLayer)
                }
                ListItem {
                    //% "USB"
                    title: qsTrId("id-usb-page")
                    iconName: "ios-usb"
                    onClicked: layerStack.push(usbLayer)
                }
                ListItem {
                    //% "Power Off"
                    title: qsTrId("id-poweroff-page")
                    iconName: "ios-power-outline"
                    onClicked: layerStack.push(poweroffLayer)
                }
                ListItem {
                    //% "Reboot"
                    title: qsTrId("id-reboot-page")
                    iconName: "ios-sync"
                    onClicked: layerStack.push(rebootLayer)
                }
                ListItem {
                    //% "About"
                    title: qsTrId("id-about-page")
                    iconName: "ios-help-circle-outline"
                    onClicked: layerStack.push(aboutLayer)
                }

                Item { width: parent.width; height: DeviceInfo.hasRoundScreen ? Dims.h(10) : 0 }
            }
        }
    }
}

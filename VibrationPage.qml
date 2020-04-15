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
import org.freedesktop.contextkit 1.0
import Nemo.DBus 2.0
import org.nemomobile.systemsettings 1.0
import Nemo.Ngf 1.0

Item {
	ProfileControl {
         id: profileControl
    }

    NonGraphicalFeedback {
            id: feedback
            event: "press"
        }

    Timer {
            id: delayTimer
            interval: 125
            repeat: false
            onTriggered: feedback.play()
        }

    StatusPage {
        //% "Vibration on"
        property string vibrationOnStr: qsTrId("id-vibration-on")
        //% "Vibration off"
        property string vibrationOffStr: qsTrId("id-vibration-off")
        text: "<h3>" + (profileControl.profile == "general" ? vibrationOnStr : vibrationOffStr) + "</h3>"
		icon: "ios-watch-vibrating"
        clickable: true
        onClicked:
        {
            if (profileControl.profile === "general") {
                profileControl.profile = "silent"
            } else {
                profileControl.profile = "general"
                delayTimer.start()
            }
        }
        activeBackground: profileControl.profile === "general"
    }
}


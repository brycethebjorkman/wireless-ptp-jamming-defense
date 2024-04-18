//
// Copyright (C) 2011 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package tcs_proj.simulations.wirelessgptp_pcaprecorder;

import inet.environment.common.PhysicalEnvironment;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import wirelessgptp.wGptpMaster;
import wirelessgptp.wGptpSlave;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

network wGptpPcapRecorder
{
    parameters:
        @display("bgb=650,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="packets received: %g"; initialValue=0);
        @statistic[packetReceived](source=host2.app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=256.032,278.208");
        }
        host1: wGptpMaster {
            parameters:
                @display("p=50,325");
        }
        host2: wGptpSlave {
            parameters:
                @display("p=450,325");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=49.392002,159.264;is=s");
        }
        physicalEnvironment: PhysicalEnvironment {
            parameters:
                @display("p=256.032,159.264");
        }
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=449.56802,159.264");
        }
}


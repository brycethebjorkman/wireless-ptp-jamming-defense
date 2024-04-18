//
// Copyright (C) 2011 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package tcs_proj.simulations.gptp_pcaprecorder;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.linklayer.ieee8021as.GptpMaster;
import inet.linklayer.ieee8021as.GptpSlave;
import ned.DatarateChannel;
import inet.visualizer.contract.IIntegratedVisualizer;

network GptpPcapRecorder
{
    parameters:
        @display("bgb=650,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="packets received: %g"; initialValue=0);
        @statistic[packetReceived](source=host2.app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);
    types:
        channel C extends DatarateChannel
        {
            datarate = 100Mbps;
            delay = 0.1us;
        }
    submodules:
        host1: GptpMaster {
            parameters:
                @display("p=250,100;i=device/pc3");
        }
        host2: GptpSlave {
            parameters:
                @display("p=250,200;i=device/pc3");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=100,100;is=s");
        }
	    visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=580,125");
        }
	connections:
        host1.ethg++ <--> C <--> host2.ethg++;
}


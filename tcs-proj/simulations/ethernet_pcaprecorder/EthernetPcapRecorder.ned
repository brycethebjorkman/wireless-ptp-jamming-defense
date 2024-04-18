//
// Copyright (C) 2011 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package tcs_proj.simulations.ethernet_pcaprecorder;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.StandardHost;
import ned.DatarateChannel;

network EthernetPcapRecorder
{
    types:
        channel C extends DatarateChannel
        {
            datarate = 10Mbps;
            delay = 0.1us;
        }
    submodules:
        host1: StandardHost {
            parameters:
                @display("p=250,100;i=device/pc3");
        }
        host2: StandardHost {
            parameters:
                @display("p=250,200;i=device/pc3");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=100,100;is=s");
        }
	connections:
        host1.ethg++ <--> C <--> host2.ethg++;
}


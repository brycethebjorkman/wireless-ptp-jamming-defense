//
// SPDX-License-Identifier: LGPL-3.0-or-later
//

package tcs_proj.simulations.wireless_pcaprecorder3;

import inet.environment.common.PhysicalEnvironment;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.StandardHost;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

network WirelessPcapRecorder3
{
    parameters:
        @display("bgb=650,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="packets received: %g"; initialValue=0);
        @statistic[packetReceived](source=host2.app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);

    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
            	@display("p=580,275");
        }
        physicalEnvironment: PhysicalEnvironment {
            parameters:
                @display("p=580,425");
        }
        host1: StandardHost {
            parameters:
                @display("p=50,325");
        }
        host2: StandardHost {
            parameters:
                @display("p=450,325");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=580,200");
        }
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=580,125");
        }
}


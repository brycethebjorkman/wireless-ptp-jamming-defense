//
// @authors: Enkhtuvshin Janchivnyambuu
//           Henning Puttnies
//           Peter Danielis
//           University of Rostock, Germany
//

package wirelessgptp;

import inet.applications.contract.IApp;
import inet.node.inet.StandardHost;

//
// This module implements a gPTP end station that contains a clock module and
// a gPTP protocol.
//
module wGptpEndstation extends StandardHost
{
    parameters:
        clock.typename = default("SettableClock");
    submodules:
        gptp: <default("wGptp")> like IApp if typename != "" {
            @display("p=700.11755,75.166");
        }
    connections:
        gptp.socketOut --> at.in++ if exists(gptp);
        at.out++ --> gptp.socketIn if exists(gptp);
}


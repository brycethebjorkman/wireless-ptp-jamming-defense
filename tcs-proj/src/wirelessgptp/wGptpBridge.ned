//
// @authors: Enkhtuvshin Janchivnyambuu
//           Henning Puttnies
//           Peter Danielis
//           University of Rostock, Germany
//

package wirelessgptp;

import inet.node.ethernet.EthernetSwitch;

//
// This module implements a gPTP bridge network node.
//
module wGptpBridge extends EthernetSwitch
{
    parameters:
        hasGptp = true;
}

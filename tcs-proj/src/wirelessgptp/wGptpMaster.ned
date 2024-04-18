//
// @authors: Enkhtuvshin Janchivnyambuu
//           Henning Puttnies
//           Peter Danielis
//           University of Rostock, Germany
//

package wirelessgptp;

//
// This module provide a gPTP master network node.
//
module wGptpMaster extends wGptpEndstation
{
    parameters:
        @display("i=device/pc2");
        forwarding = default(false);  // disable routing by default
        networkLayer.proxyARP = default(false);
        gptp.gptpNodeType = "MASTER_NODE"; // @enum("gptpNodeType"): MASTER_NODE, BRIDGE_NODE, SLAVE_NODE
    connections allowunconnected:
}

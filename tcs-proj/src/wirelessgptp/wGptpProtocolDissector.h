//
// Copyright (C) 2018 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


#ifndef __INET_GPTPPROTOCOLDISSECTOR_H
#define __INET_GPTPPROTOCOLDISSECTOR_H

#include "inet/common/packet/dissector/ProtocolDissector.h"

using namespace omnetpp;
using namespace inet;

namespace physicallayer {

class INET_API wGptpProtocolDissector : public DefaultProtocolDissector
{
  public:
    virtual void dissect(Packet *packet, const Protocol *protocol, ICallback& callback) const override;
};

} // namespace physicallayer

#endif


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:52690 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752443AbZGaQrk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Jul 2009 12:47:40 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <200907311730.08804.elendil@planet.nl>
References: <200907311730.08804.elendil@planet.nl> <200907311227.20132.elendil@planet.nl> <17615.1249045054@redhat.com>
Subject: Re: RomFS: enless loop during make oldconfig from 2.6.24 -> 2.6.31-rc4 (parisc)
Date: Fri, 31 Jul 2009 17:46:16 +0100
Message-ID: <18884.1249058776@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>

Frans Pop <elendil@planet.nl> wrote:

> I've tried again too. With all defaults I cannot reproduce it either.
> But if I answer the questions below as follows, I do get the loop again:
> 
> Advanced netfilter configuration: N
> Wireless: N
> * sound drivers: N (* = "PCI","USB" and one or two others)
> Default ext3 to "data=ordered": Y

I still don't see it.  I have:

	# CONFIG_NETFILTER_ADVANCED is not set
	# CONFIG_WIRELESS is not set
	# CONFIG_SND_PCI is not set
	# CONFIG_SND_SPI is not set
	# CONFIG_SND_USB is not set
	# CONFIG_SND_GSC is not set
	# CONFIG_SND_SOC is not set
	CONFIG_EXT3_DEFAULTS_TO_ORDERED=y

Can you accept all the defaults, then delete the above symbols from .config
and run make oldconfig again, see if the problem crops up?

David

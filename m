Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:42545 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758542Ab3BVATJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 19:19:09 -0500
Message-ID: <5126B979.5000205@gmail.com>
Date: Thu, 21 Feb 2013 18:19:05 -0600
From: Rob Herring <robherring2@gmail.com>
MIME-Version: 1.0
Subject: Re: [U-Boot] [RFC] Kbuild support for ARM FIT images
References: <20130221103705.GB17852@n2100.arm.linux.org.uk> <51261F38.2030902@ti.com> <20130221134656.GC17852@n2100.arm.linux.org.uk> <51262A7A.8040103@ti.com> <alpine.LFD.2.03.1302211144240.6419@syhkavp.arg> <20130221182724.GA14329@obsidianresearch.com> <alpine.LFD.2.03.1302211423190.6419@syhkavp.arg> <20130221211444.GB20114@obsidianresearch.com> <alpine.LFD.2.03.1302211624561.6419@syhkavp.arg> <20130221231848.880DE200552@gemini.denx.de> <20130221232821.GA2823@obsidianresearch.com>
In-Reply-To: <20130221232821.GA2823@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Wolfgang Denk <wd@denx.de>, "Fernandes, Joel A" <joelagnel@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kbuild@vger.kernel.org, tony@atomide.com, Nicolas Pitre <nico@fluxnic.net>, Grant Likely <grant.likely@secretlab.ca>, u-boot@lists.denx.de, Tom Rini <trini@ti.com>, Grant Likely <glikely@secretlab.ca>, OMAP List <linux-omap@vger.kernel.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>

On 02/21/2013 05:28 PM, Jason Gunthorpe wrote:
> On Fri, Feb 22, 2013 at 12:18:48AM +0100, Wolfgang Denk wrote:
> 
>>> The DT is meant to describe hardware.  As far as I know, the hardware I 
>>> own seems to be rather static and stable, and unlike software there is 
>>> no way I can change it (soldering irons don't count).
>>
>> There is other hardware available (for example FPGA based) where this
>> does not apply.
> 
> Agreed.. We do that here as well, the DT is also used to describe the
> functionality inside FPGA(s). We do things like declare a GPIO
> controller inside the FPGA, then stack the bitbang MDIO/I2C on top of
> that, then declare a bunch of devices on those busses. DT makes this
> extremely straightforward.
> 
> However, it is critical that the DT, kernel and FPGA are matched
> together - we always arrange things so that the DTB, kernel and FPGA
> config are bundled together and update atomically during firmware
> upgrade.
> 
> Xilinx's Zynq is a great example of this kind of stuff, FWIW. IIRC
> Xilinx has a DT generator from their IP tools, so you can literally go
> into their design software, configure the hardware IP blocks, and get
> back a FPGA config and a DT to go with it.
> 

The desired FPGA use case is DT updates after booting the kernel. This
has nothing to do with FIT images. And if the FPGA tools generate the
DTB, then it is certainly not tied to the kernel.

Rob


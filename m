Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.eu.citrix.com ([46.33.159.39]:45236 "EHLO
	SMTP.EU.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753935Ab3EaK3l (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 May 2013 06:29:41 -0400
Message-ID: <1369996170.5199.68.camel@zakaz.uk.xensource.com>
Subject: DTB build failure due to preproccessing
From: Ian Campbell <Ian.Campbell@citrix.com>
Date: Fri, 31 May 2013 11:29:30 +0100
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, JonLoeliger <jdl@jdl.com>, linux-kbuild@vger.kernel.org

This affects arch/powerpc/boot/dts/virtex440-ml510.dts but I think it is
actually a more general issue:

        $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux- virtex440-ml510.dtb 
          CC      scripts/mod/devicetable-offsets.s
          GEN     scripts/mod/devicetable-offsets.h
          HOSTCC  scripts/mod/file2alias.o
          HOSTLD  scripts/mod/modpost
          DTC     arch/powerpc/boot/virtex440-ml510.dtb
        Error: arch/powerpc/boot/dts/virtex440-ml510.dts:374.6-7 syntax error
        FATAL ERROR: Unable to parse input tree
        make[1]: *** [arch/powerpc/boot/virtex440-ml510.dtb] Error 1
        make: *** [virtex440-ml510.dtb] Error 2
        
Line 374 is the "IDSEL 0x16..." line here:
			interrupt-map = <
				/* IRQ mapping for pci slots and ALI M1533
				 ...
				 * management core also isn't used.
				 */

				/* IDSEL 0x16 / dev=6, bus=0 / PCI slot 3 */
				0x3000 0 0 1 &xps_intc_0 3 2
				0x3000 0 0 2 &xps_intc_0 2 2
				0x3000 0 0 3 &xps_intc_0 5 2
				0x3000 0 0 4 &xps_intc_0 4 2

Which gets preprocessed into:
           interrupt-map = <
        # 375 "arch/powerpc/boot/dts/virtex440-ml510.dts"
            0x3000 0 0 1 &xps_intc_0 3 2
            0x3000 0 0 2 &xps_intc_0 2 2
            0x3000 0 0 3 &xps_intc_0 5 2
            0x3000 0 0 4 &xps_intc_0 4 2

If I manually remove the "# 375 " line then that fixes the error
(although there is then a subsequent one of the same type).

I suppose this is a bug in dtc? It appears to have at least some
awareness of these preprocessor line number comments since it manages to
report the original source line number.

Ian.


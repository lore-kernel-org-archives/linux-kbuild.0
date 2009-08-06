Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.perfora.net ([74.208.4.195]:61452 "EHLO mout.perfora.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756805AbZHFVdb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Aug 2009 17:33:31 -0400
Date: Thu, 6 Aug 2009 17:33:29 -0400
From: Andrew <nospam@flight.us>
Subject: problems compiling 2.6.30
Message-ID: <20090806213329.GA31124@infong470.schlund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


I am completely unsure if I am in the right mailing list at all

I was looking for help with kernel compile; googling gives me nothing on this

I suspect because my circumstance is rare:  I can not do a clean install with an ancient RedHat 7.2 (Enigma) (currently running kernel 2.4.7-10 )

I have incrementally upgraded the gcc to 3.4.6 (but fell short of compiling the latest 4.4.1 gcc)

I sucessfully did "make bzImage" and (perhaps) "make modules" (I can see all the newly built *.o objects in the subdirectories)

However!

When I issue "make modules_install" I get this:

]# make modules_install
Warning: you may need to install module-init-tools
See http://www.codemonkey.org.uk/docs/post-halloween-2.6.txt
  INSTALL arch/x86/kernel/test_nx.ko
  INSTALL drivers/scsi/scsi_wait_scan.ko
  INSTALL kernel/configs.ko
  DEPMOD  2.6.30ags1
depmod: /lib/modules/2.6.30ags1/modules.order is not an ELF file
make: *** [_modinst_post] Error 1

I did build and (seemingly) install "module-init-tools", but I still get the above comment about "module-init-tools", and the weird "modules.order is not an ELF file" error  (googling for the latter yields nothing!)

Again, apologies if I have misdirected my questions to the wrong mailing list.

Thanks in advance

Andrew

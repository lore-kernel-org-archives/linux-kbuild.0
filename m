Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:43114 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196AbYBSRiA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2008 12:38:00 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JRWPp-0006UV-5g
	for linux-kbuild@vger.kernel.org; Tue, 19 Feb 2008 12:38:01 -0500
Date: Tue, 19 Feb 2008 12:37:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: one more packaging bug
Message-ID: <alpine.LFD.1.00.0802191224020.14991@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  from a drug-induced fog of semi-coherence, here's what seems to be
an obvious bug in "make rpm-pkg".  the tail end of the output:

Processing files: kernel-2.6.25rc200114g9a4c854dirty-1
error: File not found: /var/tmp/kernel-2.6.25rc200114g9a4c854dirty-root/lib/modules/2.6.25-rc2-00114-g9a4c854-dirty
Checking for unpackaged file(s): /usr/lib/rpm/check-files /var/tmp/kernel-2.6.25rc200114g9a4c854dirty-root
error: Installed (but unpackaged) file(s) found:
   /lib/modules/2.6.25-rc2/build
   /lib/modules/2.6.25-rc2/kernel/drivers/scsi/scsi_wait_scan.ko
   /lib/modules/2.6.25-rc2/modules.alias
   /lib/modules/2.6.25-rc2/modules.ccwmap
   /lib/modules/2.6.25-rc2/modules.dep
   /lib/modules/2.6.25-rc2/modules.ieee1394map
   /lib/modules/2.6.25-rc2/modules.inputmap
   /lib/modules/2.6.25-rc2/modules.isapnpmap
   /lib/modules/2.6.25-rc2/modules.ofmap
   /lib/modules/2.6.25-rc2/modules.order
   /lib/modules/2.6.25-rc2/modules.pcimap
   /lib/modules/2.6.25-rc2/modules.seriomap
   /lib/modules/2.6.25-rc2/modules.symbols
   /lib/modules/2.6.25-rc2/modules.usbmap
   /lib/modules/2.6.25-rc2/source


RPM build errors:
    File not found: /var/tmp/kernel-2.6.25rc200114g9a4c854dirty-root/lib/modules/2.6.25-rc2-00114-g9a4c854-dirty
    Installed (but unpackaged) file(s) found:
   /lib/modules/2.6.25-rc2/build
   /lib/modules/2.6.25-rc2/kernel/drivers/scsi/scsi_wait_scan.ko
   /lib/modules/2.6.25-rc2/modules.alias
   /lib/modules/2.6.25-rc2/modules.ccwmap
   /lib/modules/2.6.25-rc2/modules.dep
   /lib/modules/2.6.25-rc2/modules.ieee1394map
   /lib/modules/2.6.25-rc2/modules.inputmap
   /lib/modules/2.6.25-rc2/modules.isapnpmap
   /lib/modules/2.6.25-rc2/modules.ofmap
   /lib/modules/2.6.25-rc2/modules.order
   /lib/modules/2.6.25-rc2/modules.pcimap
   /lib/modules/2.6.25-rc2/modules.seriomap
   /lib/modules/2.6.25-rc2/modules.symbols
   /lib/modules/2.6.25-rc2/modules.usbmap
   /lib/modules/2.6.25-rc2/source
make[1]: *** [rpm-pkg] Error 1
make: *** [rpm-pkg] Error 2

  the problem seems obvious -- the "name" of the eventual package is
designed to be some variation of the output of "git describe", which
could very well look like, well, "2.6.25rc200114g9a4c854dirty-root"

  but when rpmbuild is trying to create the package, i'm guessing it
whacks off everything after the second "-" since those symbols mean
something special to rpmbuild.  thus, you get the truncated directory
name of "2.6.25-rc2", which doesn't match what the packaging script is
expecting, and it chokes.  just need to make all those names
consistent, i'm guessing.

rday
--
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================

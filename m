Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:39947 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757898AbYBRTbu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 14:31:50 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JRBiO-0002Yy-7H
	for linux-kbuild@vger.kernel.org; Mon, 18 Feb 2008 14:31:48 -0500
Date: Mon, 18 Feb 2008 14:31:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: "remote" packaging is definitely broken
Message-ID: <alpine.LFD.1.00.0802181428390.4487@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  i'm sure you're excited to hear from me again, but i've found a few
more bugs in the packaging targets.  one appears to be fairly obvious
-- from scripts/package/Makefile:

...
rpm-pkg rpm: $(objtree)/kernel.spec FORCE
        $(MAKE) clean
        $(PREV) ln -sf $(srctree) $(KERNELPATH)
        $(PREV) tar -cz $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(KERNELPATH)/.
        $(PREV) rm $(KERNELPATH)
...

  if you're packaging remotely (that is, using "make O=..."), you can
see how the kernel.spec file is created in the obj dir, but it's the
src dir that's bundled up with tar.  pretty sure that's not going to
work, but i haven't looked closely enough to know if a simple textual
change there is going to fix it -- i'm currently fighting off a wicked
cold and am only marginally coherent.

  there's one more flaw in packaging, but i'll flesh it out more
completely before i post it.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:48007 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756949AbYBMQqG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Feb 2008 11:46:06 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JPKkG-0000zQ-BI
	for linux-kbuild@vger.kernel.org; Wed, 13 Feb 2008 11:46:04 -0500
Date: Wed, 13 Feb 2008 11:46:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: unnecessary "tristate"ness in Kconfig files
Message-ID: <alpine.LFD.1.00.0802131142210.9575@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  can someone correct me if my thinking is out of whack here?
consider init/Kconfig:

...
config IKCONFIG
        tristate "Kernel .config support"
        ---help---
          This option enables the complete Linux kernel ".config" file
          contents to be saved in the kernel. It provides documentation
          of which kernel options are used in a running kernel or in an
          on-disk kernel.  This information can be extracted from the kernel
          image file with the script scripts/extract-ikconfig and used as
          input to rebuild the current kernel or to build another kernel.
          It can also be extracted from a running kernel by reading
          /proc/config.gz if enabled (below).

config IKCONFIG_PROC
        bool "Enable access to .config through /proc/config.gz"
        depends on IKCONFIG && PROC_FS
        ---help---
          This option enables access to the kernel configuration file
          through /proc/config.gz.
...

  now why is IKCONFIG tristate instead of simple bool?  it's used
solely as a dependency for IKCONFIG_PROC, and that's used in
kernel/configs.c thusly:

...
#ifdef CONFIG_IKCONFIG_PROC
...
#endif
...

  so it's easy to see that it should be selectable, but it's *not*
clear to see why it should be *tristate*.  what is the value of its
tristate-ness?  thanks.

rday
--
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================

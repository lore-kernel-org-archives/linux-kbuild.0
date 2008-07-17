Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:54526 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755204AbYGQLFd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Jul 2008 07:05:33 -0400
Received: from cpe00195b4acfae-cm001868e2bdba.cpe.net.cable.rogers.com ([99.236.99.222] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1KJRIh-00017O-2u
	for linux-kbuild@vger.kernel.org; Thu, 17 Jul 2008 07:05:31 -0400
Date: Thu, 17 Jul 2008 07:04:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: what is the value of "help" text on a choice?
Message-ID: <alpine.LFD.1.10.0807170701200.14326@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  i just noticed this in init/Kconfig:

...
choice
        prompt "Choose SLAB allocator"
        default SLUB
        help
           This option allows to select a slab allocator.

config SLAB
        bool "SLAB"
        help
          The regular slab allocator that is established and known to work
          well in all environments. It organizes cache hot objects in
          per cpu and per node queues. SLAB is the default choice for
          a slab allocator.
...

  but while there is some help text associated with the "choice"
entry, i don't see how you can display it while in "make menuconfig".

  you can certainly display the help info for each of the actual
underlying choices, but not for the choice entry itself.  or am i
missing something here?

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================

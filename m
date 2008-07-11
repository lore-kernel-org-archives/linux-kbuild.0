Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:52234 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753813AbYGKSgs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2008 14:36:48 -0400
Received: from chimera.site ([96.225.228.12]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Fri, 11 Jul 2008 11:36:45 -0700
Date: Fri, 11 Jul 2008 11:36:45 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: localversion filter *.orig ?
Message-Id: <20080711113645.35923e25.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: samr <sam@ravnborg.org>

Hi,

When using linux-next from linux-mainline tarball + patch*next.bz2,
there is always (AFAIK) a localversion-next.orig file:

$ ls -l localver*
-rw-r--r-- 1 rddunlap users 15 Jul 11 08:05 localversion-next
---------- 1 rddunlap users  0 Jul 11 08:05 localversion-next.orig

This causes a warning during build:

cat: /local/linsrc/linux-next-20080711/localversion-next.orig: Permission denied

Can localver*.orig be filtered out of the localversion files?


PS:  where are $(shell,sort,filter,filter-out,subst,patsubst,etc.) documented?

Thanks,
---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/

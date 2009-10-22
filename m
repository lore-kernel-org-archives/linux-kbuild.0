Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:33001 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752494AbZJVTwV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Oct 2009 15:52:21 -0400
Received: from chimera.site ([96.253.169.185]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 22 Oct 2009 12:52:23 -0700
Date: Thu, 22 Oct 2009 12:52:23 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: unifdef problem (xen)
Message-Id: <20091022125223.66610093.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, jeremy@goop.org

Hi,

I'm using xen.git
<git://git.kernel.org/pub/scm/linux/kernel/git/jeremy/xen.git>.

When I build allmodconfig on x86_64 (with O=xx64), I see this warning:


unifdef: /xen/xx64/usr/include/xen/privcmd.h.tmp: 79: Premature EOF (#if line 33 depth 1)
unifdef: output may be truncated


The original file contains:
#ifndef __user
#define __user
#endif

and the generated/unifdef output file contains:
#ifndef #define #endif

all on one line.

Is this expected/normal?  Is this a problem with unifdef or with something
in xen.git?

thanks,
---
~Randy

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57592 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747Ab2K2SpL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Nov 2012 13:45:11 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so10753311pbc.19
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Nov 2012 10:45:10 -0800 (PST)
Date: Thu, 29 Nov 2012 10:41:33 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/2] Remove __dev* sections from the kernel
Message-ID: <20121129184133.GA15110@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Jim Cromie <jim.cromie@gmail.com>, Borislav Petkov <borislav.petkov@amd.com>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Michal Marek <mmarek@suse.cz>, Tony Lindgren <tony@atomide.com>, Jonathan Kliegman <kliegs@chromium.org>, Chris Zankel <chris@zankel.net>
Cc: Bill Pemberton <wfp5p@viridian.itc.virginia.edu>, Fengguang Wu <fengguang.wu@intel.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

With the recent work to remove CONFIG_HOTPLUG, we are starting to get a
bunch of __devinit section warnings, despite CONFIG_HOTPLUG always being
enabled.  So lets remove these false warnings by removing the check for
them in the modpost.c tool.  Also, lets stop marking the sections
entirely, so define away the section markings in init.h

I'll queue these two patches up through my driver-core git tree, which
has the bulk of the __dev* marking removal patches in it.  If anyone has
any objections to this, please let me know.

thanks,

greg k-h

---
 include/linux/init.h  |   18 +++++++-----------
 scripts/mod/modpost.c |   24 ++++++++++--------------
 2 files changed, 17 insertions(+), 25 deletions(-)


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:57923 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757261Ab2K3Url (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Nov 2012 15:47:41 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so373326dak.19
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Nov 2012 12:47:40 -0800 (PST)
Date: Fri, 30 Nov 2012 12:47:36 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] init.h: Remove __dev* sections from the kernel
Message-ID: <20121130204736.GB32483@kroah.com>
References: <20121129184133.GA15110@kroah.com>
 <20121129184328.GB15110@kroah.com>
 <50B9198F.7050806@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50B9198F.7050806@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Jim Cromie <jim.cromie@gmail.com>, Borislav Petkov <borislav.petkov@amd.com>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Michal Marek <mmarek@suse.cz>, Tony Lindgren <tony@atomide.com>, Jonathan Kliegman <kliegs@chromium.org>, Chris Zankel <chris@zankel.net>, Bill Pemberton <wfp5p@viridian.itc.virginia.edu>, Fengguang Wu <fengguang.wu@intel.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Nov 30, 2012 at 12:39:43PM -0800, H. Peter Anvin wrote:
> On 11/29/2012 10:43 AM, Greg Kroah-Hartman wrote:
> >
> >-/* Used for HOTPLUG */
> >-#define __devinit        __section(.devinit.text) __cold notrace
> >-#define __devinitdata    __section(.devinit.data)
> >-#define __devinitconst   __constsection(.devinit.rodata)
> >-#define __devexit        __section(.devexit.text) __exitused __cold notrace
> >-#define __devexitdata    __section(.devexit.data)
> >-#define __devexitconst   __constsection(.devexit.rodata)
> >+/* Used for HOTPLUG, but that is always enabled now, so just make them noops */
> >+#define __devinit
> >+#define __devinitdata
> >+#define __devinitconst
> >+#define __devexit
> >+#define __devexitdata
> >+#define __devexitconst
> >
> 
> Second question... what about the __exitused __cold notrace annotations?

__exitused shouldn't matter, we shouldn't be optimizing these away at
all anymore.  I don't know about __cold and notrace, but given that
these could be traced, I don't see why that marking got there in the
first place.

In reading compiler-gcc4.h, and knowing just how infrequent these
functions are ever called, I would be amazed if the __cold marking ever
even helped anything out here.

thanks,

greg k-h

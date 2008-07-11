Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:43689 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754509AbYGKT0K (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2008 15:26:10 -0400
Received: from chimera.site ([96.225.228.12]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Fri, 11 Jul 2008 12:26:07 -0700
Date: Fri, 11 Jul 2008 12:26:07 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: localversion filter *.orig ?
Message-Id: <20080711122607.47f87ac7.rdunlap@xenotime.net>
In-Reply-To: <20080711191432.GA26256@uranus.ravnborg.org>
References: <20080711113645.35923e25.rdunlap@xenotime.net>
	<20080711191432.GA26256@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Fri, 11 Jul 2008 21:14:32 +0200 Sam Ravnborg wrote:

> On Fri, Jul 11, 2008 at 11:36:45AM -0700, Randy Dunlap wrote:
> > Hi,
> > 
> > When using linux-next from linux-mainline tarball + patch*next.bz2,
> > there is always (AFAIK) a localversion-next.orig file:
> > 
> > $ ls -l localver*
> > -rw-r--r-- 1 rddunlap users 15 Jul 11 08:05 localversion-next
> > ---------- 1 rddunlap users  0 Jul 11 08:05 localversion-next.orig
> > 
> > This causes a warning during build:
> > 
> > cat: /local/linsrc/linux-next-20080711/localversion-next.orig: Permission denied
> > 
> > Can localver*.orig be filtered out of the localversion files?
> I would prefer -next to avoid this file as preference to special
> rules in kbuild.

-next doesn't make the .orig file.  patch -b does that, so I'll just fix that
in my scripts.  My bad.

> > 
> > PS:  where are $(shell,sort,filter,filter-out,subst,patsubst,etc.) documented?
> make info
> 
> See the section "Functions for Transforming Text".

ic, thanks.

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/

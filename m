Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:35816 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753217AbYGKTN5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2008 15:13:57 -0400
Date: Fri, 11 Jul 2008 21:14:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: localversion filter *.orig ?
Message-ID: <20080711191432.GA26256@uranus.ravnborg.org>
References: <20080711113645.35923e25.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080711113645.35923e25.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

On Fri, Jul 11, 2008 at 11:36:45AM -0700, Randy Dunlap wrote:
> Hi,
> 
> When using linux-next from linux-mainline tarball + patch*next.bz2,
> there is always (AFAIK) a localversion-next.orig file:
> 
> $ ls -l localver*
> -rw-r--r-- 1 rddunlap users 15 Jul 11 08:05 localversion-next
> ---------- 1 rddunlap users  0 Jul 11 08:05 localversion-next.orig
> 
> This causes a warning during build:
> 
> cat: /local/linsrc/linux-next-20080711/localversion-next.orig: Permission denied
> 
> Can localver*.orig be filtered out of the localversion files?
I would prefer -next to avoid this file as preference to special
rules in kbuild.

> 
> PS:  where are $(shell,sort,filter,filter-out,subst,patsubst,etc.) documented?
make info

See the section "Functions for Transforming Text".

	Sam

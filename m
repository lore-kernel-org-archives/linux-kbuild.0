Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:15574 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583Ab2ISUkm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Sep 2012 16:40:42 -0400
Date: Wed, 19 Sep 2012 22:40:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Do I have to rename file when a module changes dependency from
	1 file to 2 file?
Message-ID: <20120919204039.GA8293@merkur.ravnborg.org>
References: <1348013997.9977.138.camel@schen9-DESK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348013997.9977.138.camel@schen9-DESK>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Sep 18, 2012 at 05:19:57PM -0700, Tim Chen wrote:
> Currently I have a module foo that has only 1 file foo.c.  However, I
> need to add another assembly file (bar.S) to the module and wonder what
> is the best way to modify the Makefile without having to rename foo.c.
> 
> My original Makefile looks like:
> 
> obj-$(CONFIG_FOO) += foo.o
> 
> I have to rename foo.c to baz.c, then update the Makefile as below to
> get things to work.
> 
> obj-$(CONFIG_FOO) += foo.o
> foo-y := baz.o bar.S
> 
> However, is there a way to change the Makefile so I don't have to
> rename foo.c?  That will reduce the size of the patch I have to
> generate.  Any suggestions are greatly appreciated.

You need to rename the file - there are no other options.

With respect to patch size.
Patch 1/2 is the renaming + Makefile. If you use git use "-D -M" options IIRC.
Patch 2/2 is the actual code changes.

So you do not hide your code changes in the renaming.

	Sam

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:40798 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752225Ab2IUAQ5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Sep 2012 20:16:57 -0400
Subject: Re: Do I have to rename file when a module changes dependency from
 1 file to 2 file?
From: Tim Chen <tim.c.chen@linux.intel.com>
In-Reply-To: <20120919204039.GA8293@merkur.ravnborg.org>
References: <1348013997.9977.138.camel@schen9-DESK>
	 <20120919204039.GA8293@merkur.ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 20 Sep 2012 17:16:57 -0700
Message-ID: <1348186617.9977.146.camel@schen9-DESK>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, 2012-09-19 at 22:40 +0200, Sam Ravnborg wrote:
> On Tue, Sep 18, 2012 at 05:19:57PM -0700, Tim Chen wrote:
> > Currently I have a module foo that has only 1 file foo.c.  However, I
> > need to add another assembly file (bar.S) to the module and wonder what
> > is the best way to modify the Makefile without having to rename foo.c.
> > 
> > My original Makefile looks like:
> > 
> > obj-$(CONFIG_FOO) += foo.o
> > 
> > I have to rename foo.c to baz.c, then update the Makefile as below to
> > get things to work.
> > 
> > obj-$(CONFIG_FOO) += foo.o
> > foo-y := baz.o bar.S
> > 
> > However, is there a way to change the Makefile so I don't have to
> > rename foo.c?  That will reduce the size of the patch I have to
> > generate.  Any suggestions are greatly appreciated.
> 
> You need to rename the file - there are no other options.
> 
> With respect to patch size.
> Patch 1/2 is the renaming + Makefile. If you use git use "-D -M" options IIRC.

Thanks.  The "-M" option works pretty well for my purpose.


Tim



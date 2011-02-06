Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:48717 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752607Ab1BFQfO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Feb 2011 11:35:14 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Sun, 6 Feb 2011 08:35:13 -0800
Date: Sun, 6 Feb 2011 08:35:12 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: Why is linux-kbuild/doc dropping some of my mails?
Message-Id: <20110206083512.a29f4d9c.rdunlap@xenotime.net>
In-Reply-To: <20110206160500.GA12451@ulf>
References: <20110206154831.GA12296@ulf>
	<20110206075734.e912fe70.rdunlap@xenotime.net>
	<20110206160500.GA12451@ulf>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

On Sun, 6 Feb 2011 17:05:01 +0100 Ulf Magnusson wrote:

> On Sun, Feb 06, 2011 at 07:57:34AM -0800, Randy Dunlap wrote:
> > On Sun, 6 Feb 2011 16:48:32 +0100 Ulf Magnusson wrote:
> > 
> > > linux-kbuild and linux-doc dropped both of my Kconfiglib patches, while
> > > linux-kernel accepted them:
> > > https://lkml.org/lkml/2011/2/1/439 (initial)
> > > https://lkml.org/lkml/2011/2/5/174 (version 2)
> > > 
> > > Any idea why? Looked over SubmittingPatches but couldn't find anything
> > > obvious.
> > 
> > AFAIK, lkml has a message size limit of 300 KB or 400 KB, while
> > kbuild and doc have a limit of (probably) 100 KB.
> > 
> Version 2 is only 13k though - it builds on the first one.

OK, then you can try some of the Supplementary tools at
http://vger.kernel.org/ and/or check the taboo list to see if your
patch includes things that are not allowed:
http://vger.kernel.org/majordomo-info.html#taboo

If all else fails, you can ask <postmaster@vger.kernel.org> .

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

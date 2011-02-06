Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:34621 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753348Ab1BFRdJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Feb 2011 12:33:09 -0500
Date: Sun, 6 Feb 2011 18:33:00 +0100
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: Why is linux-kbuild/doc dropping some of my mails?
Message-ID: <20110206173259.GA12461@ulf>
References: <20110206154831.GA12296@ulf>
 <20110206075734.e912fe70.rdunlap@xenotime.net>
 <20110206160500.GA12451@ulf>
 <20110206083512.a29f4d9c.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20110206083512.a29f4d9c.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

On Sun, Feb 06, 2011 at 08:35:12AM -0800, Randy Dunlap wrote:
> On Sun, 6 Feb 2011 17:05:01 +0100 Ulf Magnusson wrote:
> 
> > On Sun, Feb 06, 2011 at 07:57:34AM -0800, Randy Dunlap wrote:
> > > On Sun, 6 Feb 2011 16:48:32 +0100 Ulf Magnusson wrote:
> > > 
> > > > linux-kbuild and linux-doc dropped both of my Kconfiglib patches, while
> > > > linux-kernel accepted them:
> > > > https://lkml.org/lkml/2011/2/1/439 (initial)
> > > > https://lkml.org/lkml/2011/2/5/174 (version 2)
> > > > 
> > > > Any idea why? Looked over SubmittingPatches but couldn't find anything
> > > > obvious.
> > > 
> > > AFAIK, lkml has a message size limit of 300 KB or 400 KB, while
> > > kbuild and doc have a limit of (probably) 100 KB.
> > > 
> > Version 2 is only 13k though - it builds on the first one.
> 
> OK, then you can try some of the Supplementary tools at
> http://vger.kernel.org/ and/or check the taboo list to see if your
> patch includes things that are not allowed:
> http://vger.kernel.org/majordomo-info.html#taboo
> 
> If all else fails, you can ask <postmaster@vger.kernel.org> .
> 
Never mind, it appears at http://www.spinics.net/lists/linux-kbuild/
now. Strangely, so does this thread. Maybe I just got lucky with the
timing, or the archive updates work in mysterious ways..

Excuse the spam.

/Ulf

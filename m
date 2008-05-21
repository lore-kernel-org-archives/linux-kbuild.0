Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:41593 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756273AbYEUIgf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 04:36:35 -0400
Date: Wed, 21 May 2008 04:36:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] KBUILD: Move non-__KERNEL__-checking headers to
 header-y.
In-Reply-To: <20080520000835.80f7b14a.akpm@linux-foundation.org>
Message-ID: <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain> <20080520000835.80f7b14a.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, 20 May 2008, Andrew Morton wrote:

> On Sat, 17 May 2008 20:18:07 -0400 (EDT) "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
> >
> > Move exported header files under include/linux that don't check the
> > __KERNEL__ preprocessor from unifdef-y to header-y.
> >
>
> Changelog fails to tell us why this change is being made.
>
> Perhaps it's because these headers just don't need unifdef processing?
>
> If so, that seems fragile.  If we later add a __KERNEL__ section to
> a header we need to remember to move the file to unifdef-y, and
> we'll forget.  It'd be better to process all files with unifdef.
>
> Or something.  Or not.

  i don't see a problem with simply running all exported files through
unifdef -- i've never understood the two categories since the unifdef
process is not exactly CPU-intensive and it can't possibly hurt for
some of those operations to be redundant.

  but as long as the two categories exist, might as well keep them
clean.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================

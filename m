Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:50056 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750741AbaFIEaO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 00:30:14 -0400
Date: Mon, 09 Jun 2014 13:29:59 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 0/5] kbuild: Clean-up and bug fixes of scripts/Makefile.host
In-Reply-To: <20140606132553.GA4961@ravnborg.org>
References: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com> <20140606132553.GA4961@ravnborg.org>
Message-Id: <20140609132959.95B3.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Hi Sam,


On Fri, 6 Jun 2014 15:25:54 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> On Fri, Jun 06, 2014 at 10:30:58AM +0900, Masahiro Yamada wrote:
> > 
> > Masahiro Yamada (5):
> >   kbuild: fix a typo in scripts/Makefile.host
> >   kbuild: fix a bug of C++ host program handling
> >   kbuild: clean up scripts/Makefile.host
> >   kbuild: clean-up and bug fix of scripts/Makefile.host
> >   kbuild: create directory of .o files from shlib-objs notation
> 
> All bug-fixes looks good.
> But rahter than fixing this please consider if
> we can drop the features.

OK.
I dropped shared object feature and posted v2.

> The shlib stuff is for example no longer used and should be deleted.
> Do we have any host progrs where we need to create directories as
> is fixed in these patches?
> If not then rip it out too.

I hesitate to remove directory creation feature because:

[1] Kbuild is already used in some other projects. 
     Makefile.build, Makefile.lib, Makefile.host etc.
    are really useful build scripts.
    So, I think they should be kept generic enough
    for the maximum code re-use  in other projects.
    It is true that we no longer have hostprogs in Kernel where
    we need to create directories.
    But there might  be necessity in other projects.
    (At least, U-boot's hostprogs-y is depending on this feature.)
[2] For consistency.
     obj-y supports automatic directory creation.
     It is symmetrical that we support it for hostprogs-y.

In v2,  I simplified Makefile.host much more,
so please let me keep it.


Best Regards
Masahiro Yamada


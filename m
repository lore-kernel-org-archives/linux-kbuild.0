Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:41056 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751109AbdKTVKY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 16:10:24 -0500
Message-ID: <1511212212.4822.66.camel@oracle.com>
Subject: Re: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
From: Knut Omang <knut.omang@oracle.com>
Date: Mon, 20 Nov 2017 22:10:12 +0100
In-Reply-To: <20171120200827.726yhebihjhrhted@ltop.local>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
         <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
         <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
         <CA+r1ZhgPUJ_WtCM=RgiPSrSvGrp7FMni2db6S9am5-LN_vhRdg@mail.gmail.com>
         <20171120200827.726yhebihjhrhted@ltop.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Jim Davis <jim.epost@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2017-11-20 at 21:08 +0100, Luc Van Oostenryck wrote:
> On Mon, Nov 20, 2017 at 12:48:35PM -0700, Jim Davis wrote:
> > 
> > I'd be nice if people could just specify CHECK and CHECKFLAGS to run
> > their favorite checker, but currently CHECKFLAGS seems hardwired for
> > running sparse.  So something liike
> > 
> > make C=1 CHECK="scripts/checkpatch.pl" CHECKFLAGS="--quiet --file"
> > 
> > fails when checkpatch is passed lots of arguments like -D__linux__
> > -Dlinux -D__STDC__ .  A little shell wrapper to grab the last argument
> > in that long list is a workaround, but perhaps CHECKFLAGS should be
> > made less sparse-specific?
> 
> It should be noted though that CHECKFLAGS contains very very few
> sparse specific things. It's mainly flags for the compiler
> coming from  KBUILD_CFLAGS (which of course, sparse needs to
> do its job properly).

Yes, and we would want some arguments passed to checkpatch by default as well.

A wrapper script (which by the way was what I started this with..)
could of course solve this and other issues such as the ability 
to run multiple checkers, but I am not convinced that that would be 
less ugly?

Thanks,
Knut

> 
> -- Luc Van Oostenryck

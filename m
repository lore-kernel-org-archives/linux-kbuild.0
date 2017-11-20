Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:46357 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753068AbdKTVWz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 16:22:55 -0500
Date: Mon, 20 Nov 2017 22:22:52 +0100
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
Message-ID: <20171120212251.k4uvdstfhg6qtrag@ltop.local>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
 <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
 <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
 <CA+r1ZhgPUJ_WtCM=RgiPSrSvGrp7FMni2db6S9am5-LN_vhRdg@mail.gmail.com>
 <20171120200827.726yhebihjhrhted@ltop.local>
 <1511212212.4822.66.camel@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511212212.4822.66.camel@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: Jim Davis <jim.epost@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Nov 20, 2017 at 10:10:12PM +0100, Knut Omang wrote:
> On Mon, 2017-11-20 at 21:08 +0100, Luc Van Oostenryck wrote:
> > 
> > It should be noted though that CHECKFLAGS contains very very few
> > sparse specific things. It's mainly flags for the compiler
> > coming from  KBUILD_CFLAGS (which of course, sparse needs to
> > do its job properly).
> 
> Yes, and we would want some arguments passed to checkpatch by default as well.
> 
> A wrapper script (which by the way was what I started this with..)
> could of course solve this and other issues such as the ability 
> to run multiple checkers, but I am not convinced that that would be 
> less ugly?

A wrapper script is something else that need to be maintained
but of course, it's very flexible.
I don't have a strong opinion on this and prefer to let speak
the people who maintain kbuild.

Should it be possible to somehow keep the distinction between
the flags coming from KBUILD_CFLAGS and the pure CHECKFLAGS?


-- Luc Van Oostenryck

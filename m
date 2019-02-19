Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37730 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfBSCQk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 21:16:40 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x1J2GF11010999
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 11:16:16 +0900
Received: by mail-vs1-f49.google.com with SMTP id t13so10827300vsk.3
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Feb 2019 18:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20190102092304.27262-1-riku.voipio@linaro.org>
 <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com>
 <CAK7LNASOqwrJqHLDKwT4xRU6jrFchavvWFjxqcPd_ZSmiEtsQQ@mail.gmail.com>
 <CAK7LNASiyMiCB2Ko0_aWOhB_3t6FEVhQ1xpnn-NQ=yV0X11SMg@mail.gmail.com> <ab49b0582ef12b14b1a68877263b81813e2492a2.camel@decadent.org.uk>
In-Reply-To: <ab49b0582ef12b14b1a68877263b81813e2492a2.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Feb 2019 11:15:39 +0900
Message-ID: <CAK7LNAQmOsGqLLjYho2=_3Bx+dAjhunSjcQbdTXmHMgX1dC+ww@mail.gmail.com>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Riku Voipio <riku.voipio@linaro.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, debian-kernel <debian-kernel@lists.debian.org>

On Tue, Feb 19, 2019 at 4:13 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Tue, 2019-02-19 at 02:05 +0900, Masahiro Yamada wrote:
> [...]
> > "make allnoconfig; make bindeb-pkg"
> > failed on Ubuntu 16.04, but succeeded on Ubuntu 18.04
> >
> > I am puzzled...
> [...]
> > dpkg-buildpackage: host architecture i386
> >  dpkg-source --before-build linux
> > dpkg-checkbuilddeps: error: Unmet build dependencies: flex
> > dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
> > dpkg-buildpackage: warning: (Use -d flag to override.)
> > scripts/package/Makefile:78: recipe for target 'bindeb-pkg' failed
> > make[1]: *** [bindeb-pkg] Error 3
> > Makefile:1390: recipe for target 'bindeb-pkg' failed
> > make: *** [bindeb-pkg] Error 2
> >
> >
> > The docker file I used is below.
> >
> > If I change "FROM ubuntu:16.04" to "FROM ubuntu:18.04",
> > it goes well.
> [...]
>
> For a cross-build, some build-dependencies may need to belong to the
> host architecture (what the package will run on) while others do not.
> In general, they must do one of:
>
> (a) Belong to the host architecture
> (b) Belong to any architecture, and include "Multi-Arch: foreign" in
>     their own metadata
> (c) Belong to an architecture specified in the Build-Depends field
>
> We normally want (b) for tools like flex.  But flex is (I assume)
> missing the Multi-Arch field in Ubuntu 16.04, as it used to in Debian.
>
> The way we dealt with this in Debian before flex was fixed was (c): use
> "flex:native".  But for reasons I don't understand that *isn't*
> compatible with (b), so to be compatible with both old and new versions
> of flex you should build-depend on:
>
>    flex | flex:native

Yes, it worked with this fix.

Thanks.


-- 
Best Regards
Masahiro Yamada

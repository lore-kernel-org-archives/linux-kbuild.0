Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42722 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgCaT0l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 15:26:41 -0400
Date: Tue, 31 Mar 2020 12:26:37 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
Message-ID: <20200331192637.GA54270@ubuntu-m2-xlarge-x86>
References: <20200326194155.29107-1-natechancellor@gmail.com>
 <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
 <20200331101122.GA6292@ubuntu-m2-xlarge-x86>
 <CAKwvOdkkpnkLwtNctSnebXTwumfprEQtLiuM5_4e-UBFTYBUxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkkpnkLwtNctSnebXTwumfprEQtLiuM5_4e-UBFTYBUxg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

On Tue, Mar 31, 2020 at 09:02:19AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Tue, Mar 31, 2020 at 3:11 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > Just a follow up, those two patches have been picked up and should be in
> > this coming release:
> >
> > https://git.kernel.org/balbi/usb/c/58582220d2d34228e5a1e1585e41b735713988bb
> > https://git.kernel.org/rostedt/linux-trace/c/bf2cbe044da275021b2de5917240411a19e5c50d
> >
> > As of next-20200331, with the former applied (because it is not there
> > yet) along with this patch, I see no warnings on arm, arm64, x86_64
> > all{mod,yes}config.
> 
> kbuild test robot is testing more arch's than that with Clang so it
> may report if it finds more instances of that warning in those.
> 
> -- 
> Thanks,
> ~Nick Desaulniers
> 

I'll keep an eye out. Hopefully not too many more are lurking but we
have definitely caught some bad behavior with this warning already so
getting it turned on so that all CI systems can benefit from it is
important.

Cheers,
Nathan

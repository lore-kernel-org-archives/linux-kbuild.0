Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21197 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731608AbgDBRG4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:06:56 -0400
MIME-Version: 1.0
References: <20200326194155.29107-1-natechancellor@gmail.com>
 <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
 <20200331101122.GA6292@ubuntu-m2-xlarge-x86> <CAKwvOdkkpnkLwtNctSnebXTwumfprEQtLiuM5_4e-UBFTYBUxg@mail.gmail.com>
 <20200331192637.GA54270@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200331192637.GA54270@ubuntu-m2-xlarge-x86>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 3 Apr 2020 02:05:50 +0900
Message-ID: <CAK7LNASPt4c-Vt9UzdKjSvPSYqXd4AFLNqKXfxnmqmfzk3Zi_A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

On Wed, Apr 1, 2020 at 4:26 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Mar 31, 2020 at 09:02:19AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > On Tue, Mar 31, 2020 at 3:11 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > > Just a follow up, those two patches have been picked up and should be in
> > > this coming release:
> > >
> > > https://git.kernel.org/balbi/usb/c/58582220d2d34228e5a1e1585e41b735713988bb
> > > https://git.kernel.org/rostedt/linux-trace/c/bf2cbe044da275021b2de5917240411a19e5c50d
> > >
> > > As of next-20200331, with the former applied (because it is not there
> > > yet) along with this patch, I see no warnings on arm, arm64, x86_64
> > > all{mod,yes}config.
> >
> > kbuild test robot is testing more arch's than that with Clang so it
> > may report if it finds more instances of that warning in those.
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> >
>
> I'll keep an eye out. Hopefully not too many more are lurking but we
> have definitely caught some bad behavior with this warning already so
> getting it turned on so that all CI systems can benefit from it is
> important.
>
> Cheers,
> Nathan



Applied to linux-kbuild.

I will rebase my branch during this MW,
so the commit ID will be unstable.
Please do not record it until it lands in Linus' tree.

-- 
Best Regards
Masahiro Yamada

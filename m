Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:51885 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750897AbdJXHGj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Oct 2017 03:06:39 -0400
Date: Tue, 24 Oct 2017 09:06:32 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: getconf options
Message-ID: <20171024070632.wnbfu6vltbr52gpm@pengutronix.de>
References: <dbf8b816-e1f7-f835-dd32-6b517e87cbc4@foxmail.com>
 <1a4f82d9999041c6a3c5ce9f37805e7f@SOC-EX01V.e01.socionext.com>
 <20171020054710.vfkkfnl3hjqqmlsb@pengutronix.de>
 <1508505607.2721.26.camel@decadent.org.uk>
 <CAK7LNAQZNx39GiKGP8b0Mc0Yj4co9GdcpaxGMEnqFs7meftz1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQZNx39GiKGP8b0Mc0Yj4co9GdcpaxGMEnqFs7meftz1Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, puck.chen@foxmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Oct 24, 2017 at 01:27:37PM +0900, Masahiro Yamada wrote:
> 2017-10-20 22:20 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> > On Fri, 2017-10-20 at 07:47 +0200, Uwe Kleine-König wrote:
> >> Hello,
> >>
> >> On Fri, Oct 20, 2017 at 04:14:44AM +0000, yamada.masahiro@socionext.com wrote:
> >> > > With commit d7f14c66c273b00aaa626f419d3155773a88d460, I got the follow
> >> > > warning on macos.
> >> > >
> >> > > getconf: no such configuration parameter `LFS_CFLAGS'
> >> > > getconf: no such configuration parameter `LFS_LDFLAGS'
> >> > > getconf: no such configuration parameter `LFS_LIBS'
> >> > > scripts/kconfig/mconf  Kconfig
> >> > >
> >> > > $ getconf LFS_CFLAGS
> >> > > getconf: no such configuration parameter `LFS_CFLAGS'
> >> > >
> >> > >
> >> > > Do you have some idea about this? Are these paremeters default to getconf?
> >> > >
> >> > > -Feng
> >> > >
> >> >
> >> >
> >> > Do you have a clue?
> >> >
> >> >
> >> > Does it make sense to suppress warnings like this?
> >> >
> >> > HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
> >> > HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
> >> > HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
> >> >
> >> >
> >> > Or, hard-code
> >> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> >> > as Ben originally suggested?
> >>
> >> I'm not a fan of hardcoding these. On 64 bit arch (and I think also a
> >> few 32 bit archs (x32?)) they are not needed and so IMHO shouldn't be
> >> added.
> >
> > What harm would they do?
> >
> > Ben.
> >
> >> I think 2>/dev/null is fine.
> 
> 
> If your machine does not recognize "getconf LFS_CFLAGS",
> but needs LFS flags, it is a problem.
> 
> Hard-coding the flags seem more stable to me.

Don't know how real the danger is that $(getconf LFS_CFLAGS) returns
something that is neither "" nor "-D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64". Are there platforms that knowingly depend on
sizeof(off_t) = 4 which break when -D_FILE_OFFSET_BITS=64 is passed?
When will we depend on -D_FILE_OFFSET_BITS=128? Probably all these are
not relevant now, still it feels more right to go the 2>/dev/null way
for me.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

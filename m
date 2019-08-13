Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44200 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbfHMRCb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 13:02:31 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so2938654pfc.11
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 10:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
 <20190813082336.GB17627@kroah.com> <f0e1a6efa8f21ab93935c4c19e13b904d4a71f98.camel@oracle.com>
In-Reply-To: <f0e1a6efa8f21ab93935c4c19e13b904d4a71f98.camel@oracle.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Aug 2019 10:02:18 -0700
Message-ID: <CAFd5g45eK8LRgXj0vnY4ONB70+EeR2gjk+Dv9+b6Lgf+ykJu-Q@mail.gmail.com>
Subject: Re: [RFC 00/19] Integration of Kernel Test Framework (KTF) into the
 kernel tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>

On Tue, Aug 13, 2019 at 2:51 AM Knut Omang <knut.omang@oracle.com> wrote:
>
> On Tue, 2019-08-13 at 10:23 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 13, 2019 at 08:09:15AM +0200, Knut Omang wrote:
> > > and in the making::
> > >
> > > kunit/                        (kernel only (UML))
> >
> > You are going to have to integrate this with kunit, to come up with a
> > superset of both in the end.
>
> Yes, I agree - getting to a unified approach has been my intention since I first brought this
> up at LPC'17.
>
> > And I do not think that kunit is only UML, it's just that seems to be
> > what Brendan tests with, but should work with other arches as well.
>
> If I get Brendan right, it is UML only now but can be extended to also support
> kernels running on real hardware. Still it is kernel only, while KTF also has the
> hybrid mode, where a test can have code and assertions both in user mode and kernel mode.
> This is made easier and more streamlined by letting all reporting happen from user mode.

Nope, the KUnit patchset currently under review *does* support any
architecture; we have tested it on x86, ARM, and UML, but it should
work on any architecture.

I added support for that a while ago due to popular demand.

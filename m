Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:33022 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfHMQTf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 12:19:35 -0400
Message-ID: <14b99d26a4cff1c813c92818dc1234007fa06fc9.camel@oracle.com>
Subject: Re: [RFC 01/19] kbuild: Fixes to rules for host-cshlib and
 host-cxxshlib
From: Knut Omang <knut.omang@oracle.com>
Date: Tue, 13 Aug 2019 18:19:01 +0200
In-Reply-To: <CAK7LNASX4jPRxRxD+JafAfKqjck=x27HuHZgPV1VFfW8MzcwZA@mail.gmail.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
         <be2c361eac49ded2848b2a555b75e30cc3c24e71.1565676440.git-series.knut.omang@oracle.com>
         <CAK7LNASX4jPRxRxD+JafAfKqjck=x27HuHZgPV1VFfW8MzcwZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>

On Tue, 2019-08-13 at 23:01 +0900, Masahiro Yamada wrote:
> On Tue, Aug 13, 2019 at 3:13 PM Knut Omang <knut.omang@oracle.com> wrote:
> >
> > C++ libraries interfacing to C APIs might sometimes need some glue
> > logic more easily written in C.
> > Allow a C++ library to also contain 0 or more C objects.
> >
> > Also fix rules for both C and C++ shared libraries:
> > - C++ shared libraries depended on .c instead of .cc files
> > - Rules were referenced as -objs instead of the intended
> >   -cobjs and -cxxobjs following the pattern from hostprogs*.
> >
> > Signed-off-by: Knut Omang <knut.omang@oracle.com>
> 
> 
> How is this patch related to the rest of this series?

This is just my (likely naive) way I to get what I had working 
using autotools in the Github version of KTF) translated into something 
comparable using kbuild only. We need to build a shared library consisting 
of a few C++ files and a very simple C file, and a couple of simple binaries, 
and the rule in there does seem to take .c files and subject them to the 
C++ compiler, which makes this difficult to achieve?

> This patch breaks GCC-plugins.
> Did you really compile-test this patch before the submission?

Sorry for my ignorance here:
I ran through the kernel build and installed the resulting kernel 
on a VM that I used to test this, if that's what you are asking 
about?

Do I need some unusual .config options or run a special make target 
to trigger the problem you see?

I used a recent Fedora config with default values for new options,
and ran the normal default make target (also with O=) and make selftests 
to test the patch itself.

Thanks,
Knut

> --
> Best Regards
> 
> Masahiro Yamada

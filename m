Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19037 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfEaRXg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 13:23:36 -0400
MIME-Version: 1.0
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
 <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com> <20190531163908.GB10644@mam-gdavis-lt>
In-Reply-To: <20190531163908.GB10644@mam-gdavis-lt>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 1 Jun 2019 02:22:36 +0900
Message-ID: <CAK7LNASq8eW0D8fpbxFGhAgR5D158emTR2quCD5ufyC+kK-2GQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "George G. Davis" <george_davis@mentor.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Sat, Jun 1, 2019 at 1:39 AM George G. Davis <george_davis@mentor.com> wrote:
>
> Hello Masahiro,
>
> On Sat, Jun 01, 2019 at 01:02:37AM +0900, Masahiro Yamada wrote:
> > On Sat, Jun 1, 2019 at 12:27 AM George G. Davis <george_davis@mentor.com> wrote:
> > >
> > > The following error occurs for the `make ARCH=arm64 checkstack` case:
> > >
> > > aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
> > > perl ./scripts/checkstack.pl arm64
> > > wrong or unknown architecture "arm64"
> > >
> > > Fix the above error by setting `CHECKSTACK_ARCH := aarch64` for the
> > > ARCH=arm64 case.
> > >
> > > Signed-off-by: George G. Davis <george_davis@mentor.com>
> >
> >
> > Why don't you fix scripts/checkstack.pl ?
>
> Like so?:
>

As far as I understood, checkstack.pl is supposed to
understand both ARCH= and 'uname -m'.


For example, the following commit supports x86, x86_64, i386,
by using regular expression.

commit fda9f9903be6c3b590472c175c514b0834bb3c83
Author: Konstantin Khlebnikov <koct9i@gmail.com>
Date:   Fri Aug 8 14:23:35 2014 -0700

    scripts/checkstack.pl: automatically handle 32-bit and 64-bit mode
for ARCH=x86

    This patch adds support for ARCH=x86 into checkstack.



Following this pattern, does this work for you?

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 122aef5e4e14..371bd17a4983 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -46,7 +46,7 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
        $x      = "[0-9a-f]";   # hex character
        $xs     = "[0-9a-f ]";  # hex character or space
        $funcre = qr/^$x* <(.*)>:$/;
-       if ($arch eq 'aarch64') {
+       if ($arch =~ '^(aarch|arm)64$') {
                #ffffffc0006325cc:       a9bb7bfd        stp     x29,
x30, [sp, #-80]!
                #a110:       d11643ff        sub     sp, sp, #0x590
                $re = qr/^.*stp.*sp, \#-([0-9]{1,8})\]\!/o;



-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39141 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgCJBZs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Mar 2020 21:25:48 -0400
Date: Mon, 9 Mar 2020 18:25:45 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: Disable -Wpointer-to-enum-cast
Message-ID: <20200310012545.GA16822@ubuntu-m2-xlarge-x86>
References: <20200308073400.23398-1-natechancellor@gmail.com>
 <CAK7LNARcTHpd8fzrAhFVB_AR7NoBgenX64de0eS2uN8g0by9PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARcTHpd8fzrAhFVB_AR7NoBgenX64de0eS2uN8g0by9PQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, stable <stable@vger.kernel.org>

On Mon, Mar 09, 2020 at 11:11:05AM +0900, Masahiro Yamada wrote:
> Hi Nathan,
> 
> On Sun, Mar 8, 2020 at 4:34 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Clang's -Wpointer-to-int-cast deviates from GCC in that it warns when
> > casting to enums. The kernel does this in certain places, such as device
> > tree matches to set the version of the device being used, which allows
> > the kernel to avoid using a gigantic union.
> >
> > https://elixir.bootlin.com/linux/v5.5.8/source/drivers/ata/ahci_brcm.c#L428
> > https://elixir.bootlin.com/linux/v5.5.8/source/drivers/ata/ahci_brcm.c#L402
> > https://elixir.bootlin.com/linux/v5.5.8/source/include/linux/mod_devicetable.h#L264
> >
> > To avoid a ton of false positive warnings, disable this particular part
> > of the warning, which has been split off into a separate diagnostic so
> > that the entire warning does not need to be turned off for clang.
> >
> > Cc: stable@vger.kernel.org
> > Link: https://github.com/ClangBuiltLinux/linux/issues/887
> > Link: https://github.com/llvm/llvm-project/commit/2a41b31fcdfcb67ab7038fc2ffb606fd50b83a84
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 86035d866f2c..90e56d5657c9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -748,6 +748,10 @@ KBUILD_CFLAGS += -Wno-tautological-compare
> >  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
> >  # See modpost pattern 2
> >  KBUILD_CFLAGS += -mno-global-merge
> > +# clang's -Wpointer-to-int-cast warns when casting to enums, which does not match GCC.
> > +# Disable that part of the warning because it is very noisy across the kernel and does
> > +# not point out any real bugs.
> > +KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
> >  else
> 
> 
> 
> I'd rather want to fix all the call-sites (97 drivers?)
> instead of having -Wno-pointer-to-enum-cast forever.

Yes, there are 97 unique warnings across my builds, which are mainly
arm, arm64, and x86_64 defconfig/allmodconfig/allyesconfig:

https://github.com/ClangBuiltLinux/linux/issues/887#issuecomment-587938406

> If it is tedious to fix them all for now, can we add it
> into scripts/Makefile.extrawarn so that this is disabled
> by default, but shows up with W=1 builds?

Sure, I can send v2 to do that but I think that sending 97 patches just
casting the small values (usually less than twenty) to unsigned long
then to the enum is rather frivolous. I audited at least ten to fifteen
of these call sites when creating the clang patch and they are all
basically false positives.

I believe Nick discussed this with some other developers off list, maybe
he has some other feedback to give. I'll wait to send a v2 until
tomorrow in case anyone else has further comments.

> (When we fix most of them, we will be able to
> make it a real warning.)
> 
> 
> What do you think?
> 
> Thanks.

Cheers,
Nathan

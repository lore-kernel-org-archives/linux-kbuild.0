Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61808 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgBJUOZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 15:14:25 -0500
MIME-Version: 1.0
References: <20200124195859.86991-1-andriy.shevchenko@linux.intel.com> <20200127100542.GV32742@smile.fi.intel.com>
In-Reply-To: <20200127100542.GV32742@smile.fi.intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Feb 2020 05:13:39 +0900
Message-ID: <CAK7LNAQkKOheXLVq+sjjmBMzREBZYN8XkxzcVmkkVpN4OjjRGQ@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Fix off-by-one error when generate a new version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michal Simek <monstr@monstr.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi Andy,

On Mon, Jan 27, 2020 at 7:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jan 24, 2020 at 09:58:59PM +0200, Andy Shevchenko wrote:
> > When build on, for example, x86 using `make O=... -j64` the version
> > in the built kernel comes from include/generated/compile.h, which is:
> >
> >       #define UTS_VERSION "#351 SMP Fri Jan 24 18:46:34 EET 2020"
> >
> > While at the end the x86 specific Makefile prints the contents of
> > the .version file:
> >
> >       Kernel: arch/x86/boot/bzImage is ready  (#352)
> >
> > Obviously the latter is not true. This happens because we first
> > check compile.h and update it and then generate new version, which is
> > incorrect flow:
> >
> >   CHK     include/generated/compile.h
> >   UPD     include/generated/compile.h
> >   ...
> >   GEN     .version
> >
> > In order to fix this, move the version generation from link-vmlinux.sh
> > to scripts/version.sh and re-use it in init/Makefile.
> >
> > Additionally provide a unified way to get the current version of the build
> > and use this in few callers. This will respect the KBUILD_BUILD_VERSION
> > in case it's provided.
>
> Hmm... It looks like a mess in my build tree.
> I have to setup more experiments here.
>


Sorry for the late reply.

I remember I was also hit by this one month ago or so.

I did not dig into it at that time
because the problem disappeared after doing something.

Today, I took a look at this again.
This is a regression caused by 56d589361572

This patch should fix it:
https://patchwork.kernel.org/patch/11374047/

-- 
Best Regards
Masahiro Yamada

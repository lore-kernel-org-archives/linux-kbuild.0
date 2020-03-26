Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36169 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgCZUAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:00:50 -0400
Received: by mail-pf1-f195.google.com with SMTP id i13so3338978pfe.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 13:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-11-masahiroy@kernel.org>
 <CAKwvOdk=MCePWHD=Kj3K7fD0y8TBZfiFLB0X+gnhPUd=RnrH6A@mail.gmail.com> <CAHmME9oD7DVSGVkWv2jAyr5eZUy2Ac+MWzss5dhKEmG3hq6AFg@mail.gmail.com>
In-Reply-To: <CAHmME9oD7DVSGVkWv2jAyr5eZUy2Ac+MWzss5dhKEmG3hq6AFg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 26 Mar 2020 13:00:35 -0700
Message-ID: <CAKwvOdmG4hRnG+R_ASLULdEVm31XkEo4vih7GxpNWK9f6xtCng@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] x86: probe assembler capabilities via kconfig
 instead of makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>

On Thu, Mar 26, 2020 at 12:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Mar 26, 2020 at 11:49 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Mar 26, 2020 at 1:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > >
> > > Doing this probing inside of the Makefiles means we have a maze of
> > > ifdefs inside the source code and child Makefiles that need to make
> > > proper decisions on this too. Instead, we do it at Kconfig time, like
> > > many other compiler and assembler options, which allows us to set up the
> > > dependencies normally for full compilation units. In the process, the
> > > ADX test changes to use %eax instead of %r10 so that it's valid in both
> > > 32-bit and 64-bit mode.
> >
> > Does KConfig generate -D<foo> flags for KBUILD_CFLAGS and KBUILD_AFLAGS?
>
> kconfig sticks everything it's got into include/generated/autoconf.h.
> That's how you're able to use all those #ifdef CONFIG_* macros
> already. This change moves things from a command line -D to the
> autoconf.h file.

Cool, I wondered how that was wired up.  Though seeing the word
"autoconf" brings on PTSD for me.
Patch LGTM.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> > Looks like lib/raid6/test/Makefile also generates some of these?
>
> raid6 has its own crazy thing going on. The test directory compiles
> that code for use in userspace. You might argue that its whole
> situation is non-standard and weird and should be reworked
> differently, but that seems like fodder for a different patchset on
> the linux-raid list.



-- 
Thanks,
~Nick Desaulniers

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51375 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgGATeP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 15:34:15 -0400
MIME-Version: 1.0
References: <20200626185913.92890-1-masahiroy@kernel.org> <CAKwvOd=V_M43CP7G87K3TqSsxua2NcXPz6BnDt-z6167O2WAzQ@mail.gmail.com>
 <CAK7LNATcwGkSWV7NSgwG_WqzvTPphT9=KK+qvT3FK_7y1UCzTA@mail.gmail.com>
 <CAKwvOdntZw2k8ZZ7txPC-FD+50cPpMwctGYTW0j2zw+FVj9SgA@mail.gmail.com> <CAKwvOd=JbEJNdWzk_xdMiy9QewbU3ESOHcokAXKkARrgm-ibEg@mail.gmail.com>
In-Reply-To: <CAKwvOd=JbEJNdWzk_xdMiy9QewbU3ESOHcokAXKkARrgm-ibEg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Jul 2020 04:33:14 +0900
Message-ID: <CAK7LNARUekoGnTOdUtAvJNJmtr75o1VGv-qnKqMz0eDkxevL4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2020 at 7:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Jun 29, 2020 at 11:26 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sat, Jun 27, 2020 at 4:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Sat, Jun 27, 2020 at 5:13 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > On Fri, Jun 26, 2020 at 12:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > >
> > > > > diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
> > > > > index dba6a83bc349..93792b457b81 100644
> > > > > --- a/arch/x86/kernel/cpu/Makefile
> > > > > +++ b/arch/x86/kernel/cpu/Makefile
> > > > > @@ -17,8 +17,7 @@ KCOV_INSTRUMENT_perf_event.o := n
> > > > >  KCSAN_SANITIZE_common.o := n
> > > > >
> > > > >  # Make sure load_percpu_segment has no stackprotector
> > > > > -nostackp := $(call cc-option, -fno-stack-protector)
> > > > > -CFLAGS_common.o                := $(nostackp)
> > > > > +CFLAGS_common.o                := -fno-stack-protector
> > > >
> > > > Any time I see `:=` assignment to a CFLAGS variable, it's a red flag
> > > > for overwriting existing CFLAGS, which is a common source of bugs.  I
> > > > recognize the kernel is current a mix and match for:
> > > >
> > > > CFLAGS_<file>.o
> > > >
> > > > rules to either use `+=` or `:=`, but I wish we were consistent, and
> > > > consistent in our use of `+=`.  For those rules, is there a difference
> > > > between the use of `+=` and `:=` like there is for the more general
> > > > case of appending to KBUILD_CFLAGS?  If not, it's ok to match the
> > > > existing style, but it's curious to me in this patch to see a mixed
> > > > use of `+=` and `:=`.
> > >
> > >
> > > I think Kees mostly answered your question.
> > >
> > > Let me add some comments.
> > >
> > >
> > > '+=' is the most used in kernel Makefiles, but
> > > ':=' and '=' are also used.
> > >
> > > So, you are right, we are inconsistent.
> > > This applies to not only CFLAGS_<file>.o, but also obj-y, etc.
> > >
> > > For example,
> > > https://github.com/torvalds/linux/blob/v5.7/arch/arm64/kernel/Makefile#L15
> > > 'obj-y :=' works since it is the first assignment to obj-y in that file.
> > > 'obj-y +=' also works, of course.
> > >
> > > We can consistently use '+=' everywhere, but I do not send
> > > patches for churn.
> > >
> > >
> > > You can use any assignment operator to CFLAGS_<file>.o
> > > if it is the first assignment in the Makefile.
> > > Using '+=' is robust for future code insertion/removal, though.
> > >
> > >
> > > If the right-hand side contains variable references,
> > > there is important difference in the behavior.
> > >
> > > You may know two flavors in variables
> > > (https://www.gnu.org/software/make/manual/make.html#Flavors)
> >
> > Cool, thanks for all the info.  With that, I'm happy with this patch.
> >
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> >
> > > CFLAGS_foo.o := $(call cc-option,-fno-stack-protector)
> > > The cc-option is expanded immediately when this line is parsed.
> > > (So, the compiler is invoked for 'make clean' too)
> > >
> > >
> > > CFLAGS_foo.o += $(call cc-option,-fno-stack-protector)
> > > If this is the first assignment in the file,
> > > '+=' act as '=', so the evaluation of cc-option
> > > is delayed until $(CFLAGS_foo.o) is expanded.
> > > (So, the compiler is NOT invoked for 'make clean')
> >
> > Ah, I think that may explain: I've been seeing the occasional warning
> > from $(NM) when running `make clean` for ARCH=arm, I'll bet that's
> > where this is coming from then.  Next time I reproduce it, I'll try to
> > find maybe where we're using `:=` or `=` with `$(NM)`.
> >
> > Maybe arch/arm/boot/compressed/Makefile, KBSS_SZ is evaluated for
> > `make clean`? (If you start an arm build, but kill it before vmlinux
> > is created, then `make clean` I suspect that KBSS_SZ is evaluated?)
>
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=1 -j71
> $ rm vmlinux
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=1 -j71 clean
> llvm-nm: error: arch/arm/boot/compressed/../../../../vmlinux: No such
> file or directory.
>
> I suspect I see this from doing an ARCH=arm build, then building a
> different ARCH and killing the build before vmlinux is produced or
> `make clean` for a different ARCH, then run a `make clean` for
> ARCH=arm.
>
> Is the above (regarding lazy evaluation) not true for LDFLAGS_vmlinux?
> I would have thought this would work:
>


I described why this error message is displayed:

https://patchwork.kernel.org/patch/11637129/



-- 
Best Regards
Masahiro Yamada

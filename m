Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65505 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387536AbgF3QYu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 12:24:50 -0400
MIME-Version: 1.0
References: <20200629085911.1676554-1-masahiroy@kernel.org> <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com>
In-Reply-To: <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 1 Jul 2020 01:23:53 +0900
Message-ID: <CAK7LNAR49jFZkEmBqpACE0V_-VyCXfFRcKe1Zq+cqO65QX1ozg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Clang build userprogs for target architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, Jun 30, 2020 at 2:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Jun 29, 2020 at 1:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Programs added 'userprogs' should be compiled for the target
> > architecture i.e. the same architecture as the kernel.
> >
> > GCC does this correctly since the target architecture is implied
> > by the toolchain prefix.
> >
> > Clang builds standalone programs always for the host architecture
> > because the target triple is currently missing.
> >
> > Fix this.
> >
> > Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
>
> This is a neat feature I didn't know about; looks relatively new.
> What's the test case command line invocation to test this with Clang?



Test command:

$ make -j24 ARCH=arm  LLVM=1 CROSS_COMPILE=arm-linux-gnueabi-
allyesconfig  samples/
  [ snip ]
  CC [U]  samples/watch_queue/watch_test
  CC [U]  samples/timers/hpet_example
  CC [U]  samples/vfs/test-fsmount
  CC [U]  samples/binderfs/binderfs_example
  CC [U]  samples/auxdisplay/cfag12864b-example
  CC [U]  samples/hidraw/hid-example
  CC [U]  samples/uhid/uhid-example
  CC [U]  samples/connector/ucon
  CC [U]  samples/watchdog/watchdog-simple
  CC [U]  samples/vfs/test-statx


Then, check if the sample programs
were correctly built for ARM.



Before this commit:

$ file samples/vfs/test-statx
samples/vfs/test-statx: ELF 64-bit LSB executable, x86-64, version 1
(SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2,
for GNU/Linux 3.2.0, not stripped



After this commit:

$ file samples/vfs/test-statx
samples/vfs/test-statx: ELF 32-bit LSB executable, ARM, EABI5 version
1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.3, for
GNU/Linux 3.2.0, not stripped



To test this, having LLVM is not enough
because building userspace programs
requires target-specific libraries.

As for GCC, libc is usually bundled together
with toolchains, but as for LLVM we need
to provide target-specific libc.

This introduces a different kind of complexity
than building the kernel.

I read this article:
https://clang.llvm.org/docs/CrossCompilation.html


I use tc-build to compile llvm from source code,
but I also needed to install ARM libc.

"apt install gcc-arm-linux-gnueabi"
especially
"apt install libc6-dev-armel-cross".





If I build sample code for ARCH=arm64,
I see the following warnings.


$ make -j24 ARCH=arm64  LLVM=1 CROSS_COMPILE=aarch64-linux-gnu-
allyesconfig  samples/
  [ snip ]
  CC [U]  samples/uhid/uhid-example
samples/uhid/uhid-example.c:169:4: warning: format specifies type
'ssize_t' (aka 'long') but the argument has type 'ssize_t' (aka 'int')
[-Wformat]
                        ret, sizeof(ev));
                        ^~~
samples/uhid/uhid-example.c:240:4: warning: format specifies type
'ssize_t' (aka 'long') but the argument has type 'ssize_t' (aka 'int')
[-Wformat]
                        ret, sizeof(ev));
                        ^~~
2 warnings generated.
  CC [U]  samples/vfs/test-fsmount
  CC [U]  samples/vfs/test-statx
  CC [U]  samples/watch_queue/watch_test
samples/watch_queue/watch_test.c:86:50: warning: format specifies type
'ssize_t' (aka 'long') but the argument has type 'ssize_t' (aka 'int')
[-Wformat]
                        fprintf(stderr, "Read buffer overrun: %zd\n", buf_len);
                                                              ~~~     ^~~~~~~
                                                              %d
samples/watch_queue/watch_test.c:90:28: warning: format specifies type
'ssize_t' (aka 'long') but the argument has type 'ssize_t' (aka 'int')
[-Wformat]
                printf("read() = %zd\n", buf_len);
                                 ~~~     ^~~~~~~
                                 %d
2 warnings generated.
  CC [U]  samples/watchdog/watchdog-simple
  AR      samples/built-in.a





I do not know how to solve this issue.


I can reproduce this in the following
simple test code:


----------------->8----------------
#include <stdio.h>

int main(void)
{
        ssize_t x = 1;

        printf("%zd", x);

        return 0;
}
--------------->8-------------------

$ clang --target=aarch64-linux-gnu test.c
test.c:7:16: warning: format specifies type 'ssize_t' (aka 'long') but
the argument has type 'ssize_t' (aka 'int') [-Wformat]
        printf("%zd", x);
                ~~~   ^
                %zd
1 warning generated.


ssize_t is defined in /usr/include/stdio.h
but perhaps this is not suitable
for cross-compilation for aarch64.



Is there any solution?






> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 73948798ce3f..cac29cc2ec25 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -970,8 +970,8 @@ LDFLAGS_vmlinux     += --pack-dyn-relocs=relr
> >  endif
> >
> >  # Align the bit size of userspace programs with the kernel
> > -KBUILD_USERCFLAGS  += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> > -KBUILD_USERLDFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> > +KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> > +KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
>
> That should be fine.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
>
> >
> >  # make the checker run with the right architecture
> >  CHECKFLAGS += --arch=$(ARCH)
> > --
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada

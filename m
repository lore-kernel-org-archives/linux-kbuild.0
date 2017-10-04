Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f172.google.com ([209.85.216.172]:46701 "EHLO
        mail-qt0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbdJDDFD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 23:05:03 -0400
Received: by mail-qt0-f172.google.com with SMTP id 6so7700039qtw.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Oct 2017 20:05:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171003204839.27551-2-dianders@chromium.org>
References: <20171003204839.27551-1-dianders@chromium.org> <20171003204839.27551-2-dianders@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 3 Oct 2017 20:05:00 -0700
Message-ID: <CABXOdTdrhvnRr+1egVAxtYcVsA0KiJ5MU2RcAVcpuN4oVOD-9g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Pass HOSTCC and similar to tools Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, acme@redhat.com, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, Oct 3, 2017 at 1:48 PM, Douglas Anderson <dianders@chromium.org> wrote:
> The main Linux Makefiles and the tools sub-Makefiles have different
> conventions for passing in CC / CFLAGS.
>
> Here's brief summary for the kernel:
> * CC: target C compiler (must be passed as an argument to make to
>   override)
> * HOSTCC: host C compiler (must be passed as an argument to make to
>   override)
> * CFLAGS: ignored (kernel manages its own CFLAGS)
> * KCFLAGS: extra cflags for the target (expected as an env var)
> * HOSTCFLAGS: host C compiler flags (not modifiable by the caller of
>   make)
>
> Here's a brief summary for the tools:
> * CC: host C compiler (must be passed as an argument to make to
>   override)
> * CFLAGS: base arguments for the host C compiler which are added to by
>   sub builds (expected as an env var)
>
> When the main kernel Makefile calls into the tools Makefile, it should
> adapt things from its syntax to the tools Makefile syntax.
>
> If we don't do this, we have a few issues:
> * If someone wants to user another compiler (like clang, maybe) for
>   hostcc then the tools will still be compiled with gcc.
> * If you happen to be building and you left ${CFLAGS} set to something
>   random (maybe it matches ${CC}, the _target_ C compiler, not the
>   _host_ C compiler) then this random value will be used to compile
>   the tools.
>
> In any case, it seems like it makes sense to pass CC, CFLAGS, and
> similar properly into the tools Makefile.
>
> NOTE: in order to do this properly, we need to add some new
> definitions of HOSTAS and HOSTLD into the main kernel Makefile.  If we
> don't do this and someone overrides "AS" or "LD" on the command line
> then those (which were intended for the target) will be used to build
> host side tools.  We also make up some imaginary "HOSTASFLAGS" and
> "HOSTLDFLAGS".  Someone could specify these, but if they don't at
> least these blank variables will properly clobber ASFLAGS and LDFLAGS
> from the kernel.
>
> This was discovered in the Chrome OS build system where CFLAGS (an
> environment variable) was accidentally left pointing to flags that
> would be an appropriate match to CC.  The kernel didn't use these
> CFLAGS so it was never an issue.  Turning on STACKVALIDATION, however,
> suddenly invoked a tools build that blew up.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Still not sure if I'd want to go that far. Just clearing out CFLAGS
would have fixed my problem, and I start to realize that I am more of
a minimalist when it comes to kernel changes.

Anyway, not that it means much,

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Tested-by: Guenter Roeck <groeck@chromium.org>

[ I didn't test all possible flag combinations, only a few of them,
but I did make sure that "make allmodconfig; CFLAGS=-junk make" no
longer fails. ]

Guenter

> ---
>
>  Makefile | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index cf007a31d575..0d3af0677d88 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -298,7 +298,9 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS)
>  HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
>
> +HOSTAS       = as
>  HOSTCC       = gcc
> +HOSTLD       = ld
>  HOSTCXX      = g++
>  HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
>                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
> @@ -1616,11 +1618,35 @@ image_name:
>  # Clear a bunch of variables before executing the submake
>  tools/: FORCE
>         $(Q)mkdir -p $(objtree)/tools
> -       $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
> +       $(Q)ASFLAGS="$(HOSTASFLAGS)"\
> +               LDFLAGS="$(HOSTLDFLAGS)" \
> +               CFLAGS="$(HOSTCFLAGS)" \
> +               CXXFLAGS="$(HOSTCXXFLAGS)" \
> +               $(MAKE) \
> +               AS="$(HOSTAS)" \
> +               CC="$(HOSTCC)" \
> +               CXX="$(HOSTCXX)" \
> +               LD="$(HOSTLD)" \
> +               MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" \
> +               O=$(abspath $(objtree)) \
> +               subdir=tools \
> +               -C $(src)/tools/
>
>  tools/%: FORCE
>         $(Q)mkdir -p $(objtree)/tools
> -       $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/ $*
> +       $(Q)ASFLAGS="$(HOSTASFLAGS)"\
> +               LDFLAGS="$(HOSTLDFLAGS)" \
> +               CFLAGS="$(HOSTCFLAGS)" \
> +               CXXFLAGS="$(HOSTCXXFLAGS)" \
> +               $(MAKE) \
> +               AS="$(HOSTAS)" \
> +               CC="$(HOSTCC)" \
> +               CXX="$(HOSTCXX)" \
> +               LD="$(HOSTLD)" \
> +               MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" \
> +               O=$(abspath $(objtree)) \
> +               subdir=tools \
> +               -C $(src)/tools/ $*
>
>  # Single targets
>  # ---------------------------------------------------------------------------
> --
> 2.14.2.920.gcf0c67979c-goog
>

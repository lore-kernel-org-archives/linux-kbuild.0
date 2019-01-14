Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:39657 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfANXQd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 18:16:33 -0500
Received: by mail-vk1-f193.google.com with SMTP id s184so192756vkd.6
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jan 2019 15:16:33 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id r124sm23115978vke.34.2019.01.14.15.16.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jan 2019 15:16:31 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id v205so541948vsc.3
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jan 2019 15:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20190114135144.26096-1-geert+renesas@glider.be> <20190114135144.26096-6-geert+renesas@glider.be>
In-Reply-To: <20190114135144.26096-6-geert+renesas@glider.be>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 14 Jan 2019 15:16:17 -0800
Message-ID: <CAGXu5j+SHuqv0=gxdsYBqraPyZMWdVD+uxrtYrepVZBX3ZzTKw@mail.gmail.com>
Subject: Re: [PATCH 05/12] selftests: seccomp: Fix test dependencies and rules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Shuah Khan <shuah@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Jan 14, 2019 at 5:51 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When building kselftest in a separate output directory, the seccomp_bpf
> binary ends up in the source directory instead of in the output
> directory, and the build of seccomp_benchmark fails:
>
>     make[5]: *** No rule to make target 'seccomp_benchmark', needed by 'all'.  Stop.
>
> Fix this by declaring both test binaries using TEST_GEN_PROGS, and using
> the build support from lib.mk properly.
>
> Fixes: 967d7ba841513910 ("selftests/seccomp: Add simple seccomp overhead benchmark")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  tools/testing/selftests/seccomp/Makefile | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/seccomp/Makefile b/tools/testing/selftests/seccomp/Makefile
> index fce7f4ce069251a6..c728bd7a366f78b9 100644
> --- a/tools/testing/selftests/seccomp/Makefile
> +++ b/tools/testing/selftests/seccomp/Makefile
> @@ -1,17 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> -all:
>
> -include ../lib.mk
> -
> -.PHONY: all clean
> -
> -BINARIES := seccomp_bpf seccomp_benchmark
>  CFLAGS += -Wl,-no-as-needed -Wall
> +LDFLAGS += -lpthread
>
> -seccomp_bpf: seccomp_bpf.c ../kselftest_harness.h
> -       $(CC) $(CFLAGS) $(LDFLAGS) -lpthread $< -o $@
> +TEST_GEN_PROGS = seccomp_bpf seccomp_benchmark

This breaks the dep on ../kselftest_harness.h. Changes go unnoticed if
this is changed:

$ touch tools/testing/selftests/kselftest_harness.h
$ make O=/tmp/kselftest -C tools/testing/selftests
...
make[1]: Entering directory
'/home/kees/src/linux/tools/testing/selftests/seccomp'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory
'/home/kees/src/linux/tools/testing/selftests/seccomp'
...

>
> -TEST_PROGS += $(BINARIES)
> -EXTRA_CLEAN := $(BINARIES)
> -
> -all: $(BINARIES)
> +include ../lib.mk
> --
> 2.17.1
>


-- 
Kees Cook

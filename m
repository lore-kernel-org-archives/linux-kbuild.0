Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63681 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfGJEAZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jul 2019 00:00:25 -0400
MIME-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com> <20190709063023.251446-7-brendanhiggins@google.com>
In-Reply-To: <20190709063023.251446-7-brendanhiggins@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 10 Jul 2019 12:59:30 +0900
Message-ID: <CAK7LNATx30AhZ51xozde=nO06-8UzuC0M9nfZXrqkyfmEFdu5w@mail.gmail.com>
Subject: Re: [PATCH v7 06/18] kbuild: enable building KUnit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, "Cc: Shuah Khan" <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, DTML <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-um@lists.infradead.org, Sasha Levin <Alexander.Levin@microsoft.com>, Tim Bird <Tim.Bird@sony.com>, Amir Goldstein <amir73il@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>, Julia Lawall <julia.lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, Knut Omang <knut.omang@oracle.com>, Logan Gunthorpe <logang@deltatee.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, David Rientjes <rientjes@google.com>, Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com, Michal Marek <michal.lkml@markovi.net>

On Tue, Jul 9, 2019 at 3:34 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> KUnit is a new unit testing framework for the kernel and when used is
> built into the kernel as a part of it. Add KUnit to the root Kconfig and
> Makefile to allow it to be actually built.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  Kconfig  | 2 ++
>  Makefile | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Kconfig b/Kconfig
> index 48a80beab6853..10428501edb78 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -30,3 +30,5 @@ source "crypto/Kconfig"
>  source "lib/Kconfig"
>
>  source "lib/Kconfig.debug"
> +
> +source "kunit/Kconfig"
> diff --git a/Makefile b/Makefile
> index 3e4868a6498b2..60cf4f0813e0d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -991,7 +991,7 @@ endif
>  PHONY += prepare0
>
>  ifeq ($(KBUILD_EXTMOD),)
> -core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
> +core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
>
>  vmlinux-dirs   := $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
>                      $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
> --
> 2.22.0.410.gd8fdbe21b5-goog


This is so trivial, and do not need to get ack from me.

Just a nit.


When CONFIG_KUNIT is disable, is there any point in descending into kunit/ ?

core-$(CONFIG_KUNIT) += kunit/

... might be useful to skip kunit/ entirely.

If you look at the top-level Makefile, some entries are doing this:


init-y          := init/
drivers-y       := drivers/ sound/
drivers-$(CONFIG_SAMPLES) += samples/
drivers-$(CONFIG_KERNEL_HEADER_TEST) += include/
net-y           := net/
libs-y          := lib/
core-y          := usr/





--
Best Regards
Masahiro Yamada

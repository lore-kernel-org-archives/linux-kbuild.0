Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:31409 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751329AbdDCHnF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Apr 2017 03:43:05 -0400
MIME-Version: 1.0
In-Reply-To: <20170318215823.GS4152@decadent.org.uk>
References: <20170318215823.GS4152@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 3 Apr 2017 16:42:43 +0900
Message-ID: <CAK7LNAQFx-yPj2c52sZ0LSv=UnQz-ATGJGkzT5wV7tq-GmvARw@mail.gmail.com>
Subject: Re: [PATCH] Kbuild.include: addtree: Remove quotes before matching path
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable@vger.kernel.org, 856474@bugs.debian.org

+To Arnd
+To Michal

2017-03-19 6:58 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> systemtap currently fails to build modules when the kernel source and
> object trees are separate.
>
> systemtap adds something like -I"/usr/share/systemtap/runtime" to
> EXTRA_CFLAGS, and addtree should not adjust this as it's specifying an
> absolute directory.  But since make has no understanding of shell
> quoting, it does anyway.
>
> For a long time this didn't matter, because addtree would still emit
> the original -I option after the adjusted one.  However, commit
> db547ef19064 ("Kbuild: don't add obj tree in additional includes")
> changed it to remove the original -I option.
>
> Remove quotes (both double and single) before matching against the
> excluded patterns.
>
> References: https://bugs.debian.org/856474
> Reported-and-tested-by: Jack Henschel <jackdev@mailbox.org>
> Reported-and-tested-by: Ritesh Raj Sarraf <rrs@debian.org>
> Fixes: db547ef19064 ("Kbuild: don't add obj tree in additional includes")
> Cc: stable@vger.kernel.org # 4.8+
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -207,7 +207,7 @@ hdr-inst := -f $(srctree)/scripts/Makefi
>  # Prefix -I with $(srctree) if it is not an absolute path.
>  # skip if -I has no parameter
>  addtree = $(if $(patsubst -I%,%,$(1)), \
> -$(if $(filter-out -I/% -I./% -I../%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1)),$(1)))
> +$(if $(filter-out -I/% -I./% -I../%,$(subst $(quote),,$(subst $(squote),,$(1)))),$(patsubst -I%,-I$(srctree)/%,$(1)),$(1)))
>
>  # Find all -I options and call addtree
>  flags = $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))



I have been thinking about this patch.

We touched addtree every time a new problem popped up.

It would be easy to pick up this patch,
but it looks like a crazy idea
to play pattern-matching in the addtree even more.



[1] -Ifoo/bar/baz
[2] -I"foo/bar/baz"
[3] -I foo/bar/baz    (whitespace(s) after -I)

All of these are valid notation,
and should be handled in the same way.

However, addtree expects only [1],
(then this patch is going to add [2] in the soup).


Each Makefile knows it wants to see
additional headers in the source tree, or objtree.

I am guessing the right approach in a long run is,
we require -I to specify $(srctree) or $(objtree) explicitly.

ccflags-y := -I$(srctree)/foo/bar/baz

or

ccflags-y := -I$(objtree)/foo/bar/baz


(For the latter, we can omit $(objtree)/ as it is ./)


Then, delete $(call flags,_c_flags) after the conversion.

Any comments?



-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:27371 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751068AbeC0Fpn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:45:43 -0400
MIME-Version: 1.0
In-Reply-To: <20180325223239.14778-1-linux@rasmusvillemoes.dk>
References: <20180325223239.14778-1-linux@rasmusvillemoes.dk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Mar 2018 14:44:40 +0900
Message-ID: <CAK7LNAQgwp=Q5n+auuYSPLE0FqeK+UGyrRukFY9Qx--PTkLduw@mail.gmail.com>
Subject: Re: [PATCH] objtool: fix build with future Make
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-26 7:32 GMT+09:00 Rasmus Villemoes <linux@rasmusvillemoes.dk>:
> I tried building using a freshly built Make (4.2.1-69-g8a731d1), but the
> objtool build broke with
>
> orc_dump.c: In function =E2=80=98orc_dump=E2=80=99:
> orc_dump.c:106:2: error: =E2=80=98elf_getshnum=E2=80=99 is deprecated [-W=
error=3Ddeprecated-declarations]
>   if (elf_getshdrnum(elf, &nr_sections)) {
>
> Turns out that with that new Make, the backslash was not removed, so cpp
> didn't see a #include directive, grep found nothing, and
> -DLIBELF_USE_DEPRECATED was wrongly put in CFLAGS.
>
> Now, that new Make behaviour is documented in their NEWS file:
>
>   * WARNING: Backward-incompatibility!
>     Number signs (#) appearing inside a macro reference or function invoc=
ation
>     no longer introduce comments and should not be escaped with backslash=
es:
>     thus a call such as:
>       foo :=3D $(shell echo '#')
>     is legal.  Previously the number sign needed to be escaped, for examp=
le:
>       foo :=3D $(shell echo '\#')
>     Now this latter will resolve to "\#".  If you want to write makefiles
>     portable to both versions, assign the number sign to a variable:
>       C :=3D \#
>       foo :=3D $(shell echo '$C')
>     This was claimed to be fixed in 3.81, but wasn't, for some reason.
>     To detect this change search for 'nocomment' in the .FEATURES variabl=
e.
>
> There are likely other places in the tree that will need fixing, so
> cc-ing Kbuild, but with this at least a x86-64 defconfig builds.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>




--=20
Best Regards
Masahiro Yamada

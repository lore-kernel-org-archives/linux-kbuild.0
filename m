Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:34080 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752136AbeDINby (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Apr 2018 09:31:54 -0400
MIME-Version: 1.0
In-Reply-To: <20180408213528.26758-1-linux@rasmusvillemoes.dk>
References: <CAK7LNARvTJJR=fa9_NyvwfX9z+f51Ha9XQzLrmVakVWUV4eAQw@mail.gmail.com>
 <20180408213528.26758-1-linux@rasmusvillemoes.dk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 9 Apr 2018 22:31:02 +0900
Message-ID: <CAK7LNARmy0COjgWgSa7uB426Me_jAmeJCDSQkJWZoTVwqoA1CA@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix # escaping in .cmd files for future Make
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-04-09 6:35 GMT+09:00 Rasmus Villemoes <linux@rasmusvillemoes.dk>:
> I tried building using a freshly built Make (4.2.1-69-g8a731d1), but
> already the objtool build broke with
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
> This also fixes up the two make-cmd instances to replace # with $(pound)
> rather than with \#. There might very well be other places that need
> similar fixup in preparation for whatever future Make release contains
> the above change, but at least this builds an x86_64 defconfig with the
> new make.
>
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D197847
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---

Applied to linux-kbuild.  Thanks!


--=20
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33942 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfG2OXl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 10:23:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so22129769pgc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2019 07:23:41 -0700 (PDT)
Message-ID: <5d3f016c.1c69fb81.b4775.c7d0@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
References: <20190725154730.80169-1-swboyd@chromium.org> <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2] kbuild: Check for unknown options with cc-option usage in Kconfig and clang
Date: Mon, 29 Jul 2019 07:23:39 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Peter Smith <peter.smith@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Douglas Anderson <dianders@chromium.org>

Quoting Masahiro Yamada (2019-07-29 03:02:40)
>=20
> Thanks for catching this.
>=20
> I wonder if we could fix this issue
> by one-liner, like this:
>=20
>=20
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 8a5c4d645eb1..4bbf4fc163a2 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -25,7 +25,7 @@ failure =3D $(if-success,$(1),n,y)
>=20
>  # $(cc-option,<flag>)
>  # Return y if the compiler supports <flag>, n otherwise
> -cc-option =3D $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/nul=
l)
> +cc-option =3D $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c
> /dev/null -o /dev/null)
>=20
>  # $(ld-option,<flag>)
>  # Return y if the linker supports <flag>, n otherwise
>=20
>=20
>=20
> This propagates not only -Werror=3Dunknown-warning-option
> but also other clang flags to Kconfig.
>=20
>=20
> Currently, we do not pass the target triplet to Kconfig.
> This means, cc-option in Kconfig evaluates the given flags
> against host-arch instead of target-arch.
> The compiler flags are mostly independent of the architecture,
> and this is not a big deal, I think.
> But, maybe, would it make more sense to pass the other
> basic clang flags as well?
>=20

Yes that also works and I had that earlier. I wanted to mirror what was
done in scripts/Kbuild.include where there's a CC_OPTION_CFLAGS
variable. I'm happy either way, so it's up to you.

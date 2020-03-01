Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58052 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgCABEN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Feb 2020 20:04:13 -0500
MIME-Version: 1.0
References: <20200229160959.871801-1-sz.lin@moxa.com>
In-Reply-To: <20200229160959.871801-1-sz.lin@moxa.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Mar 2020 10:03:28 +0900
Message-ID: <CAK7LNAQf0L1BCaYKqHPAcWwGqcGJgpAdF-QU7_ZVy4H_ygCtRg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix inconsistent comment
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?U1ogTGluICjmnpfkuIrmmbop?= <sz.lin@moxa.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Kaiden PK Yu <KaidenPK.Yu@moxa.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Mar 1, 2020 at 1:10 AM SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA) <sz.lin=
@moxa.com> wrote:
>
> The commit 2042b5486bd3 ("kbuild: unset variables in top Makefile
> instead of setting 0") renamed the variable from "config-targets"
> to "config-build", the comment should be consistent accordingly.
>
> Signed-off-by: Kaiden PK Yu (=E4=BD=99=E6=B3=8A=E9=8E=A7) <KaidenPK.Yu@mo=
xa.com>
> Signed-off-by: SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA) <sz.lin@moxa.com>
> ---


Applied to linux-kbuild.
Thanks.



>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 90ee2a22e88b..01ac935f28bd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1805,7 +1805,7 @@ existing-targets :=3D $(wildcard $(sort $(targets))=
)
>
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>
> -endif # config-targets
> +endif # config-build
>  endif # mixed-build
>  endif # need-sub-make
>
> --
> 2.25.1
>


--=20
Best Regards
Masahiro Yamada

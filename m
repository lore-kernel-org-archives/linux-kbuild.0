Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55760 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgELEgz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 00:36:55 -0400
MIME-Version: 1.0
References: <20200504080807.126396-1-masahiroy@kernel.org>
In-Reply-To: <20200504080807.126396-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 12 May 2020 13:36:05 +0900
Message-ID: <CAK7LNAQ0U_QAeQR_Ab2wD06pNKvKXcoG6OJL+SFaCtJymuG5Kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove misleading stale FIXME comment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Mon, May 4, 2020 at 5:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This comment was added by commit ("kbuild: Restore build nr, improve
> vmlinux link") [1].
>
> It was talking about if_changed_rule at that time. Now, it is unclear
> what to fix.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=ea52ca1b3e3882b499cc6c043f384958b88b62ff
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>
>  Makefile | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9ff00bfe0575..ffd80afcd0bb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1827,9 +1827,6 @@ tools/%: FORCE
>         $(Q)mkdir -p $(objtree)/tools
>         $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
>
> -# FIXME Should go into a make.lib or something
> -# ===========================================================================
> -
>  quiet_cmd_rmdirs = $(if $(wildcard $(rm-dirs)),CLEAN   $(wildcard $(rm-dirs)))
>        cmd_rmdirs = rm -rf $(rm-dirs)
>
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada

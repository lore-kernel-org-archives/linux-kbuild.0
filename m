Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35092 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752179Ab0IUOgp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Sep 2010 10:36:45 -0400
Received: by wyf22 with SMTP id 22so5453481wyf.19
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Sep 2010 07:36:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
References: <AANLkTim1EmMOFERs7rwG=zg_AZrXtojE7dKV7Rhf17Ww@mail.gmail.com>
	<AANLkTinMZj-_neS4jNM+b6-Dk7qzVMsR6DwyX2SHk3kt@mail.gmail.com>
	<1285072379.15732.70.camel@e102109-lin.cambridge.arm.com>
Date: Tue, 21 Sep 2010 10:36:43 -0400
Message-ID: <AANLkTi=fudCXbVEwcAjz+a3ZvM-r8i5A1yH-=n63o2o8@mail.gmail.com>
Subject: Re: Stale expression reference causing use-after-free
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hi Catalin,

On Tue, Sep 21, 2010 at 8:32 AM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
>
> Commit 246cf9c26b introduced the tracking of direct dependency to
> provide additional warning when they are not met. With some complex
> dependencies, the expr_copy() function called on such expressions may
> cause stack exhaustion. The patch removes the superfluous expr_copy()
> call since expr_transform handles symbol duplication already.
>
I'm afraid this is just moving the problem from expr_copy() to
expr_transform() as the first thing the latter do is to recurse. on
the sub-expressions. I'm not sure that the expression causing the
stack exhaustion is even correct, or its reference is still valid.

 - Arnaud

> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/menu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 4fb5902..7298806 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -292,7 +292,7 @@ void menu_finalize(struct menu *parent)
>                        menu_finalize(menu);
>        } else if (sym) {
>                /* ignore inherited dependencies for dir_dep */
> -               sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
> +               sym->dir_dep.expr = expr_transform(parent->dir_dep);
>                sym->dir_dep.expr = expr_eliminate_dups(sym->dir_dep.expr);
>
>                basedep = parent->prompt ? parent->prompt->visible.expr : NULL;
>
>
> --
> Catalin
>
>

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:40835 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754010Ab1EVMEp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 May 2011 08:04:45 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: Inconsistency in dependency calculations
Date: Sun, 22 May 2011 14:04:42 +0200
References: <201105211855.03702.yann.morin.1998@anciens.enib.fr> <BANLkTi=7YprSEaqHJ54D0s=Fi8pbAwws8A@mail.gmail.com>
In-Reply-To: <BANLkTi=7YprSEaqHJ54D0s=Fi8pbAwws8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-Id: <201105221404.42225.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Arnaud, All,

On Sunday 22 May 2011 06:23:32 Arnaud Lacombe wrote:
[--SNIP--]
> > Now exit and save. Run mconf again, and exit staright away. Notice this
> > error mesage on the console:
> >    warning: (D) selects E which has unmet direct dependencies (B)
[--SNIP--]
> > What I would expect in an ideal world: no warning is printed at all.
[--SNIP--]
> yeah.. the real problem is that you are using kconfig in a way which
> has not been thought about.

Yes, I know. But is this config snippet valid wrt kconfig syntax and
grammar? If so, there is a bug in the dependency tracking; if not,
then the doc should be updated to reflect the limitation.

But kconfig is now more and more used out of the kernel land, and I
believe it is very good. This means also that non-kernel users will
use it in ways not envisioned when kconfig was first written, such as
I do, and will uncover corner cases that exhibit the current limitations.

> The problem you got is because the symbol 
> direct dependency is inherited by its last parent, in that case, B.
> But you should not have the warning at the first place, in the B
> branch, all E's dependency are met. This should fix your problem:
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 5fdf10d..77f913c 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -350,7 +350,7 @@ void menu_finalize(struct menu *parent)
>                         last_menu->next = NULL;
>                 }
> 
> -               sym->dir_dep.expr = parent->dep;
> +               sym->dir_dep.expr = expr_alloc_or(sym->dir_dep.expr,
> parent->dep);;
>         }
>         for (menu = parent->list; menu; menu = menu->next) {
>                 if (sym && sym_is_choice(sym) &&

Indeed! Thank you very much!

Do you plan to push this and your fix on choice visibility before the
end of the merge window?

Thank you again for this quick and good explanations! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

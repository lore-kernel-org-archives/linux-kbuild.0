Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52346 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740Ab1EVEXd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 May 2011 00:23:33 -0400
Received: by iyb14 with SMTP id 14so3825825iyb.19
        for <linux-kbuild@vger.kernel.org>; Sat, 21 May 2011 21:23:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201105211855.03702.yann.morin.1998@anciens.enib.fr>
References: <201105211855.03702.yann.morin.1998@anciens.enib.fr>
Date: Sun, 22 May 2011 00:23:32 -0400
Message-ID: <BANLkTi=7YprSEaqHJ54D0s=Fi8pbAwws8A@mail.gmail.com>
Subject: Re: Inconsistency in dependency calculations
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Sat, May 21, 2011 at 12:55 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Hello All!
>
> Here I am again, with an inconstistency in the way forward dependencies are
> computed. ;-)
>
> Take this simple test-case for example:
>
>    ---8<--- Config.in ---8<--
>    config F
>        bool "F"
>
>    choice AB
>        bool "AB"
>    config A
>        bool "A"
>    config B
>        bool "B"
>    config C
>        bool "C"
>    endchoice
>
>    if A
>    config D
>        bool
>        default y if F
>        select E
>    config E
>        bool "E"
>    endif # A
>
>    if B
>    config D
>        bool
>        default y if F
>        select E
>    config E
>        bool "E"
>    endif # B
>    ---8<--- END ---8<---
>
> Then run:
>  rm -f .config .config.old
>  mconf Config.in
>
>    [ ] F (NEW)
>        AB (A)  --->
>    [ ] E (NEW)
>
> Then select F:
>
>    [*] F      D) selects E which has unmet direct dependencies (B)
>        AB (A)  --->
>    -*- E
>
> Notice the text following F. It is *not* a copy-paste error, I do really see
> this text.
>
expected.

> Now exit and save. Run mconf again, and exit staright away. Notice this
> error mesage on the console:
>    warning: (D) selects E which has unmet direct dependencies (B)
>
> Now, run mconf again, select B in the choice (keep F selected). You get the
> same warning on the console (expected, as it is printed before bringing up
> the dialog menu, and we get to see it only when exiting, not when loading).
>
> Now re-run mconf yet again and exit straight away. There is no warning this
> time.
>
> What I would expect for consistency: the warning is printed both when A or
> B is selected, warning about direct dep B when A is selected, and conversely
> when A is selected:
> A selected:
>    warning: (D) selects E which has unmet direct dependencies (B)
> B selected:
>    warning: (D) selects E which has unmet direct dependencies (A)
>
> What I would expect in an ideal world: no warning is printed at all.
>
as a rule, I would expect the backend never to output anything unless
it has been instructed to do so by the frontend, it has obviously not
been enforced in the past, and is likely not to trivial to fix...

I guess that mconf() can be told to redraw the complete screen, but
that's hackish...

> Behaves the same with kconfig in 2.6.39 and linux-next 20110520.
>
> Of course, this example is only here to pin-point the mis-behavior. Fact is,
> the real life example happens with a generated Config.in, so it is not possible
> to turn the conditional into "if A || B".
>
yeah.. the real problem is that you are using kconfig in a way which
has not been thought about. The problem you got is because the symbol
direct dependency is inherited by its last parent, in that case, B.
But you should not have the warning at the first place, in the B
branch, all E's dependency are met. This should fix your problem:

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 5fdf10d..77f913c 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -350,7 +350,7 @@ void menu_finalize(struct menu *parent)
                        last_menu->next = NULL;
                }

-               sym->dir_dep.expr = parent->dep;
+               sym->dir_dep.expr = expr_alloc_or(sym->dir_dep.expr,
parent->dep);;
        }
        for (menu = parent->list; menu; menu = menu->next) {
                if (sym && sym_is_choice(sym) &&

[same warning, gmail and long line do not play well together...]

 - Arnaud

> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

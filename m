Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:61889 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414Ab1EJSMO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2011 14:12:14 -0400
Received: by iyb14 with SMTP id 14so5401092iyb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 10 May 2011 11:12:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201105100053.37010.yann.morin.1998@anciens.enib.fr>
References: <201105100053.37010.yann.morin.1998@anciens.enib.fr>
Date: Tue, 10 May 2011 14:12:11 -0400
Message-ID: <BANLkTinRk7zbr6odrFhW2YLcHvwnuzEJtg@mail.gmail.com>
Subject: Re: Choice visibility issue
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Mon, May 9, 2011 at 6:53 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Hello All!
>
> In case a choice appears in two places, and each instance depends on
> different conditions, the visibility of the choice item is not coherent.
>
> Take this simple example:
>
> ---8<--- BEGIN ---8<---
> # cat toto.in
> source toto-A.in
> source toto-B.in
>
> # cat toto-A.in
> config A
>    bool "A"
> if A
> choice C
>    bool "C"
> config C1
>    bool "C1"
> config C2
>    bool "C2"
> endchoice
> endif # A
>
> # cat toto-B.in
> config B
>    bool "B"
>    depends on ! A
> if B
> choice C
>    bool "C"
> config C1
>    bool "C1"
> config C2
>    bool "C2"
> endchoice
> endif # A
> ---8<---  END  ---8<---
>
> If neither A not B is selected, the choice is not visible (expected):
>  [ ] A
>  [ ]   B
> ==> OK
>
No, there is a first bug here, B should not appear as a child of A,
but it is irrelevant to the other issue. [note for later,
menu_finalize() is breaking the tree, damn dependency...]

> If A is selected, then B is not visible (expected), and the choice is
> visible directly below A (expected):
>  [*] A
>        C (C1)  --->
> ==> OK
>
> If A is not selected but B is, the choice is visible twice, once just
> below B (expected), and once just below A (unexpected):
>  [ ] A
>        C (C1)  --->
>  [*]   B
>          C (C1)  --->
> ==> KO
>
> This last case is wrong IMHO. The choice should not be displayed just
> below A, but only just below B.
>
> The problem happens with all the frontends I was able to test with,
> using linux-2.6.38.5 and linux-next dated yesterday:
> - conf
> - mconf
> - nconf
> - gconf
>
> For the conf frontend, the issue happens only on the second run, not
> on the first run, which somewhat makes sense. I was not able to run
> xconfig, as I lack proper qt devel here.
>
of course, your problem is in the backend.

> So:
> - is this a limitation that can not be overcome?
yes, the problem is that choice's visibility are only determined by
the visibility of the underlying symbol. In your case, the same symbol
appear in twice in the tree.

> - if it can be overcome, where should I start to look at?
you may want to try:

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 5fdf10d..55b6fe0 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -279,6 +279,10 @@ void menu_finalize(struct menu *parent)
                                        }
                                }
                        }
+                       if (parent->prompt &&
!expr_is_yes(parent->prompt->visible.expr)) {
+                               parent->visibility =
expr_alloc_and(parent->visibility,
+                                           parent->prompt->visible.expr);
+                       }
                        /* set the type of the remaining choice values */
                        for (menu = parent->list; menu; menu = menu->next) {
                                current_entry = menu;

I did not regress-tested it yet, but it seems to help in this specific case.

[I anticipate that GMail is gonna wrap lines ... d'oh!]

>  (I'm not really fluent in flex/bison, and I got lost while
>  trying to see in mconf where the visibility was computed...)
>
hints: not in the parser per-se ;)

 - Arnaud

> Some context:
> I am using kconfig in crosstool-NG. In this context, A and B are two
> different packages (glibc and eglibc) that share a common set of options,
> of which the choice C (the kernel version to support). So the common
> options are in a single file that is sourced twice, once from the glibc
> config.in, and once from the eglibc.in (although the multiple sourcing
> has not impact, as the example above demonstrates, and the two choices
> can even be in a single file).
>
> Thank you!
>
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

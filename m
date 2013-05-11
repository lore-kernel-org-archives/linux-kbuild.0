Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:41778 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753177Ab3EKJsX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 May 2013 05:48:23 -0400
Received: by mail-wg0-f52.google.com with SMTP id k13so4832772wgh.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 May 2013 02:48:22 -0700 (PDT)
Date: Sat, 11 May 2013 11:48:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [RFC] mconf: make extensive use of ncurses' variables LINES and
 COLS.
Message-ID: <20130511094818.GA3222@free.fr>
References: <gid2szuh1p.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gid2szuh1p.fsf@karga.hank.lab>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk.gouders@w-hs.de>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-10 14:59 +0200, Dirk Gouders spake thusly:
> From 882aa6595cbb2683a43bf24f1b9741263641ec9b Mon Sep 17 00:00:00 2001
> From: Dirk Gouders <dirk@gouders.net>
> Date: Fri, 10 May 2013 12:26:23 +0200
> Subject: [PATCH] mconf: make extensive use of ncurses' variables LINES and
>  COLS.
> 
> The manual page of ncurses states that the variables LINES and COLS
> are initialized by initscr().  So, in init_dialog() there is no need
> to use local variables `height' and `width' and initialize them using
> function calls.

If we read the manpage strictly, the LINES and COLS are set by initsrc,
and nothing else updates them. So the manpage does not state what
happens when the terminal is resized. The only mention of 'COLS' in the
man page is this paragraph:

    ---8<---
    The integer variables LINES and COLS are defined in <curses.h>
    and will be filled in by initscr with the size of the screen.
    ---8<---

After looking at the code of ncurses, the LINES and COLS are also
updated upon a resize. But as this is not documented, I think we should
*not* rely on that behaviour.

I believe we should use the functions, not the variables.

Also note that the getmaxyx() familly are not functions, they are macros.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

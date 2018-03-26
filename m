Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41468 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751249AbeCZPYp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Mar 2018 11:24:45 -0400
MIME-Version: 1.0
In-Reply-To: <1521095127-23067-1-git-send-email-yamada.masahiro@socionext.com>
References: <1521095127-23067-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Mar 2018 00:23:51 +0900
Message-ID: <CAK7LNAQastzb7ckcUdzs5KUbdmTUA8-YXM6RYVTW_KcNzMW78g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not include both curses.h and ncurses.h for nconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-15 15:25 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> nconf.h includes <curses.h> and "ncurses.h", but it does not need to
> include both.  Generally, it should fall back to curses.h only when
> ncurses.h is not found.  But, looks like it has never happened;
> these includes have been here for many years since commit 692d97c380c6
> ("kconfig: new configuration interface (nconfig)"), and nobody has
> complained about hard-coding of ncurses.h .  Let's simply drop the
> curses.h inclusion.
>
> I replaced "ncurses.h" with <ncurses.h> since it does not exist in
> the local directory.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kconfig.

-- 
Best Regards
Masahiro Yamada

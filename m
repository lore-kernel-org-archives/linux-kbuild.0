Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:59852 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278Ab3ELMzf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 08:55:35 -0400
Received: by mail-wg0-f42.google.com with SMTP id j13so2075590wgh.5
        for <linux-kbuild@vger.kernel.org>; Sun, 12 May 2013 05:55:33 -0700 (PDT)
Date: Sun, 12 May 2013 14:55:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v4] mconf: use function calls instead of ncurses'
 variables LINES and COLS
Message-ID: <20130512125529.GA2976@free.fr>
References: <20130511205802.GD3222@free.fr>
 <1368354649-10312-1-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1368354649-10312-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-12 12:30 +0200, Dirk Gouders spake thusly:
> According to the documentation [1], LINES and COLS are initialized by
> initscr(); it does not say anything about the behavior when windows are
> resized.
> 
> Do not rely on the current implementation of ncurses that updates
> these variables on resize, but use the propper function calls to get
> window dimensions.
> 
> init_dialog() could make use of the variables, but for the sake of
> consistency we do not change it's current use of the macro getmaxyx().
> 
> [1] ncurses(3X)
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>

I've queued it now. Thank you!

Regards,
Yann E. MORIN.

PS. That new mail was correctly formatted, now! Thanks!
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

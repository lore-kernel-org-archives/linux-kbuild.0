Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:62735 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751473Ab3EPXEK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 May 2013 19:04:10 -0400
Received: by mail-wi0-f175.google.com with SMTP id hn14so82470wib.8
        for <linux-kbuild@vger.kernel.org>; Thu, 16 May 2013 16:04:08 -0700 (PDT)
Date: Fri, 17 May 2013 01:04:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [RFC] mconf: suppress empty submenus
Message-ID: <20130516230404.GB19534@free.fr>
References: <1368626738-31911-1-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1368626738-31911-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-15 16:05 +0200, Dirk Gouders spake thusly:
> I noticed that sometimes it happens that there are empty
> submenus, and I tried to see if they can't be suppressed
> by mconf (if not explicitely done by the kbuild-language).

I think we still want submenus to be visible if they are not hidden by
any condition in the Kconfig. If the developper did not explicitly add
masking condition, we should *not* try to mask it from the frontends.

However, I agree that entering an empty menu can just be deceptive. If
we could find a way to render an empty menu, and prevent the user from
entering it, then that would be a huge win, I think.

For example, menus are rendered as thus for now:

    This is a submenu  --->

What about representing empty submenus as thus:

    This is a submenu  ----

Also, we have menuconfig which are simply empty if not selected, but can
anyway be entererd like any other submenu:

    [ ] menuconfig entry  --->
        (Always empty when entered if not selected)

which could be similarly rendered as:

    [ ] menuconfig entry  ----

This one is really deceptive, and should be handled in the same scheme
as well.

Any better scheme highly suggested! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

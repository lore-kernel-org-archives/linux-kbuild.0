Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:36433 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162Ab3ELOWY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 10:22:24 -0400
Received: by mail-wg0-f42.google.com with SMTP id j13so2118585wgh.3
        for <linux-kbuild@vger.kernel.org>; Sun, 12 May 2013 07:22:22 -0700 (PDT)
Date: Sun, 12 May 2013 16:22:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v4] mconf: use function calls instead of ncurses'
 variables LINES and COLS
Message-ID: <20130512142218.GB2976@free.fr>
References: <20130511205802.GD3222@free.fr>
 <1368354649-10312-1-git-send-email-dirk@gouders.net>
 <20130512125529.GA2976@free.fr>
 <ghy5bk5n8l.fsf@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghy5bk5n8l.fsf@mx10.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-12 15:41 +0200, Dirk Gouders spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> 
> > I've queued it now. Thank you!
> >
> > Regards,
> > Yann E. MORIN.
> >
> > PS. That new mail was correctly formatted, now! Thanks!
> > YEM.
> 
> Thank you, Yann.  Especially for your patience with me, wasting your
> time with sending misformatted patches and getting rather simple changes
> right.

No problem! Thanks for staying with us during the iterations.

Now, since you seem to be interested in some cleanup and polishing, I've
noticed that the nconf frontend also uses COLS and LINES, so if you've
got some spare time... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

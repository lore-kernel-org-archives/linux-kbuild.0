Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:61884 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998Ab3ESJJB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 May 2013 05:09:01 -0400
Received: by mail-wi0-f175.google.com with SMTP id hn14so1321855wib.2
        for <linux-kbuild@vger.kernel.org>; Sun, 19 May 2013 02:08:59 -0700 (PDT)
Date: Sun, 19 May 2013 11:08:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [RFC] mconf: mark empty menus/menuconfigs different form
 non-empty ones
Message-ID: <20130519090855.GA3359@free.fr>
References: <20130516230404.GB19534@free.fr>
 <1368786492-23751-1-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1368786492-23751-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-17 12:28 +0200, Dirk Gouders spake thusly:
> here is a patch for the scheme you suggested.
> 
> I also tried how it looks if empty submenus are maked by "---|" but I
> think that is a matter of personal preferences and I don't want to try to
> anticipate what users who use mconf heavily want.

I suggested '----' to floow the scheme for booleans and tristates:
    [ ] Selectable boolean
    < > Selectable tristate
    { } Selectable tristate, forced to at least M
    - - Unselectable tristate, forced to Y

So I think '----' is a nice fit for '--->'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

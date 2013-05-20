Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:35510 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755943Ab3ETPuK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 May 2013 11:50:10 -0400
Received: by mail-wi0-f175.google.com with SMTP id hn14so2212037wib.14
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2013 08:50:09 -0700 (PDT)
Date: Mon, 20 May 2013 17:50:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v3] mconf/nconf: mark empty menus/menuconfigs different
 from non-empty ones
Message-ID: <20130520155005.GB3164@free.fr>
References: <20130519151417.GB3339@free.fr>
 <1368992974-4748-1-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1368992974-4748-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-19 21:49 +0200, Dirk Gouders spake thusly:
> Submenus are sometimes empty and it would be nice if there is
> something that notifies us that we should not expect any content
> _before_ we enter a submenu.
> 
> A new function menu_is_empty() was introduced and empty menus and
> menuconfigs are now marked by "----" as opposed to non-empty ones that
> are marked by "--->".
> 
> This scheme was suggested by "Yann E. MORIN"
> <yann.morin.1998@free.fr>.
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>

I've applied this to my tree in my yem-kconfig-for-next branch, for
inclusion when the merge window for 3.11 opens. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

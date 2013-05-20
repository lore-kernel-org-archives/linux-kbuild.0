Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:45642 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755943Ab3ETPvH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 May 2013 11:51:07 -0400
Received: by mail-wi0-f182.google.com with SMTP id c10so2212440wiw.3
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2013 08:51:06 -0700 (PDT)
Date: Mon, 20 May 2013 17:51:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v2] mconf: handle keys in empty dialogs
Message-ID: <20130520155101.GC3164@free.fr>
References: <20130519151227.GA3339@free.fr>
 <1368992924-4700-1-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1368992924-4700-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-19 21:48 +0200, Dirk Gouders spake thusly:
> When entering an empty dialog, using the movement keys resulted in
> unexpected characters beeing displayed, other keys like "z" and "h"
> did not work as expected.
> 
> This patch handles the movement keys as well as other keys, especially
> "z", "h" and "/".
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>

I've applied this to my tree in the yem-kconfig-rc-fixes branch, for
which I just sent a pull-request to Michal. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:38431 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752952Ab3FZVob (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Jun 2013 17:44:31 -0400
Received: by mail-wg0-f49.google.com with SMTP id a12so11096118wgh.16
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2013 14:44:30 -0700 (PDT)
Date: Wed, 26 Jun 2013 23:44:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] Revert "kconfig: fix randomising choice entries in
 presence of KCONFIG_ALLCONFIG"
Message-ID: <20130626214425.GA3223@free.fr>
References: <20130625205836.GB14074@free.fr>
 <1372196264-3407-1-git-send-email-yann.morin.1998@free.fr>
 <20130626134852.GA25921@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20130626134852.GA25921@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Sedat Dilek <sedat.dilek@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

Michal, All,

On 2013-06-26 15:48 +0200, Michal Marek spake thusly:
> On Tue, Jun 25, 2013 at 11:37:44PM +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > This reverts commit 8357b48549e17b3e4e402c7f977b65708922e60f.
> > 
> > It breaks more stuff than it fixes.
> 
> Thanks, I applied it to kbuild.git#kconfig, after verifying that the
> issue is gone.

Yes, thanks. I'm sorry this second attempt was a (slightly different!)
failure again. :-(

The fix is working for boolean choices, but exposes a latent bug on
tristate changes. Obviously, we must fix that latent bug first, but I
can't come to a sane solution.

I'll let it mature in a corner of my head for one more night. Maybe I'll
see things clearer tomorrow. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

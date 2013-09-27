Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:56027 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752833Ab3I0UCe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Sep 2013 16:02:34 -0400
Received: by mail-we0-f174.google.com with SMTP id q58so3124941wes.5
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2013 13:02:33 -0700 (PDT)
Date: Fri, 27 Sep 2013 22:02:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig: fix allmodconfig
Message-ID: <20130927200228.GA3301@free.fr>
References: <1379805443-10945-1-git-send-email-yann.morin.1998@free.fr>
 <20130921232102.GC3221@free.fr>
 <20130926213621.GF3418@free.fr>
 <52455BA2.2020805@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52455BA2.2020805@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>

Michal, All,

On 2013-09-27 12:19 +0200, Michal Marek spake thusly:
> On 26.9.2013 23:36, Yann E. MORIN wrote:
> > Hello All!
> > 
> > On 2013-09-22 01:21 +0200, Yann E. MORIN spake thusly:
> >> Stephen, All,
> >>
> >> Please, test this patch to fix the allmodconfig issue reported by
> >> Stephen.
> >>
> >> From my little testing (some randconfig followed by silentoldconfig, as
> >> well as allmodconfig), this patch seems to fix the issue without any
> >> regression I could ientify.
> >>
> >> But since this is sensitive code, I'd like some feedback before this
> >> gets applied.
> > 
> > Ping? :-)
> > 
> > I wanted to push this right after -rc3 is out. If any one has an issue
> > with that patch, you've got a few days to chime in! ;-)
> 
> It works for me, you can add my Tested-by: if you like. The only issue I
> have is that a more verbose changelog is missing.

OK. I'll rewrite the commit log with more details before I send the
final pull-request. Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

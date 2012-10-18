Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f66.google.com ([74.125.82.66]:62541 "EHLO
	mail-wg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752842Ab2JRTMV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Oct 2012 15:12:21 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig/menuconfig: use TAILQ instead of CIRCLEQ
Date: Thu, 18 Oct 2012 20:59:11 +0200
References: <1350581625-23153-1-git-send-email-yann.morin.1998@free.fr> <1350582958.3492.81.camel@YAAKOV04>
In-Reply-To: <1350582958.3492.81.camel@YAAKOV04>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201210182059.11499.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Benjamin Poirier <bpoirier@suse.de>

Yaakov, All,

On Thursday 18 October 2012 Yaakov (Cygwin/X) wrote:
> On Thu, 2012-10-18 at 19:33 +0200, Yann E. MORIN wrote:
> > Some systems (eg. Cygwin, FreeBSD) are missing the CIRCLEQ macros.
> > They were removed in Y2000 from FreeBSD:
> >     http://svnweb.freebsd.org/base?view=revision&revision=70469
> > 
> > The reason was that TAILQ are perfectly capable of doing the exact
> > same things:
> >     http://www.mavetju.org/mail/view_thread.php?list=freebsd-arch&id=915145&thread=yes
> > 
> > (Thank Yaakov for the pointers!)
> 
> And thank you again for the heads-up.
> 
> > So, switch to using TAILQ instead, which are more portable.
> > 
> > Reported-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> > Reported-by: Benjamin Poirier <bpoirier@suse.de>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Tested-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Out of curiosity: did you test on Cygwin?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

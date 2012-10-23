Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:41618 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757243Ab2JWREj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Oct 2012 13:04:39 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig/menuconfig: use TAILQ instead of CIRCLEQ
Date: Tue, 23 Oct 2012 19:04:30 +0200
References: <1350581625-23153-1-git-send-email-yann.morin.1998@free.fr> <20121023131248.GA4289@infradead.org>
In-Reply-To: <20121023131248.GA4289@infradead.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201210231904.31087.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Benjamin Poirier <bpoirier@suse.de>, Yaakov Selkowitz <yselkowitz@gmail.com>

Christoph, All,

On Tuesday 23 October 2012 Christoph Hellwig wrote:
> On Thu, Oct 18, 2012 at 07:33:45PM +0200, Yann E. MORIN wrote:
> > Some systems (eg. Cygwin, FreeBSD) are missing the CIRCLEQ macros.
> > They were removed in Y2000 from FreeBSD:
> >     http://svnweb.freebsd.org/base?view=revision&revision=70469
> > 
> > The reason was that TAILQ are perfectly capable of doing the exact
> > same things:
> >     http://www.mavetju.org/mail/view_thread.php?list=freebsd-arch&id=915145&thread=yes
> > 
> > (Thank Yaakov for the pointers!)
> > 
> > So, switch to using TAILQ instead, which are more portable.
> 
> Why not use the kernels list.h?

First, we can't use linux/list.h because it can't be included from userspace.
Second, it would not be convenient for those that use kconfig outside the
Linux kernel (thiord-party projects, eg. buildroot, uClibc, busybox...):
    http://marc.info/?l=linux-kbuild&m=135065985609068&w=2

Also, this patch of mine is deprecated; Benjamin has posted another patch
which makes use of a stripped-down list.h, partially copied from linux/list.h:
    http://marc.info/?t=135081179500001&r=1&w=4

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

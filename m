Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:61235 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753160Ab2KKQCc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Nov 2012 11:02:32 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v2] menuconfig: Replace CIRCLEQ by list_head-style lists.
Date: Sun, 11 Nov 2012 17:02:24 +0100
References: <1350754935-20014-1-git-send-email-benjamin.poirier@gmail.com> <201210222138.25805.yann.morin.1998@free.fr> <50893FCF.5030800@suse.cz>
In-Reply-To: <50893FCF.5030800@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201211111702.24556.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Benjamin Poirier <benjamin.poirier@gmail.com>, Jean Sacren <sakiwit@gmail.com>, Arnaud Lacombe <lacombar@gmail.com>, Wang YanQing <udknight@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Davidlohr Bueso <dave@gnu.org>, linux-kernel@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Michal, All,

On Thursday 25 October 2012 Michal Marek wrote:
> On 22.10.2012 21:38, Yann E. MORIN wrote:
> > On Sunday 21 October 2012 Benjamin Poirier wrote:
> >> Changes v1-v2:
> >> * integrate the patch/suggestion from Yann to fix problems related to the
> >>   usage of list.h with xconfig/c++
> >> 	* "new" keyword
> >> 	* offsetof redefinition
> >> * silly #endif placement mistake
[--SNIP--]
> I pushed it to kbuild.git#rc-fixes now and will send it to Linus for 3.7
> inclusion later.

Not trying to sound like a nuisance, but this has still not been pushed
to Linus yet... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

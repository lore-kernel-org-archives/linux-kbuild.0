Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:52738 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755452Ab2FGSGc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 14:06:32 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/3] scripts/config: be case-sensitive on config option symbols
Date: Thu, 7 Jun 2012 20:06:24 +0200
References: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr> <20120607025417.GJ27374@one.firstfloor.org>
In-Reply-To: <20120607025417.GJ27374@one.firstfloor.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201206072006.24915.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Andi, All,

On Thursday 07 June 2012 04:54:17 Andi Kleen wrote:
> > With this patch, if the KCONFIG_CASE environment variable is set to (with
> > no quotes):
> >   - 'upper': force symbols to upper-case
> >   - 'lower': force symbols to lower-case
> 
> That's ugly. How about a emacs style heuristic. When the config symbol
> is mixed case do not change the symbol?

Such a heuristic would still break with some of the symbols used in the Linux
tree:
  ./arch/powerpc/platforms/Kconfig.cputype:config 6xx
  ./arch/powerpc/platforms/Kconfig.cputype:config 8xx
  ./arch/powerpc/platforms/Kconfig.cputype:config 4xx

Not to say about other projects which may use lower-case only symbols.

What about adding an option to keep the case as-is:
    --keep-case|-k      Keep symbol's case (dont' upper-case it)

Ideally, we could also add (I'd make a separate patch for that):
    --upper-case|-U     Upper-case the symbol
    --lower-case|-l     Lower-case the symbol

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

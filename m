Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:20783 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932934Ab2FGVuA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 17:50:00 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/3] scripts/config: be case-sensitive on config option symbols
Date: Thu, 7 Jun 2012 23:49:55 +0200
References: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr> <201206072006.24915.yann.morin.1998@free.fr> <20120607181750.GO27374@one.firstfloor.org>
In-Reply-To: <20120607181750.GO27374@one.firstfloor.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201206072349.56057.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Andi, All,

On Thursday 07 June 2012 20:17:50 Andi Kleen wrote:
> > What about adding an option to keep the case as-is:
> >     --keep-case|-k      Keep symbol's case (dont' upper-case it)
> 
> That's fine.

OK, good. I'll code this tonight, and post an updated series.
Thank you!

For my information, what was the requirement for mangling the symbol in the
first place?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

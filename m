Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:55056 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753081Ab1AQWua (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Jan 2011 17:50:30 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: Where is the end of "menuconfig" entry scope?
Date: Mon, 17 Jan 2011 23:50:26 +0100
References: <AANLkTi=FYc=o04qZUoOT9u=7YMkqu-mtxT=EeJvR3iVg@mail.gmail.com> <4D3431CF.5070407@suse.cz> <AANLkTi=wkCsaeouJ=92v62JU7cfLQuDQ-nQoEMOuzep4@mail.gmail.com>
In-Reply-To: <AANLkTi=wkCsaeouJ=92v62JU7cfLQuDQ-nQoEMOuzep4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201101172350.26646.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Filip Honckiewicz <f.honckiewicz@gmail.com>

Filip, All,

On Monday 17 January 2011 23:39:17 Filip Honckiewicz wrote:
> It helped me a lot and now it's clear. Your example shows everything.
> In kconfig-language.txt there is:
>  "This is similar to the simple config entry above, but it also gives
> a hint to front ends, that all suboptions should be displayed as a
> separate list of options." and this "suboptions" fool me that if
> there're suboptions than there has to be ending of menuconfig entry;)

Maybe expressing this in a more understandable way, such as:

  The menuconfig scope ends with the last config options that depends
  on that menuconfig entry.

Is that more comprehensible? If so, maybe suggest a patch to clear up the
confusion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

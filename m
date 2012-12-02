Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f66.google.com ([74.125.82.66]:49459 "EHLO
	mail-wg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730Ab2LBRuP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 2 Dec 2012 12:50:15 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] lxdialog:inputbox: Fix can't change selected button with Left/Right when input box selected
Date: Sun, 2 Dec 2012 18:32:43 +0100
References: <20121202163509.GB20796@udknight>
In-Reply-To: <20121202163509.GB20796@udknight>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201212021832.44326.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Wang YanQing <udknight@gmail.com>, mmarek@suse.cz, linux-kernel@vger.kernel.org, rdunlap@xenotime.net, bp@alien8.de, sakiwit@gmail.com, lacombar@gmail.com, lucas.demarchi@profusion.mobi, dave@gnu.org, paul.gortmaker@windriver.com, crquan@gmail.com, bpoirier@suse.de

Wang, All,

On Sunday 02 December 2012 Wang YanQing wrote:
> inputbox code don't support use Left/Right to change input
> position in the input box, so it use continue to skip them
> when input key is Left/Right, but use break for Up/Down, so
> we can change selected button with Up/Down but we can't do it
> with Left/Right key when input box selected.
> This patch fix it.

Although I do understand the motivation behind your change, may I suggest
that left/right are used to navigate *inside* the input field, so it is
possible to modify the text in place?

The nconf frontend allows editing text in place, so I find it disturbing
not to be able to do it in mconf.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

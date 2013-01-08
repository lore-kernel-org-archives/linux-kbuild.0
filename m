Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f194.google.com ([74.125.82.194]:48767 "EHLO
	mail-we0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753716Ab3AHWEL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Jan 2013 17:04:11 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/2] nconf:  add keybindings for vi-style menu navigation, rewrite help texts
Date: Tue, 8 Jan 2013 23:04:06 +0100
References: <20121228185108.GA13644@voyt-hp> <1356723607-17027-1-git-send-email-dvv.kernel@gmail.com> <20121229223415.GB28355@mobil.systemanalysen.net>
In-Reply-To: <20121229223415.GB28355@mobil.systemanalysen.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201301082304.07120.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland Eggner <edvx1@systemanalysen.net>
Cc: linux-kbuild@vger.kernel.org, Dmitry Voytik <dvv.kernel@gmail.com>, Michal Marek <mmarek@suse.cz>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org

Roland, All,

On Saturday 29 December 2012 Roland Eggner wrote:
> On 2012-12-28 Friday at 23:40 +0400 Dmitry Voytik wrote:
> > Add alternative vi-style keys for the menu navigation:
> > <j>/<k> for down/up navigation, <C-f>/<C-b> for
> > page down/up, <g>/<G> for first/last menu item selection
> > and <l> for entering to a submenu.
> 
> Good starting point, thanks for your initial work.
> Here is completion of the work:
[--SNIP--]

OK, I'll queue these and test this weekend (see my previous reply to Dmitry).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'


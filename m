Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:18543 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751540Ab2BNBP3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Feb 2012 20:15:29 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [RFC] A packaging of the kconfig frontends
Date: Tue, 14 Feb 2012 02:15:26 +0100
References: <201201252352.59925.yann.morin.1998@free.fr>
In-Reply-To: <201201252352.59925.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201202140215.26759.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All!

On Wednesday 25 January 2012 23:52:59 Yann E. MORIN wrote:
> So I have taken the burden to package the kconfig frontends and parser into
> a package. The Mercurial repository is there:
>     hg clone http://ymorin.is-a-geek.org/hg/kconfig-frontends/
> 
> So, what do you get in this package ?
>  - all 5 frontends, each individually selectable with configure flags
>  - a static library with the parser (not installed, though)
>  - a standard autotools-based build procedure
>  - a simple kernel-to-package synchronisation

I'm still playing around with this packaging, and now the parser can be
built as
 - a versioned shared library (the default)
 - an un-versioned static library (optional)

The frontends then properly link to the available library, preferably the
shared one if both are built.

There still are some issues wrt library dependencies (everything depends on
the ncurses libs, because there is no clear seaparation in ./configure for
now).

I'm ready to read comments or suggestions. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

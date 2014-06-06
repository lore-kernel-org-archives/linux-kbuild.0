Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:56908 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866AbaFFNS1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 09:18:27 -0400
Date: Fri, 6 Jun 2014 15:18:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] kconfig: nconfig: fix multi-byte UTF handling
Message-ID: <20140606131813.GD4889@ravnborg.org>
References: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
 <1401868351-24014-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401868351-24014-3-git-send-email-computersforpeace@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Martin Walch <walch.martin@web.de>

On Wed, Jun 04, 2014 at 12:52:31AM -0700, Brian Norris wrote:
> Currently, Kconfig descriptions that use multi-byte UTF-8 characters
> (such as MTD_NAND_CAFE) will have their menu entries dropped from the
> 'make nconfig' ncurses menu, and all subsequent entries in the same
> window will be omitted. This seems to be due to the ncurses 'menu'
> library, which does not traditionally handle UTF-8 >8-bit characters
> properly.
> 
> The ncursesw library ('w' is for "wide") is written to handle these
> UTF-8 characters, and is practically a drop-in replacement at the source
> level. Use it by default, if available.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=43067
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Martin Walch <walch.martin@web.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:34867 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752129AbaFFNSD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 09:18:03 -0400
Date: Fri, 6 Jun 2014 15:17:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/2] kconfig: fix multi-byte UTF handling in nconfig
Message-ID: <20140606131748.GC4889@ravnborg.org>
References: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>

On Wed, Jun 04, 2014 at 12:52:29AM -0700, Brian Norris wrote:
> Hi,
> 
> The first patch is trivial.
> 
> The second is inspired by a long-standing bugzilla entry:
> 
>   https://bugzilla.kernel.org/show_bug.cgi?id=43067
> 
> The MTD_NAND_CAFE Kconfig symbol (drivers/mtd/nand/Kconfig) has description
> text which uses a multi-byte UTF-8 character: the 'É' in 'CAFÉ'. This
> character (and other similar >8bit UTF-8 characters) is not handled
> correctly by many of the kernel configuration tools (notably 'make nconfig'
> and 'make xconfig'). nconfig was especially broken, as it would completely
> drop any menu entry which had non-ASCII characters, as well as ALL
> subsequent entries in the same window (!!).
Thanks for fixing this.

	Sam

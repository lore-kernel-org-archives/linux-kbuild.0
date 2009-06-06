Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:53292 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752813AbZFFAlP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 20:41:15 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 17/39] kbuild: fix header export when __ASSEMBLY__ is used
Date: Sat, 6 Jun 2009 00:41:07 +0000
References: <20090605233720.GA13588@uranus.ravnborg.org> <1244245377-17441-17-git-send-email-sam@ravnborg.org>
In-Reply-To: <1244245377-17441-17-git-send-email-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906060041.07600.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Russell King <rmk+lkml@arm.linux.org.uk>, Jaswinder Singh Rajput <jaswinder@kernel.org>

On Friday 05 June 2009 11:42:35 pm Sam Ravnborg wrote:
> Because it does not know __ASSEMBLY__ it does not
> detect that htis is not for userspace.
> This caused too much code to be exported, and headers_check barfed
> over this code.
> 
> For arm this fixes following "make headers_check" warning:
> /usr/include/asm/hwcap.h:29: extern's make no sense in userspace

Are you sure that this is safe for all user space? If a user application
for instance includes asm/signal.h or asm/types.h from assembly (for
whatever reason), it now breaks.

I can't think of a good reason why anyone would do such a thing,
but it used to be possible.

	Arnd <><

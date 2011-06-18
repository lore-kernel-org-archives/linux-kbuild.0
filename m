Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:51105 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752911Ab1FRWnI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Jun 2011 18:43:08 -0400
From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] um: Reinstate kernel version in generated .config
Date: Sun, 19 Jun 2011 00:43:02 +0200
References: <1308432865-9730-1-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1308432865-9730-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201106190043.02536.richard@nod.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jeff Dike <jdike@addtoit.com>, Arnaud Lacombe <lacombar@gmail.com>, user-mode-linux-devel@lists.sourceforge.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Am Samstag 18 Juni 2011, 23:34:25 schrieb Geert Uytterhoeven:
> commit 0954828fcbf3bd13d593499b16b901a4e801b0b9 ("kconfig: replace
> KERNELVERSION usage by the mainmenu's prompt") made the kernel version
> disappear from the generated .config file when configuring for UML.
> As UML's Kconfig doesn't have a mainmenu, kconfig falls back to the
> default string "Linux Kernel Configuration".
> 
> Add a suitable mainmenu to the main UML Kconfig file to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied!

Thanks,
//richard

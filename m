Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:65294 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751646AbbDOKlg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Apr 2015 06:41:36 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] modpost: add .text.fixup to OTHER_TEXT_SECTIONS
Date: Wed, 15 Apr 2015 12:40:52 +0200
Message-ID: <2576764.pLO2LLU9HG@wuerfel>
In-Reply-To: <5641468.B6ky8Ch4vY@wuerfel>
References: <5641468.B6ky8Ch4vY@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, linux-kbuild@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Nicolas Pitre <nico@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Wednesday 15 April 2015 11:48:31 Arnd Bergmann wrote:
> Two correct patches for the 4.1 release clashed in a way that
> caused modpost to fail badly, with hundreds warnings like
> 
> WARNING: vmlinux.o(__ex_table+0x1014): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .text.fixup:(unknown)
> 
> The fix, as suggested by the warnings, is to add the new .text.fixup
> section into the OTHER_TEXT_SECTIONS list.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 52dc0595d540 ("modpost: handle relocations mismatch in __ex_table")
> Fixes: c4a84ae39b4a ("ARM: 8322/1: keep .text and .fixup regions closer together")
> ---
> The mostpost patch has not made it into 4.1 yet, so it's probably best to
> add this fix on top of that to avoid breaking when Linus pulls it in.
> 

Nevermind this patch, I'm way behind the times apparently, and multiple
improvements of the original code have made it in since it was broken.

	Arnd

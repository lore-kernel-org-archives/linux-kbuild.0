Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lithops.sigma-star.at ([195.201.40.130]:59052 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728948AbeHFXFd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 19:05:33 -0400
From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/3] Kbuild: fix and clean-up arch/um/Makefile
Date: Mon, 06 Aug 2018 22:54:33 +0200
Message-ID: <1901723.5RX4ofS7Gn@blindfold>
In-Reply-To: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
References: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Am Samstag, 4. August 2018, 06:47:00 CEST schrieb Masahiro Yamada:
> 
> 1/3 fixes the build failure reported by Randy.
> (I may have seen a similar report before, but I cannot recall it.)
> 
> 2/3 and 3/3 clean-up the Makefile a bit more.
> 
> I'd like to apply this series to kbuild tree.
> Ack from UML folks are appreciated.

Nice to see this fixed, Masahiro! :-)

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard

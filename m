Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:52812 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbeHEDB0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Aug 2018 23:01:26 -0400
Subject: Re: [PATCH 0/3] Kbuild: fix and clean-up arch/um/Makefile
References: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <086167f3-5ed3-1184-bb6f-6c86a5bd6a77@infradead.org>
Date: Sat, 4 Aug 2018 17:58:41 -0700
MIME-Version: 1.0
In-Reply-To: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

On 08/03/2018 09:47 PM, Masahiro Yamada wrote:
> 1/3 fixes the build failure reported by Randy.
> (I may have seen a similar report before, but I cannot recall it.)
> 
> 2/3 and 3/3 clean-up the Makefile a bit more.
> 
> I'd like to apply this series to kbuild tree.
> Ack from UML folks are appreciated.
> 
> 
> 
> Masahiro Yamada (3):
>   um: fix parallel building with O= option
>   kbuild: add %asm-generic to no-dot-config-targets
>   um: clean up archheaders recipe
> 
>  Makefile         | 2 +-
>  arch/um/Makefile | 9 +--------
>  2 files changed, 2 insertions(+), 9 deletions(-)
> 

for the series:
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy

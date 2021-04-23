Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D084C433B4
	for <linux-kbuild@archiver.kernel.org>; Fri, 23 Apr 2021 12:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31EEF60C40
	for <linux-kbuild@archiver.kernel.org>; Fri, 23 Apr 2021 12:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242249AbhDWMXL (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 23 Apr 2021 08:23:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:38488 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230305AbhDWMXK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Apr 2021 08:23:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZupM-00019R-04; Fri, 23 Apr 2021 14:22:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 59296C0B3B; Fri, 23 Apr 2021 14:11:32 +0200 (CEST)
Date:   Fri, 23 Apr 2021 14:11:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: select ARCH_KEEP_MEMBLOCK unconditionally
Message-ID: <20210423121132.GE8582@alpha.franken.de>
References: <20210407173543.3598006-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407173543.3598006-1-ndesaulniers@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 10:35:43AM -0700, Nick Desaulniers wrote:
> While removing allnoconfig_y from Kconfig, ARCH=mips allnoconfig builds
> started failing with the error:
> 
> WARNING: modpost: vmlinux.o(.text+0x9c70): Section mismatch in reference
> from the function reserve_exception_space() to the function
> .meminit.text:memblock_reserve()
> The function reserve_exception_space() references the function __meminit
> memblock_reserve().
> This is often because reserve_exception_space lacks a __meminit
> annotation or the annotation of memblock_reserve is wrong.
> ERROR: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> 
> allnoconfig disables DEBUG_KERNEL and thus ARCH_KEEP_MEMBLOCK, which
> changes __init_memblock to be equivalent to __meminit triggering the
> above error.
> 
> Link: https://lore.kernel.org/linux-kbuild/20210313194836.372585-11-masahiroy@kernel.org/
> Fixes: commit a8c0f1c634507 ("MIPS: Select ARCH_KEEP_MEMBLOCK if
> DEBUG_KERNEL to enable sysfs memblock debug")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next. I've dropped the Fixes tag, because it doesn't
fix this commit. Sidenode wouldn't it make sence to make 
reserve_exception_space() as __meminit ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

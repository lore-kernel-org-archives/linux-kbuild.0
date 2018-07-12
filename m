Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:46910 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbeGLOP3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 10:15:29 -0400
Received: by mail-pf0-f195.google.com with SMTP id l123-v6so20650880pfl.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jul 2018 07:05:45 -0700 (PDT)
Date: Thu, 12 Jul 2018 17:05:40 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH 0/6] kbuild: clean-up and rename LDFLAGS to KBUILD_LDFLAGS
Message-ID: <20180712140539.4b5xdraq34i5dbii@kshutemo-mobl1>
References: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Richard Weinberger <richard@nod.at>, x86@kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Jeff Dike <jdike@addtoit.com>

On Thu, Jul 12, 2018 at 05:01:30PM +0900, Masahiro Yamada wrote:
> 
> This series renames LDFLAGS to KBUILD_LDFLAGS
> after some Makefile cleanups.
> 
> Currently, the last patch does not apply to Linus' tree
> due to missing pre-requisite patches.
> 
> I will resolve conflicts as needed.
> 
> 
> 
> Masahiro Yamada (6):
>   um: remove redundant 'export LDFLAGS' in arch/x86/Makefile.um
>   ARM: vfp: clean-up arch/arm/vfp/Makefile
>   kbuild: remove redundant LDFLAGS clearing in arch/*/Makefile
>   kbuild: replace $(LDFLAGS) $(ldflags-y) with $(ld_flags)
>   kbuild: change ld_flags to contain LDFLAGS_$(@F)
>   kbuild: rename LDFLAGS to KBUILD_LDFLAGS

Thanks! Looks sane to me

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov

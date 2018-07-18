Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22961 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbeGSAWM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 20:22:12 -0400
MIME-Version: 1.0
In-Reply-To: <20180712140539.4b5xdraq34i5dbii@kshutemo-mobl1>
References: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com> <20180712140539.4b5xdraq34i5dbii@kshutemo-mobl1>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Jul 2018 08:41:04 +0900
Message-ID: <CAK7LNAThEpLsFgD_pv4ZgLWfbXcNPBiPEU7qZ5ah_R=x8LQA0w@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: clean-up and rename LDFLAGS to KBUILD_LDFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, openrisc@lists.librecores.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-riscv@lists.infradead.org, Jeff Dike <jdike@addtoit.com>

2018-07-12 23:05 GMT+09:00 Kirill A. Shutemov <kirill@shutemov.name>:
> On Thu, Jul 12, 2018 at 05:01:30PM +0900, Masahiro Yamada wrote:
>>
>> This series renames LDFLAGS to KBUILD_LDFLAGS
>> after some Makefile cleanups.
>>
>> Currently, the last patch does not apply to Linus' tree
>> due to missing pre-requisite patches.
>>
>> I will resolve conflicts as needed.
>>
>>
>>
>> Masahiro Yamada (6):
>>   um: remove redundant 'export LDFLAGS' in arch/x86/Makefile.um
>>   ARM: vfp: clean-up arch/arm/vfp/Makefile
>>   kbuild: remove redundant LDFLAGS clearing in arch/*/Makefile
>>   kbuild: replace $(LDFLAGS) $(ldflags-y) with $(ld_flags)
>>   kbuild: change ld_flags to contain LDFLAGS_$(@F)
>>   kbuild: rename LDFLAGS to KBUILD_LDFLAGS
>
> Thanks! Looks sane to me
>
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>


Patch 1, 3, 4, 5 applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada

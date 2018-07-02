Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:49098 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752237AbeGBUIS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 16:08:18 -0400
Subject: Re: [PATCH 1/5] kconfig: include common Kconfig files from top-level
 Kconfig
From: Randy Dunlap <rdunlap@infradead.org>
References: <20180702144711.22111-1-hch@lst.de>
 <20180702144711.22111-2-hch@lst.de>
 <5c090e3f-ced0-62c5-c511-f4c66804ed32@infradead.org>
Message-ID: <4dfba139-43a2-5949-3221-39cae3191ae7@infradead.org>
Date: Mon, 2 Jul 2018 13:08:16 -0700
MIME-Version: 1.0
In-Reply-To: <5c090e3f-ced0-62c5-c511-f4c66804ed32@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/02/18 13:03, Randy Dunlap wrote:
> On 07/02/18 07:47, Christoph Hellwig wrote:
>> Instead of duplicating the source statements in every architecture just
>> do it once in the toplevel Kconfig file.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  Kconfig                 | 22 ++++++++++++++++++++++
>>  arch/alpha/Kconfig      | 20 --------------------
>>  arch/arc/Kconfig        | 16 ----------------
>>  arch/arm/Kconfig        | 25 -------------------------
>>  arch/arm64/Kconfig      | 23 -----------------------
>>  arch/c6x/Kconfig        | 24 ------------------------
>>  arch/h8300/Kconfig      | 24 ------------------------
>>  arch/hexagon/Kconfig    | 16 ----------------
>>  arch/ia64/Kconfig       | 20 --------------------
>>  arch/m68k/Kconfig       | 24 ------------------------
>>  arch/microblaze/Kconfig | 24 ------------------------
>>  arch/mips/Kconfig       | 24 ------------------------
>>  arch/nds32/Kconfig      | 16 ----------------
>>  arch/nios2/Kconfig      | 24 ------------------------
>>  arch/openrisc/Kconfig   | 23 -----------------------
>>  arch/parisc/Kconfig     | 24 ------------------------
>>  arch/powerpc/Kconfig    | 19 -------------------
>>  arch/riscv/Kconfig      | 24 ------------------------
>>  arch/s390/Kconfig       | 24 ------------------------
>>  arch/sh/Kconfig         | 24 ------------------------
>>  arch/sparc/Kconfig      | 24 ------------------------
>>  arch/unicore32/Kconfig  | 24 ------------------------
>>  arch/x86/Kconfig        | 22 +---------------------
>>  arch/xtensa/Kconfig     | 25 -------------------------
>>  24 files changed, 23 insertions(+), 512 deletions(-)
>>
>> diff --git a/Kconfig b/Kconfig
>> index a90d9f9e268b..5499b1273ba5 100644
>> --- a/Kconfig
>> +++ b/Kconfig
>> @@ -10,3 +10,25 @@ comment "Compiler: $(CC_VERSION_TEXT)"
>>  source "scripts/Kconfig.include"
>>  
>>  source "arch/$(SRCARCH)/Kconfig"
>> +
>> +source "init/Kconfig"
> 
> Hi Christoph,
> 
> Looks good overall.  I'm still doing some testing on it.
> 
> I would prefer to have init/Kconfig before arch/$(SRCARCH)/Kconfig.

Ugh, that won't get this set correctly on x86_64:
CONFIG_PGTABLE_LEVELS=2

> Is there a reason that you chose the ordering above?
> Any known dependencies?
> 
> Thanks.
> 
>> +
>> +source "kernel/Kconfig.freezer"
>> +
>> +menu "Executable file formats"
>> +source "fs/Kconfig.binfmt"
>> +endmenu
>> +
>> +source "mm/Kconfig"
>> +
>> +source "net/Kconfig"
>> +
>> +source "drivers/Kconfig"
>> +
>> +source "fs/Kconfig"
>> +
>> +source "security/Kconfig"
>> +
>> +source "crypto/Kconfig"
>> +
>> +source "lib/Kconfig"
> 
> 


-- 
~Randy

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg003.nifty.com ([202.248.44.41]:62099 "EHLO
	conssluserg003-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750903AbbHRKyi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Aug 2015 06:54:38 -0400
MIME-Version: 1.0
In-Reply-To: <20150818104458.GO7557@n2100.arm.linux.org.uk>
References: <1439049211-4181-1-git-send-email-yamada.masahiro@socionext.com>
	<20150818104458.GO7557@n2100.arm.linux.org.uk>
Date: Tue, 18 Aug 2015 19:54:31 +0900
Message-ID: <CAK7LNAQ6kqoV_6zYA_6C-Gop8vbs66gsWDVZGrTong290Z_KWw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: add boot image dependencies to not generate
 invalid images
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Russell,


2015-08-18 19:44 GMT+09:00 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> On Sun, Aug 09, 2015 at 12:53:31AM +0900, Masahiro Yamada wrote:
>> U-Boot is often used to boot the kernel on ARM boards, but uImage
>> is not built by "make all", so we are often inclined to do
>> "make all uImage" to generate DTBs, modules and uImage in a single
>> command, but we should notice a pitfall behind it.  In fact,
>> "make all uImage" could generate an invalid uImage if it is run with
>> the parallel option (-j).
>
> Please put this patch in the patch system.  Thanks.


I posted it yesterday.

ID: 8418/1



-- 
Best Regards
Masahiro Yamada

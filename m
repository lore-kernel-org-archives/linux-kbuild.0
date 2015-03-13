Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35987 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754562AbbCMTSS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 15:18:18 -0400
Message-ID: <550337F6.70404@gmail.com>
Date: Fri, 13 Mar 2015 12:18:14 -0700
From: Frank Rowand <frowand.list@gmail.com>
Reply-To: frowand.list@gmail.com
MIME-Version: 1.0
Subject: Re: [Patch v3 1/3] dt: OF_UNITTEST make dependency broken, framework
 fixes
References: <5501918D.2020000@gmail.com> <CAL_JsqLbXJFT4+bnyksHmE9TWJbHuHpujiJOc2MOajO5Xem_+g@mail.gmail.com>
In-Reply-To: <CAL_JsqLbXJFT4+bnyksHmE9TWJbHuHpujiJOc2MOajO5Xem_+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.cz>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org

On 3/13/2015 6:13 AM, Rob Herring wrote:
> On Thu, Mar 12, 2015 at 8:15 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sonymobile.com>
>>
>> This 3 patch series is not bisectable.  If CONFIG_OF_UNITTEST=y then the kernel
>> will not build with just patch 1 or just patches 1 and 2 applied.
> 
> If you did 2 patches with the move first, wouldn't that make it
> bisectable. However, I'd rather avoid the move.

Yes, I did not like the move either.  Fortunately you gave me the cluebat I needed
to avoid the move.

> 
>> If CONFIG_OF_UNITTEST=y then a kernel image make will always cause .version to
>> be incremented, even if there are not source changes.  This is caused by
>> a lack of dependency tracking and checking for
>> drivers/of/unittest-data/testcases.dtb.o.  Fixing the problem was made more
>> complicated by the fact that testcases.dtb.o was linked into ../of_unittest.o.
> 
> Couldn't we change that to be 2 modules.

Thanks, that was just the hint I needed to realize that of_unittest.o was
just an artifact of the problem I was trying to solve.  I will send a new
patch that removes the of_unittest.o cruft and does not need to move unittest.c

> 
>> Patch 1 modifies makefiles to move of_unittest.c into unittest-data/ and
>> creates missing dependency tracking for testcases.dtb.o.
>>
>> Patch 2 will move of_unittest.c into unittest-data/
>>
>> Patch 3 will fix an of_unittest.c include path to account for the move.
> 
> This should all be in an intro email, not patch #1.


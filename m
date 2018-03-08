Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46546 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751684AbeCHImH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Mar 2018 03:42:07 -0500
MIME-Version: 1.0
In-Reply-To: <20180308070948.GA5187@saruman>
References: <20180307140633.26182-1-jhogan@kernel.org> <7ecea7ca-2931-16bc-a110-1ecdaf17f0f2@gmail.com>
 <20180307202511.GT4197@saruman> <a6c448df-c026-dafe-6d34-801f69ca64fe@gmail.com>
 <20180308070948.GA5187@saruman>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Mar 2018 17:41:21 +0900
Message-ID: <CAK7LNARfTxxb0_RNEPvBzuEqP_g-cajZGpaGSuMJBUwDW66yww@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Handle builtin dtb files containing hyphens
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <jhogan@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Linux-MIPS <linux-mips@linux-mips.org>, stable <stable@vger.kernel.org>

2018-03-08 16:09 GMT+09:00 James Hogan <jhogan@kernel.org>:
> On Wed, Mar 07, 2018 at 03:19:11PM -0800, Frank Rowand wrote:
>> On 03/07/18 12:25, James Hogan wrote:
>> > On Wed, Mar 07, 2018 at 12:11:41PM -0800, Frank Rowand wrote:
>> >> On 03/07/18 06:06, James Hogan wrote:
>> >>> Quite a lot of dts files have hyphens, but its only a problem on MIPS
>> >>> where such files can be built into the kernel. For example when
>> >>> CONFIG_DT_NETGEAR_CVG834G=y, or on BMIPS kernels when the dtbs target is
>> >>> used (in the latter case it admitedly shouldn't really build all the
>> >>> dtb.o files, but thats a separate issue).
>
>> > I'll keep the paragraph about MIPS and the example configuration though,
>> > as I think its important information to reproduce the problem, and to
>> > justify why it wouldn't be appropriate to just rename the files (which
>> > was my first reaction).
>>
>> Other than the part that says "its only a problem on MIPS".  That is
>> pedantically correct because no other architecture (that I am aware
>> of, not that I searched) currently has a devicetree source file name
>> with a hyphen in it, where that file is compiled into the kernel as
>> an asm file.  But it is potentially a problem on any architecture
>> to it is misleading to label it as MIPS only.
>
> Okay I'll reword to make it clearer and do a v2.
>
> Thanks
> James


The code looks good.
If you send v2, I can shortly apply it to the fixes branch.

If possible, I want to send a PR this weekend.



-- 
Best Regards
Masahiro Yamada

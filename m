Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:38253 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754500AbeCGXTO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Mar 2018 18:19:14 -0500
Subject: Re: [PATCH] kbuild: Handle builtin dtb files containing hyphens
References: <20180307140633.26182-1-jhogan@kernel.org>
 <7ecea7ca-2931-16bc-a110-1ecdaf17f0f2@gmail.com>
 <20180307202511.GT4197@saruman>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <a6c448df-c026-dafe-6d34-801f69ca64fe@gmail.com>
Date: Wed, 7 Mar 2018 15:19:11 -0800
MIME-Version: 1.0
In-Reply-To: <20180307202511.GT4197@saruman>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <jhogan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org, stable@vger.kernel.org

On 03/07/18 12:25, James Hogan wrote:
> On Wed, Mar 07, 2018 at 12:11:41PM -0800, Frank Rowand wrote:
>> I initially misread the patch description (and imagined an entirely
>> different problem).
>>
>>
>> On 03/07/18 06:06, James Hogan wrote:
>>> On dtb files which contain hyphens, the dt_S_dtb command to build the> dtb.S files (which allow DTB files to be built into the kernel) results> in errors like the following:> > bcm3368-netgear-cvg834g.dtb.S: Assembler messages:> bcm3368-netgear-cvg834g.dtb.S:5: Error: : no such section> bcm3368-netgear-cvg834g.dtb.S:5: Error: junk at end of line, first unrecognized character is `-'> bcm3368-netgear-cvg834g.dtb.S:6: Error: unrecognized opcode `__dtb_bcm3368-netgear-cvg834g_begin:'> bcm3368-netgear-cvg834g.dtb.S:8: Error: unrecognized opcode `__dtb_bcm3368-netgear-cvg834g_end:'> bcm3368-netgear-cvg834g.dtb.S:9: Error: : no such section> bcm3368-netgear-cvg834g.dtb.S:9: Error: junk at end of line, first unrecognized character is `-'
>> Please replace the following section:
>>
>>> This is due to the hyphen being used in symbol names. Replace all
>>> hyphens 
>>> with underscores in the dt_S_dtb command to avoid this problem.
>>>
>>> Quite a lot of dts files have hyphens, but its only a problem on MIPS
>>> where such files can be built into the kernel. For example when
>>> CONFIG_DT_NETGEAR_CVG834G=y, or on BMIPS kernels when the dtbs target is
>>> used (in the latter case it admitedly shouldn't really build all the
>>> dtb.o files, but thats a separate issue).
>>
>> with:
>>
>>    cmd_dt_S_dtb constructs the assembly source to incorporate a devicetree
>>    FDT (that is, the .dtb file) as binary data in the kernel image.
>>    This assembly source contains labels before and after the binary data.
>>    The label names incorporate the file name of the corresponding .dtb
>>    file.  Hyphens are not legal characters in labels, so transform all
>>    hyphens from the file name to underscores when constructing the labels.
> 
> Thanks, that is clearer.
> 
> I'll keep the paragraph about MIPS and the example configuration though,
> as I think its important information to reproduce the problem, and to
> justify why it wouldn't be appropriate to just rename the files (which
> was my first reaction).

Other than the part that says "its only a problem on MIPS".  That is
pedantically correct because no other architecture (that I am aware
of, not that I searched) currently has a devicetree source file name
with a hyphen in it, where that file is compiled into the kernel as
an asm file.  But it is potentially a problem on any architecture
to it is misleading to label it as MIPS only.


> 
>> Reviewed-by: Frank Rowand <frowand.list@gmail.com>
> 
> Thanks
> James
> 


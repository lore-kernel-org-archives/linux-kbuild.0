Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43195 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbgAQTNM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 14:13:12 -0500
Subject: Re: [RFC PATCH 0/3] Add device tree build information
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
Date: Fri, 17 Jan 2020 13:13:08 -0600
MIME-Version: 1.0
In-Reply-To: <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org


On 1/16/20 2:19 AM, Alexandre Torgue wrote:
> Hi Franck,
> 
> On 1/16/20 3:28 AM, Frank Rowand wrote:
>> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>>> Hi,
>>>
>>> The goal of this series is to add device tree build information in dtb.
>>> This information can be dtb build date, where devicetree files come from,
>>> who built the dtb ... Actually, same kind of information that you can find
>>> in the Linux banner which is printout during kernel boot. Having the same
>>> kind of information for device tree is useful for debugging and maintenance.
>>>
>>> To achieve that a new option "-B" (using an argument) is added to dtc.
>>> The argument is a file containing a string with build information
>>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>>> DTC use it to append dts file with a new string property "Build-info".
>>>
>>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>>> last part could be improved for sure).
>>
>> Please read through the thread at:
>>
>>    https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
>>
>> which was my attempt to do something similar.
> 
> Yes the idea is the same: get build DTB information like build date,
> "who built the DTB" ... The difference seems to be the way to do it.
> In my case, I don't want to modify existing dts source files., but I
> "just" append them by creating a new property with a string
> containing this build information.> 
> Why your proposition has not been accepted ?

Since you are asking this question, I am presuming that you did not
read the replies in the thread I referenced.  Please read through
the entire thread.  Most of the review comments were objecting to
the concept of my proposal.

-Frank

> 
> Regards
> Alex
> 
>>
>> -Frank
>>
>>>
>>> Regards
>>> Alex
>>>
>>> Alexandre Torgue (3):
>>>    dtc: Add dtb build information option
>>>    of: fdt: print dtb build information
>>>    scripts: Use -B dtc option to generate dtb build information.
>>>
>>>   drivers/of/fdt.c           |  9 +++++++
>>>   scripts/Makefile.lib       | 11 +++++---
>>>   scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>>   scripts/gen_dtb_build_info | 11 ++++++++
>>>   4 files changed, 76 insertions(+), 10 deletions(-)
>>>   create mode 100755 scripts/gen_dtb_build_info
>>>
>>
> 

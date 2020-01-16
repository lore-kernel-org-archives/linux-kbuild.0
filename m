Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:60660 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729472AbgAPITw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 03:19:52 -0500
Subject: Re: [RFC PATCH 0/3] Add device tree build information
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
Date: Thu, 16 Jan 2020 09:19:22 +0100
MIME-Version: 1.0
In-Reply-To: <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

Hi Franck,

On 1/16/20 3:28 AM, Frank Rowand wrote:
> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>> Hi,
>>
>> The goal of this series is to add device tree build information in dtb.
>> This information can be dtb build date, where devicetree files come from,
>> who built the dtb ... Actually, same kind of information that you can find
>> in the Linux banner which is printout during kernel boot. Having the same
>> kind of information for device tree is useful for debugging and maintenance.
>>
>> To achieve that a new option "-B" (using an argument) is added to dtc.
>> The argument is a file containing a string with build information
>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>> DTC use it to append dts file with a new string property "Build-info".
>>
>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>> last part could be improved for sure).
> 
> Please read through the thread at:
> 
>    https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
> 
> which was my attempt to do something similar.

Yes the idea is the same: get build DTB information like build date, 
"who built the DTB" ... The difference seems to be the way to do it. In 
my case, I don't want to modify existing dts source files., but I "just" 
append them by creating a new property with a string containing this 
build information.

Why your proposition has not been accepted ?

Regards
Alex

> 
> -Frank
> 
>>
>> Regards
>> Alex
>>
>> Alexandre Torgue (3):
>>    dtc: Add dtb build information option
>>    of: fdt: print dtb build information
>>    scripts: Use -B dtc option to generate dtb build information.
>>
>>   drivers/of/fdt.c           |  9 +++++++
>>   scripts/Makefile.lib       | 11 +++++---
>>   scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>   scripts/gen_dtb_build_info | 11 ++++++++
>>   4 files changed, 76 insertions(+), 10 deletions(-)
>>   create mode 100755 scripts/gen_dtb_build_info
>>
> 

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41657 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgBXA52 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Feb 2020 19:57:28 -0500
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-2-alexandre.torgue@st.com>
 <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
 <20200223215936.GB1751@umbus.fritz.box>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <9e77ace1-6821-1094-85e0-a68228b2609d@gmail.com>
Date: Sun, 23 Feb 2020 18:57:25 -0600
MIME-Version: 1.0
In-Reply-To: <20200223215936.GB1751@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

On 2/23/20 3:59 PM, David Gibson wrote:
> On Fri, Feb 21, 2020 at 11:52:34AM -0600, Frank Rowand wrote:
>> On 2/21/20 10:14 AM, Alexandre Torgue wrote:
>>> This commit adds a new script to create a file (in dts file directory) with
>>> some information (date, Linux version, user). This file could then be used
>>> to populate "build-info" property in every dts file that would use this
>>> build information:
>>>
>>> Example:
>>>
>>> / {
>>> 	...
>>> 	build-info = /incbin/("dtb-build.txt");
>>
>> s/.txt/.dtsi/
> 
> I don't think that makes sense.  This is an /incbin/ not an /include/
> so the text file is *not* dts information.

You are right, thanks for catching that.

-Frank

> 
>> and same wherever the file name is used.
>>
>>
>>> 	...
>>> };
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>>
>>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>>> index bae62549e3d2..a5af84ef4ffc 100644
>>> --- a/scripts/Makefile.lib
>>> +++ b/scripts/Makefile.lib
>>> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>>>  # DTC
>>>  # ---------------------------------------------------------------------------
>>>  DTC ?= $(objtree)/scripts/dtc/dtc
>>> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>>>  
>>>  # Disable noisy checks by default
>>>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>>> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>>  
>>>  quiet_cmd_dtc = DTC     $@
>>>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>>> +	$(DTB_GEN_INFO) $(src) ; \
>>>  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>>>  	$(DTC) -O $(2) -o $@ -b 0 \
>>>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>>> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
>>> new file mode 100755
>>> index 000000000000..0cd8bd98e410
>>> --- /dev/null
>>> +++ b/scripts/gen_dtb_build_info.sh
>>> @@ -0,0 +1,10 @@
>>> +#!/bin/bash
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +
>>> +set -o nounset
>>> +
>>> +DTB_DIR=$1
>>> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>>> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
>>
>> I would remove the filler words "From", "by", "the", and the trailing
>> period ('.').
>>
>> <bikeshed>
>> You might consider using a format more like the Linux
>> kernel version line, which puts parenthesis around the
>> compiled by info.
>> </bikeshed>
>>
>> -Frank
>>
>>> +
>>> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
>>>
>>
> 

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f66.google.com ([209.85.161.66]:39885 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgBZQio (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 11:38:44 -0500
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
References: <20200221161217.20069-1-alexandre.torgue@st.com>
 <20200221161217.20069-2-alexandre.torgue@st.com>
 <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <e0b65cba-6e37-8937-897d-ae82973f34e8@gmail.com>
Date: Wed, 26 Feb 2020 10:38:40 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michal Marek <michal.lkml@markovi.net>, David Gibson <david@gibson.dropbear.id.au>, Simon Glass <sjg@chromium.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Ian Lepore <ian@freebsd.org>

Hi Alexandre,

On 2/24/20 11:45 AM, Masahiro Yamada wrote:
> Hi.
> 
> On Sat, Feb 22, 2020 at 1:12 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
>>
>> This commit adds a new script to create a file (in dts file directory) with
>> some information (date, Linux version, user). This file could then be used
>> to populate "build-info" property in every dts file that would use this
>> build information:
>>
>> Example:
>>
>> / {
>>         ...
>>         build-info = /incbin/("dtb-build.txt");
>>         ...
>> };
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index bae62549e3d2..a5af84ef4ffc 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>>  # DTC
>>  # ---------------------------------------------------------------------------
>>  DTC ?= $(objtree)/scripts/dtc/dtc
>> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>>
>>  # Disable noisy checks by default
>>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>
>>  quiet_cmd_dtc = DTC     $@
>>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>> +       $(DTB_GEN_INFO) $(src) ; \
>>         $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>>         $(DTC) -O $(2) -o $@ -b 0 \
>>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
>> new file mode 100755
>> index 000000000000..0cd8bd98e410
>> --- /dev/null
>> +++ b/scripts/gen_dtb_build_info.sh
>> @@ -0,0 +1,10 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +set -o nounset
>> +
>> +DTB_DIR=$1
>> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
>> +
>> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
>> --
>> 2.17.1
>>
> 
> 
> There are more than 1000 *.dts files
> in arch/arm/boot/dts/.
> 
> So, with this patch, the build system will creates
> arch/arm/boot/dts/dtb-build.txt 1000 times.
> 
> 
> Does it work with parallel build ?
> 
> Think about what would happen
> with 'make -j32 ARCH=arm  dtbs'
> 
> 
> The 32 threads will write to
> arch/arm/boot/dts/dtb-build.txt
> at the same time.
> 
> Then, some of DTB would very likely to
> include the broken dtb-build.txt
> 
> 
> A list of missing parts in this approach:
> 
>  - make it work with parallel build
>  - clean it up with 'make clean'
>  - add it .gitignore  (and Documentation/dontdiff)
> 
> 
> 

You might be able to rework script 'version_dtb_increment_once' from my
previous attempt at this concept.  I do not know if the build system
has changed since 2015 in a way that would make the script incorrect
or if it is still valid.

https://lore.kernel.org/linux-arm-kernel/550A44A8.9090302@gmail.com/

-Frank

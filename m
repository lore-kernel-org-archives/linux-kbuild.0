Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yb1-f193.google.com ([209.85.219.193]:45114 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgAVTyu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jan 2020 14:54:50 -0500
Subject: Re: [RFC PATCH 3/3] scripts: Use -B dtc option to generate dtb build
 information.
From: Frank Rowand <frowand.list@gmail.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-4-alexandre.torgue@st.com>
 <bc5a94e3-389e-7ef4-5d14-1f7ab30a0826@gmail.com>
Message-ID: <0b2fbafb-0de0-ae1c-08c7-95e52f46ca43@gmail.com>
Date: Wed, 22 Jan 2020 13:54:48 -0600
MIME-Version: 1.0
In-Reply-To: <bc5a94e3-389e-7ef4-5d14-1f7ab30a0826@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

On 1/17/20 1:20 PM, Frank Rowand wrote:
> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>> This commit adds a new script to create a string in tmp file with
>> some information (date, linux version, user). This file is then used by
>> dtc with -B option to append dts file with a new property.
>> During kernel boot it will then be possible to printout DTB build
>> information (date, linux version used, user).
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 3fa32f83b2d7..6a98eac1e56d 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -235,6 +235,7 @@ quiet_cmd_gzip = GZIP    $@
>>  # DTC
>>  # ---------------------------------------------------------------------------
>>  DTC ?= $(objtree)/scripts/dtc/dtc
>> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info
>>  
>>  # Disable noisy checks by default
>>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>> @@ -275,11 +276,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>  
>>  quiet_cmd_dtc = DTC     $@
>>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>> -	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>> -	$(DTC) -O $(2) -o $@ -b 0 \
>> +       $(DTB_GEN_INFO) $(@).info ;\
>> +       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>> +       $(DTC) -O $(2) -o $@ -b 0 -B $(@).info\
>>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>> -		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
>> -	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>> +               -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>> +       rm $(@).info ; \
>> +       cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>>  
>>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>>  	$(call if_changed_dep,dtc,dtb)
>> diff --git a/scripts/gen_dtb_build_info b/scripts/gen_dtb_build_info
>> new file mode 100755
>> index 000000000000..30cf7506b9d5
>> --- /dev/null
>> +++ b/scripts/gen_dtb_build_info
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +DTB_TARGET=$@
>> +COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>> +
>> +touch $DTB_TARGET
>> +
>> +{
>> +  echo From Linux $KERNELRELEASE by $COMPILE_BY the $(date).

A nit, the trailing period is not needed.  Not a big deal one way
or the other.


>> +} > $DTB_TARGET
>>
> 
> This specific set of information does not seem to me to be sufficient
> to be of much use.  In my previous attempt to capture build time
> information into the DTB I included more information that this,
> which I felt provided more of the information that would be valuable
> to a developer (or testing person) in a development environment,
> test environment, or on an end user system.  The exact set of
> information is easy to bike shed over, but one could explain what
> information might be useful and why (I did not provide that explanation
> in my patch series, but in retrospect should have).

On reflection, this information is sufficient.  My concern was that a
unique version number was not provided.  But the unique version number
_is_ provided by the date, which is hh:mm:ss, so sufficient if the
dtb is not compiled more often than once per second.  So good enough
for the debugging environment.

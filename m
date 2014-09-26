Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:37937 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755913AbaIZPHq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Sep 2014 11:07:46 -0400
Received: by mail-ig0-f171.google.com with SMTP id h3so134463igd.16
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Sep 2014 08:07:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54256BEA.8020004@elproma.com.pl>
References: <542064F1.4000601@elproma.com.pl> <20140926120917.B60B4C40FEB@trevor.secretlab.ca>
 <54256BEA.8020004@elproma.com.pl>
From: Grant Likely <grant.likely@linaro.org>
Date: Fri, 26 Sep 2014 16:07:24 +0100
Message-ID: <CACxGe6th9NxNc8u-SsiGOASre-=1TK8V9gk7U1YPhRhpHBYt7Q@mail.gmail.com>
Subject: Re: Adding selftest testdata dynamically into live tree
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?ISO-8859-2?Q?Janusz_U=BFycki?= <j.uzycki@elproma.com.pl>
Cc: Gaurav Minocha <gaurav.minocha.os@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, Sep 26, 2014 at 2:36 PM, Janusz Użycki <j.uzycki@elproma.com.pl> wrote:
> The patch didn't help. Exactly the same.

Odd it worked here. It's moot anyway though because it breaks checking
dependencies on .dts files. I need someone stronger on kbuild-foo to
figure this out out. I've cc'd Michal and the kbuild mailing list.
Hopefully someone there can help figure this out.

g.

>
> best regards
> Janusz
>
> W dniu 2014-09-26 14:09, Grant Likely pisze:
>
>> On Mon, 22 Sep 2014 20:05:37 +0200, Janusz Użycki
>> <j.uzycki@elproma.com.pl> wrote:
>>>
>>> Hi.
>>>
>>> On 3.17.0-rc6-next-20140922+ with CONFIG_OF_SELFTEST enabled
>>> zImage is recreated every time I call "make" despite I've not done
>>> any change in source files and zImage was the same.
>>> This is caused by the rm line:
>>>     CALL    scripts/checksyscalls.sh
>>>     CHK     include/generated/compile.h
>>>     DTC     drivers/of/testcase-data/testcases.dtb
>>>     DTB     drivers/of/testcase-data/testcases.dtb.S
>>>     AS      drivers/of/testcase-data/testcases.dtb.o
>>>     LD      drivers/of/of_selftest.o
>>>     LD      drivers/of/built-in.o
>>> rm drivers/of/testcase-data/testcases.dtb.S
>>> drivers/of/testcase-data/testcases.dtb
>>>     LD      drivers/built-in.o
>>>     LINK    vmlinux
>>>     LD      vmlinux.o
>>
>> Try this change:
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 260bf8acfce9..4555e2e1b4ed 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -269,7 +269,7 @@ cmd_dtc = $(CPP) $(dtc_cpp_flags) -x
>> assembler-with-cpp -o $(dtc-tmp) $< ; \
>>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>>   -$(obj)/%.dtb: $(src)/%.dts FORCE
>> +$(obj)/%.dtb: $(src)/%.dts
>>         $(call if_changed_dep,dtc)
>>     dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
>>
>

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:62427 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752432AbaFTTfJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Jun 2014 15:35:09 -0400
Received: by mail-wi0-f178.google.com with SMTP id n15so1342013wiw.11
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Jun 2014 12:35:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140620184407.GA21269@ravnborg.org>
References: <1403289089-11299-1-git-send-email-markus.mayer@linaro.org>
	<1403289089-11299-2-git-send-email-markus.mayer@linaro.org>
	<20140620184407.GA21269@ravnborg.org>
Date: Fri, 20 Jun 2014 12:35:07 -0700
Message-ID: <CAPdLdq=ZjoO=Ja=0USF1g_RZKpgebCqttQXat7cmW8KXpsFF7g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] Makefile: Make HOSTCFLAGS and HOSTCXXFLAGS user modifyable
From: Markus Mayer <markus.mayer@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, Linux Build List <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 20 June 2014 11:44, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, Jun 20, 2014 at 11:31:28AM -0700, Markus Mayer wrote:
>> In order to allow the user to pass extra arguments to the host
>> compiler, we no longer overwrite the host compiler flags in the
>> makefile, but append them to what was passed in.
>>
>> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
>> ---
>>  Makefile | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 97b2861..5795eea 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -251,8 +251,8 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>>
>>  HOSTCC       = gcc
>>  HOSTCXX      = g++
>> -HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
>> -HOSTCXXFLAGS = -O2
>> +HOSTCFLAGS   += -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
>> +HOSTCXXFLAGS += -O2
>>
>>  ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
>>  HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
>
> With this patch you can only override HOSTCFLAGS.
> In many cases appending to the falgs is actually what you want.
>
> Please take a look at how we have implemented it for the kernel with KCFLAGS.
> And notice that this is also described in Documentation/kbuild

Thanks. I am able to do what I need using HOST_EXTRACFLAGS and HOST_LOADLIBES.

-Markus

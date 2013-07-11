Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:40384 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572Ab3GKWQt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jul 2013 18:16:49 -0400
Received: by mail-wi0-f172.google.com with SMTP id c10so31094wiw.5
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jul 2013 15:16:48 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <CA+icZUXwOSkE=mOyOuQWjnpFdka5LB4=PF-cXDAJJPUr26E0OQ@mail.gmail.com>
References: <CA+icZUX=sOdR5J3rM0YLw350jWJxS7+R_Bb0WkHb7Q4Ekbc6Zg@mail.gmail.com>
	<20130711210355.GC29911@merkur.ravnborg.org>
	<CA+icZUWQpoOH03MRT_r5T5vZKwU9p52tCU6MqyCfVi-k7ZGbNA@mail.gmail.com>
	<20130711210827.GA29928@merkur.ravnborg.org>
	<CA+icZUXwOSkE=mOyOuQWjnpFdka5LB4=PF-cXDAJJPUr26E0OQ@mail.gmail.com>
Date: Fri, 12 Jul 2013 00:16:48 +0200
Message-ID: <CA+icZUVQ=WAO2X_7Wn2pnFfm1AnYPHHmXm=Q1NSG_u8O9YrtxA@mail.gmail.com>
Subject: Re: $(call cc-option) in combination with KBUILD_*FLAGS
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Thu, Jul 11, 2013 at 11:12 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Thu, Jul 11, 2013 at 11:08 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
>> On Thu, Jul 11, 2013 at 11:05:24PM +0200, Sedat Dilek wrote:
>>> On Thu, Jul 11, 2013 at 11:03 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
>>> > On Fri, Jul 05, 2013 at 05:36:21PM +0200, Sedat Dilek wrote:
>>> >> Hi,
>>> >>
>>> >> in which case(s) do you have to set a comma or not?
>>> >
>>> > Only when you specify the last option.
>>>
>>> You have an example for this?
>>
>> Example:
>> arch/m68k/Makefile:cpuflags-$(CONFIG_M5441x)    := $(call cc-option,-mcpu=54455,-mcfv4e)
>>
>
> OK, so if I have multiple cc-options separated vi comma. So a single
> one it is not mandatory.
>

So, this can be simplified:

[ arch/x86/realmode/rm/Makefile ]

OLD:
                   $(call cc-option, -fno-toplevel-reorder,\
                        $(call cc-option, -fno-unit-at-a-time)) \

NEW:
                   $(call cc-option, -fno-toplevel-reorder, -fno-unit-at-a-time)

No?

- Sedat -

> Thanks!
>
> - Sedat -
>
>>
>>         Sam

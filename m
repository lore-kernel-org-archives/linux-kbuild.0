Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:63927 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755871AbdKJEzp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 23:55:45 -0500
MIME-Version: 1.0
In-Reply-To: <CAD=FV=V0E5sjgYz3d9kyJnefoqnj9zVv09JCdLdKdkcC77akFQ@mail.gmail.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-3-git-send-email-yamada.masahiro@socionext.com> <CAD=FV=V0E5sjgYz3d9kyJnefoqnj9zVv09JCdLdKdkcC77akFQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 Nov 2017 13:55:01 +0900
Message-ID: <CAK7LNAThMxdbUdAYkXEcmXdA_fswyx9Ew8C7vxt--YyFyh8tcg@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: remove redundant $(wildcard ...) for
 cmd_files calculation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>

2017-11-10 13:53 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Hi,
>
> On Thu, Nov 9, 2017 at 7:41 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> I do not why $(wildcard ...) needs to be called twice for computing
>> cmd_files.  Remove the first one.
>
> I tried and I can't find any reason for the two calls $(wildcard ...)
> either, so this seems fine to me.
>
>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  Makefile                     | 3 +--
>>  scripts/Makefile.build       | 3 +--
>>  scripts/Makefile.headersinst | 3 +--
>>  scripts/Makefile.modpost     | 3 +--
>>  4 files changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index a7476e6..58dd245 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1693,8 +1693,7 @@ cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
>>
>>  # read all saved command lines
>>
>> -targets := $(wildcard $(sort $(targets)))
>> -cmd_files := $(wildcard .*.cmd $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
>> +cmd_files := $(wildcard .*.cmd $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
>>
>>  ifneq ($(cmd_files),)
>>    $(cmd_files): ;      # Do not try to update included dependency files
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index 061d0c3..62d5314 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -583,8 +583,7 @@ FORCE:
>>  # optimization, we don't need to read them if the target does not
>>  # exist, we will rebuild anyway in that case.
>>
>> -targets := $(wildcard $(sort $(targets)))
>> -cmd_files := $(wildcard $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
>> +cmd_files := $(wildcard $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
>>
>>  ifneq ($(cmd_files),)
>>    include $(cmd_files)
>> diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
>> index 5692d7a..2aa9181 100644
>> --- a/scripts/Makefile.headersinst
>> +++ b/scripts/Makefile.headersinst
>> @@ -114,9 +114,8 @@ $(check-file): scripts/headers_check.pl $(output-files) FORCE
>>
>>  endif
>>
>> -targets := $(wildcard $(sort $(targets)))
>>  cmd_files := $(wildcard \
>> -             $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
>> +             $(foreach f,$(sort $$(targets)),$(dir $(f)).$(notdir $(f)).cmd))
>
> Did you mean the "$$" here before (targets)?  At first glance it seems wrong...


Good catch!
I will fix this.

Thanks!


-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34534 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309AbbDTTAh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 15:00:37 -0400
MIME-Version: 1.0
In-Reply-To: <20150418150541.GA15063@krava.brq.redhat.com>
References: <1429368380-6681-1-git-send-email-bobbypowers@gmail.com>
	<20150418150541.GA15063@krava.brq.redhat.com>
Date: Mon, 20 Apr 2015 15:00:36 -0400
Message-ID: <CAArOQ2WaMCJ_EZSBPyFQNoZC=p+woNTOw5r2vSx7rqb-rYnB-w@mail.gmail.com>
Subject: Re: [PATCH] tools/lib/api: undefine _FORTIFY_SOURCE before setting it
From: Bobby Powers <bobbypowers@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>, linux-kbuild@vger.kernel.org
Cc: Kernel development list <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>

+CC linux-kbuild.  Related to this Dirk's work [1].

On Sat, Apr 18, 2015 at 11:05 AM, Jiri Olsa <jolsa@redhat.com> wrote:
> On Sat, Apr 18, 2015 at 10:46:20AM -0400, Bobby Powers wrote:
>> Some toolchains (like Hardened Gentoo) define _FORTIFY_SOURCE in the
>> built-in, default args.  This causes perf builds to fail with:
>>
>> <command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
>> <built-in>: note: this is the location of the previous definition
>> cc1: all warnings being treated as errors
>>
>> To avoid this, undefine _FORTIFY_SOURCE before (possibly
>> re-)defining it in tools/lib/api.
>>
>> Signed-off-by: Bobby Powers <bobbypowers@gmail.com>
>
> Acked-by: Jiri Olsa <jolsa@kernel.org>
>
> thanks,
> jirka


yours,
Bobby

1 - https://lkml.org/lkml/2015/4/20/269

>
>> ---
>>  tools/lib/api/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
>> index 36c08b1..87c72d1 100644
>> --- a/tools/lib/api/Makefile
>> +++ b/tools/lib/api/Makefile
>> @@ -21,7 +21,7 @@ LIB_OBJS += $(OUTPUT)fd/array.o
>>
>>  LIBFILE = libapikfs.a
>>
>> -CFLAGS = -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -D_FORTIFY_SOURCE=2 $(EXTRA_WARNINGS) $(EXTRA_CFLAGS) -fPIC
>> +CFLAGS = -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $(EXTRA_WARNINGS) $(EXTRA_CFLAGS) -fPIC
>>  EXTLIBS = -lelf -lpthread -lrt -lm
>>  ALL_CFLAGS = $(CFLAGS) $(BASIC_CFLAGS) -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>>  ALL_LDFLAGS = $(LDFLAGS)
>> --
>> 2.3.5
>>

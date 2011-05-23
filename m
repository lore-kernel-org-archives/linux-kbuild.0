Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:58051 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752845Ab1EWCRu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 May 2011 22:17:50 -0400
Received: by iyb14 with SMTP id 14so4276383iyb.19
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2011 19:17:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110505142305.GG13293@sepie.suse.cz>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
	<1304561004-2684-3-git-send-email-lacombar@gmail.com>
	<20110505142305.GG13293@sepie.suse.cz>
Date: Sun, 22 May 2011 22:17:49 -0400
Message-ID: <BANLkTi=t-7WpwVqr9CLB0hmFDXtR2mey_w@mail.gmail.com>
Subject: Re: [RFC 2/9] genksyms: finalize rename
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Thu, May 5, 2011 at 10:23 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Wed, May 04, 2011 at 10:03:17PM -0400, Arnaud Lacombe wrote:
>> ---
>>  scripts/genksyms/.gitignore |    6 ++--
>>  scripts/genksyms/Makefile   |   45 +++++++++++++-----------------------------
>>  scripts/genksyms/genksyms.c |   11 ++++-----
>>  scripts/genksyms/genksyms.l |    7 ++---
>>  scripts/genksyms/genksyms.y |    2 +
>>  5 files changed, 27 insertions(+), 44 deletions(-)
>>
>> diff --git a/scripts/genksyms/.gitignore b/scripts/genksyms/.gitignore
>> index be5cadb..0983577 100644
>> --- a/scripts/genksyms/.gitignore
>> +++ b/scripts/genksyms/.gitignore
>> @@ -1,4 +1,4 @@
>> -keywords.c
>> -lex.c
>> -parse.[ch]
>>  genksyms
>> +genksyms.tab.c
>> +lex.genksyms.c
>> +genksyms.hash.c
>> diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
>> index e420fe4..82bb25f 100644
>> --- a/scripts/genksyms/Makefile
>> +++ b/scripts/genksyms/Makefile
>> @@ -2,52 +2,35 @@
>>  hostprogs-y  := genksyms
>>  always               := $(hostprogs-y)
>>
>> -genksyms-objs        := genksyms.o parse.o lex.o
>> +genksyms-objs        := genksyms.o genksyms.tab.o
>>
>>  # -I needed for generated C source (shipped source)
>>  HOSTCFLAGS_parse.o := -Wno-uninitialized -I$(src)
>>
>> -# dependencies on generated files need to be listed explicitly
>> -$(obj)/lex.o: $(obj)/parse.h $(obj)/keywords.c
>> -
>>  # -I needed for generated C source (shipped source)
>>  HOSTCFLAGS_lex.o := -I$(src)
>>
>> -ifdef GENERATE_PARSER
>> -
>> -# gperf
>> +clean-files  := genksyms.tab.c lex.genksyms.c genksyms.hash.c
>
> Given that you are overwriting most of this by "kbuild: merge parser
> generation rules", I suggest you only do the necessary minimum at this
> point, i.e. only reflect the file renames and #include the lexer into
> the parser.
>
That would break bisect-ability, which I would like to keep.

 - Arnaud

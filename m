Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:62241 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750936AbeEBQfC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 May 2018 12:35:02 -0400
Subject: Re: [PATCH] modpost: srcversion sometimes incorrect
References: <1522430045-31685-1-git-send-email-juro.bystricky@intel.com>
 <CAK7LNAR3D4=7Z+T1odxG2FidWF0KM79MLiLNZNy8KqhcwLagDA@mail.gmail.com>
From: Juro Bystricky <juro.bystricky@linux.intel.com>
Message-ID: <8a87f4f7-6e1e-595f-d65e-9e3226d81362@linux.intel.com>
Date: Wed, 2 May 2018 09:34:39 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR3D4=7Z+T1odxG2FidWF0KM79MLiLNZNy8KqhcwLagDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Juro Bystricky <juro.bystricky@intel.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, jurobystricky@hotmail.com

On 2018-05-02 08:48 AM, Masahiro Yamada wrote:
> 2018-03-31 2:14 GMT+09:00 Juro Bystricky <juro.bystricky@intel.com>:
>> "srcversion" field inserted into module modinfo section contains a
>> sum of the source files which made it. However, this field can
>> be incorrect. Building the same module can end up having inconsistent
>> srcversion field eventhough the sources remain the same.
>> This can be reproduced by building modules in a deeply nested directory,
>> but other factors contribute as well.
>>
>> The reason for incorrect srcversion is that some source files can be
>> simply silently skipped from the checksum calculation due to limited
>> buffer space for line parsing.
>>
>> This patch addresses two issues:
>>
>> 1. Allocates a larger line buffer (32k vs 4k).
>> 2. Issues a warning if a line length exceeds the line buffer.
>>
>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> ---
>>   scripts/mod/modpost.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> index 9917f92..955f26e 100644
>> --- a/scripts/mod/modpost.c
>> +++ b/scripts/mod/modpost.c
>> @@ -385,9 +385,10 @@ void *grab_file(const char *filename, unsigned long *size)
>>     * spaces in the beginning of the line is trimmed away.
>>     * Return a pointer to a static buffer.
>>     **/
>> +#define MODPOST_MAX_LINE 32768
>>   char *get_next_line(unsigned long *pos, void *file, unsigned long size)
>>   {
>> -       static char line[4096];
>> +       static char line[MODPOST_MAX_LINE];
>>          int skip = 1;
>>          size_t len = 0;
>>          signed char *p = (signed char *)file + *pos;
>> @@ -402,8 +403,11 @@ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
>>                  if (*p != '\n' && (*pos < size)) {
>>                          len++;
>>                          *s++ = *p++;
>> -                       if (len > 4095)
>> +                       if (len > (sizeof(line)-1)) {
>> +                               warn(" %s: line exceeds buffer size %zu bytes\n"
>> +                                    , __func__, sizeof(line));
>>                                  break; /* Too long, stop */
>> +                       }
>>                  } else {
>>                          /* End of string */
>>                          *s = '\0';
>> --
>> 2.7.4
> The whole of the file content is mapped by grab_file().
>
> I believe the right thing to do is,
> to not increase the buffer size,
> but to not use such a temporary buffer.
>
>
>
>
Yes, it is the right thing,  but I think quite a bit more invasive. It 
would require rewriting the parsing code.


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35686 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbeAHKRW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jan 2018 05:17:22 -0500
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 8 Jan 2018 11:17:10 +0100 (CET)
Subject: Re: [PATCH v2] fixdep: exit with error code in error branches of
 do_config_file()
In-Reply-To: <CAK7LNAROjcbES8-debAnzVz1EV1Ar+RLW8phF5+bQxpHQUODKQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1801081109210.3323@hsp>
References: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com> <1513883429-9527-1-git-send-email-lukas.bulwahn@gmail.com> <CAK7LNAROjcbES8-debAnzVz1EV1Ar+RLW8phF5+bQxpHQUODKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicholas Mc Guire <der.herr@hofr.at>, sil2review@lists.osadl.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


On Sun, 31 Dec 2017, Masahiro Yamada wrote:

> 2017-12-22 4:10 GMT+09:00 Lukas Bulwahn <lukas.bulwahn@gmail.com>:
>> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
>> index bbf62cb..4274610 100644
>> --- a/scripts/basic/fixdep.c
>> +++ b/scripts/basic/fixdep.c
>> @@ -284,19 +284,18 @@ static void do_config_file(const char *filename)
>>                 exit(2);
>>         }
>>         if (st.st_size == 0) {
>> -               close(fd);
>> -               return;
>> +               fprintf(stderr, "fixdep: error empty file config file: ");
>> +               perror(filename);
>> +               exit(2);
>>         }
>
> No.  This is correct as-is.
>
> do_config_file() does not parse .cmd files
> but parse source files (.c .h .S etc.)
>
> Having an empty source file is rare, but possible.
>
>

Now that I looked at the code for creating the v3 patch, I am confused 
about the error messages in scripts/basic/fixdep.c, lines 275 - 285, in 
do_config_file():

         fd = open(filename, O_RDONLY);
         if (fd < 0) {
                 fprintf(stderr, "fixdep: error opening config file: ");
                 perror(filename);
                 exit(2);
         }
         if (fstat(fd, &st) < 0) {
                 fprintf(stderr, "fixdep: error fstat'ing config file: ");
                 perror(filename);
                 exit(2);
         }

These error messages suggest that filename (and the file handler fd) 
refers to a config file, but you say that filename and fd refer to source 
files.

Looking at parse_dep_file() and how it invokes do_config_file(), I think 
you are right that it does refer to source files.

If you confirm that this is correct, I would change `config file` to 
`source file` in the error messages of do_config_file().

What is best to do here, provide a separate patch or add it to the 
existing patch?

Lukas

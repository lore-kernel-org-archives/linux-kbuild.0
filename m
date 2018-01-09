Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61210 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751896AbeAIIkc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jan 2018 03:40:32 -0500
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1801081109210.3323@hsp>
References: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com>
 <1513883429-9527-1-git-send-email-lukas.bulwahn@gmail.com>
 <CAK7LNAROjcbES8-debAnzVz1EV1Ar+RLW8phF5+bQxpHQUODKQ@mail.gmail.com> <alpine.DEB.2.20.1801081109210.3323@hsp>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Jan 2018 17:39:38 +0900
Message-ID: <CAK7LNAR8TtkyeqMgQMKnHZNey0xmFu4P_Pj7-m=tVae8kNh=0g@mail.gmail.com>
Subject: Re: [PATCH v2] fixdep: exit with error code in error branches of do_config_file()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicholas Mc Guire <der.herr@hofr.at>, sil2review@lists.osadl.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-08 19:17 GMT+09:00 Lukas Bulwahn <lukas.bulwahn@gmail.com>:
>
> On Sun, 31 Dec 2017, Masahiro Yamada wrote:
>
>> 2017-12-22 4:10 GMT+09:00 Lukas Bulwahn <lukas.bulwahn@gmail.com>:
>>>
>>> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
>>> index bbf62cb..4274610 100644
>>> --- a/scripts/basic/fixdep.c
>>> +++ b/scripts/basic/fixdep.c
>>> @@ -284,19 +284,18 @@ static void do_config_file(const char *filename)
>>>                 exit(2);
>>>         }
>>>         if (st.st_size == 0) {
>>> -               close(fd);
>>> -               return;
>>> +               fprintf(stderr, "fixdep: error empty file config file:
>>> ");
>>> +               perror(filename);
>>> +               exit(2);
>>>         }
>>
>>
>> No.  This is correct as-is.
>>
>> do_config_file() does not parse .cmd files
>> but parse source files (.c .h .S etc.)
>>
>> Having an empty source file is rare, but possible.
>>
>>
>
> Now that I looked at the code for creating the v3 patch, I am confused about
> the error messages in scripts/basic/fixdep.c, lines 275 - 285, in
> do_config_file():


Not only the error messages.

Function names are confusing too.

parse_config_file(), do_config_file
  these are not for parsing configuration file,
  but for parsing files that contain CONFIG options



>
>         fd = open(filename, O_RDONLY);
>         if (fd < 0) {
>                 fprintf(stderr, "fixdep: error opening config file: ");
>                 perror(filename);
>                 exit(2);
>         }
>         if (fstat(fd, &st) < 0) {
>                 fprintf(stderr, "fixdep: error fstat'ing config file: ");
>                 perror(filename);
>                 exit(2);
>         }
>
> These error messages suggest that filename (and the file handler fd) refers
> to a config file, but you say that filename and fd refer to source files.
>
> Looking at parse_dep_file() and how it invokes do_config_file(), I think you
> are right that it does refer to source files.

This depends on the definition of "source file".

In general, we think "source files" refer to files processed by compiler,
like *c, *.h, *.S, *.dts, etc.

In the fixdep context, "source file" has narrower meaning.

You will notice this from the comments in parse_dep_file(),
"Do not list the source file as dependency, ..."


> If you confirm that this is correct, I would change `config file` to `source
> file` in the error messages of do_config_file().

Maybe a bad idea.
For the reason above, "source file" is also confusing in my opinion.

Just "file" should be fine.  But I do not need a patch just for
removing "config".


I'd like to refactor the code in a bigger picture.
do_config_file() and print_deps() can be merged together,
since they do similar things.
After merged, load_file() will refer "file".

https://patchwork.kernel.org/patch/10151165/
https://patchwork.kernel.org/patch/10151157/

I had already had those cleanups in my mind
but I was holding it back to avoid conflicts with your patch.



> What is best to do here, provide a separate patch or add it to the existing
> patch?
>
> Lukas



-- 
Best Regards
Masahiro Yamada

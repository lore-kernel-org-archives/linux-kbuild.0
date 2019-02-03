Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:59924 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727362AbfBCIvB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Feb 2019 03:51:01 -0500
Subject: Re: [PATCH] kbuild: gitignore output directory
References: <20190130111447.26032-1-vladimir.kondratiev@linux.intel.com>
 <CAK7LNAS8g3g3OTtqTN8begMxzbSS82Wn0CqY8u6vuELEZaLo3g@mail.gmail.com>
From: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
Message-ID: <10f0f786-6d91-7eba-c057-96c6c00544e8@linux.intel.com>
Date: Sun, 3 Feb 2019 10:50:58 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS8g3g3OTtqTN8begMxzbSS82Wn0CqY8u6vuELEZaLo3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Agree; sending v2

On 2/1/19 6:18 AM, Masahiro Yamada wrote:
> On Wed, Jan 30, 2019 at 8:15 PM Vladimir Kondratiev
> <vladimir.kondratiev@linux.intel.com> wrote:
>>
>> When compiling into output directory using O=, many files
>> created under KBUILD_OUTPUT that git considers
>> as new ones; git clients, ex. "git gui" lists it, and it clutters
>> file list making it difficult to see what was really changed
>>
>> Generate .gitignore in output directory that ignores all
>> its content
>>
>> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
>> ---
>>   Makefile | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 141653226f3c..ee66ea28869b 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -483,10 +483,13 @@ PHONY += outputmakefile
>>   # outputmakefile generates a Makefile in the output directory, if using a
>>   # separate output directory. This allows convenient use of make in the
>>   # output directory.
>> +# At the same time when output Makefile generated, generate .gitignore to
>> +# ignore whole output directory
>>   outputmakefile:
>>   ifneq ($(KBUILD_SRC),)
>>          $(Q)ln -fsn $(srctree) source
>>          $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
>> +       echo "# this is build directory, ignore it\n*" > .gitignore
>>   endif
>>
>>   ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>> --
>> 2.19.1
>>
> 
> 
> The idea looks OK to me.
> The implementation must be improved.
> 
> 
> You need to add $(Q) to suppress the annoying command echo.
> 
> Also, this patch does not work for all distributions because
> echo "\n"
> is not portable.
> 
> 
> 
> GNU Make runs recipes in /bin/sh (unless SHELL variable is changed),
> but the implementation of /bin/sh depends on distributions.
> 
> 
> This patch works on Ubuntu etc.
> because /bin/sh is a symbolic link to dash.
> 
> 
> But, in some distributions,
> /bin/sh is a symbolic link to bash.
> 
> 
> 
> Docker is useful for quick tests of
> various distributions. :)
> 
> See the result of  echo "hello\nworld"
> 
> 
> [Ubuntu]
> 
> foo@8ad1275125c5:~$ cat /etc/lsb-release
> DISTRIB_ID=Ubuntu
> DISTRIB_RELEASE=18.10
> DISTRIB_CODENAME=cosmic
> DISTRIB_DESCRIPTION="Ubuntu 18.10"
> foo@8ad1275125c5:~$ ls -l /bin/sh
> lrwxrwxrwx 1 root root 4 Nov 14 23:00 /bin/sh -> dash
> foo@8ad1275125c5:~$ /bin/sh
> $ type echo
> echo is a shell builtin
> $ echo "hello\nworld"
> hello
> world
> 
> 
> 
> 
> [CentOS]
> 
> 
> [foo@c3fbaa4b6f72 ~]$ cat /etc/redhat-release
> CentOS Linux release 7.6.1810 (Core)
> [foo@c3fbaa4b6f72 ~]$ ls -l /bin/sh
> lrwxrwxrwx 1 root root 4 Dec  5 01:36 /bin/sh -> bash
> [foo@c3fbaa4b6f72 ~]$ /bin/sh
> sh-4.2$ type echo
> echo is a shell builtin
> sh-4.2$ echo "hello\nworld"
> hello\nworld
> 
> 
> 
> 
> 
> On example for workaround might be:
> 
> diff --git a/Makefile b/Makefile
> index ee66ea2..010c1c6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -489,7 +489,7 @@ outputmakefile:
>   ifneq ($(KBUILD_SRC),)
>          $(Q)ln -fsn $(srctree) source
>          $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
> -       echo "# this is build directory, ignore it\n*" > .gitignore
> +       $(Q){ echo "# this is build directory, ignore it"; echo "*"; }
>> .gitignore
>   endif
> 
>   ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> 
> 
> 
> 
> 
> 

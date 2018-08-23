Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18257 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730679AbeHWMHr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 08:07:47 -0400
MIME-Version: 1.0
In-Reply-To: <d5093e14-c826-9183-cd94-ecb99a799fc8@infradead.org>
References: <490A46D5-834E-46A9-9106-A31F94344F99@goldelico.com> <d5093e14-c826-9183-cd94-ecb99a799fc8@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Aug 2018 17:38:27 +0900
Message-ID: <CAK7LNAQDRj7aKMNqkTL3XxbsFHUuYwOaPn8buh=b9O9+CaKjig@mail.gmail.com>
Subject: Re: please revert commit ce8556cca6 "kbuild: verify that $DEPMOD is
 installed" introduced in v4.18.4.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>, stable <stable@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Randy,


2018-08-23 8:33 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 08/22/2018 11:53 AM, H. Nikolaus Schaller wrote:
>> This patch requires that /sbin/depmod is installed and installable on
>> the build host.
>>
>> But not all build hosts for cross compiling Linux are Linux systems
>> and are able to provide a working port of depmod, especially at the
>> file patch /sbin/depmod.
>>
>> I use, for example, a Darwin system to cross compile Linux and I run
>> depmod -a on the embedded system once, after installing a new Linux
>> kernel there.
>>
>> I have no problem with seeing a warning, but aborting the build process
>> is IMHO a bad idea since the previous behaviour didn't harm many people
>> as far as I see. Probably 99% of people compiling Linux kernels do that
>> on Linux and 99% of those have depmod installed for optimal operation of
>> their build host. So IMHO printing the warning is good enough.
>
> Thanks for the report and sorry about the problem.
>
> I'm OK with changing the error to a warning.
> Does the patch below work for you?
>
> thanks.
> ---
> From: Randy Dunlap <rdunlap@infradead.org>
>
> When $DEPMOD is not found, only print a warning instead of exiting
> with an error message and error status.
>
> E.g.:
> Warning: 'make modules_install' requires /sbin/depmod. Please install it.
> This is probably in the kmod package.
> ../scripts/depmod.sh: line 44: /sbin/depmod: No such file or directory
> make[1]: *** [/home/rdunlap/lnx/lnx-418/Makefile:1244: _modinst_post] Error 127
> make: *** [Makefile:146: sub-make] Error 2
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  scripts/depmod.sh |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> --- lnx-418.orig/scripts/depmod.sh
> +++ lnx-418/scripts/depmod.sh
> @@ -15,9 +15,8 @@ if ! test -r System.map ; then
>  fi
>
>  if [ -z $(command -v $DEPMOD) ]; then
> -       echo "'make modules_install' requires $DEPMOD. Please install it." >&2
> +       echo "Warning: 'make modules_install' requires $DEPMOD. Please install it." >&2
>         echo "This is probably in the kmod package." >&2
> -       exit 1


'exit 0' is missing here.

This shell script would fail, then abort the build process.


> ../scripts/depmod.sh: line 44: /sbin/depmod: No such file or directory
> make[1]: *** [/home/rdunlap/lnx/lnx-418/Makefile:1244: _modinst_post] Error 127
> make: *** [Makefile:146: sub-make] Error 2






-- 
Best Regards
Masahiro Yamada

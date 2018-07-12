Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:42235 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbeGLIjO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 04:39:14 -0400
MIME-Version: 1.0
In-Reply-To: <gh36wr1g0d.fsf@lena.gouders.net>
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com> <gh36wr1g0d.fsf@lena.gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Jul 2018 17:29:49 +0900
Message-ID: <CAK7LNAQeffSH2_-d9byxSetUNV1qE4h-TJusEeF_PFVt0KRH8w@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] kbuild/kconfig: do not update config during installation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-10 20:34 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
>> The main motivation of this patch series is to suppress the syncconfig
>> during running installation targets.
>>
>> V1 consisted of only two patches:
>>   https://patchwork.kernel.org/patch/10468105/
>>   https://patchwork.kernel.org/patch/10468103/
>>
>> I noticed that installation targets would continue running
>> even if the source tree is not configured at all
>> because the inclusion of include/config/auto.conf was optional.
>>
>> So, I added one more patch in V2:
>>  https://patchwork.kernel.org/patch/10483637/
>>
>> However, kbuild test robot reported a new warning message was displayed:
>>
>> Makefile:592: include/config/auto.conf: No such file or directory
>>
>> This warning is displayed only for Make 4.1 or older.
>>
>> To fix this annoying warning, I changed Kconfig too,
>> which leaded to more clean-up, improvements in Kconfig.
>>
>> So, V3 is a big patch series.
>
> Hello Masahiro,
>
> I tested your series for a while, now.  I did not notice real issues
> with it but want to leave some remarks about what I noticed in
> the surroundings of your patches.
>
>
>> Masahiro Yamada (12):
>>   kconfig: rename file_write_dep and move it to confdata.c
>
> I might be missing some trivial use-case, but when looking at this
> patch, I noticed an inconsistency with the file names auto.conf and
> auto.conf.cmd.
>
> The first can be modified by an environment variable but when this
> happens, auto.conf.cmd remains as is.  I noticed that only the
> Documentation mentions that KCONFIG_AUTOCONFIG exists and confdata.c
> uses it to serve the file name -- no other use anywhere.

Indeed.

I had also noticed this.

Probably, replacing the hardcoded 'include/config/auto.conf.cmd'
with  get_env('KCONFIG_AUTOCONFIG') + 'cmd' will be nice.


I did not touch it since it thought it was less important
for this patch set.

If you are willing to contribute to this,
a patch is welcome (after this series).



> Now, I am wondering if I just don't see an important case when the
> use of KCONFIG_AUTOCONFIG is really helpful or even mandatory.


I do not know the historical background,
but I guess predecessors wanted to implement Kconfig
as generic/flexible as possible.


>
>>   kconfig: split out helpers to check file/directory, create directory
>>   kconfig: remove unneeded directory generation from local*config
>>   kconfig: create directories needed for syncconfig by itself
>>   kconfig: make syncconfig update .config regardless of sym_change_count
>
> For this patch, I already mentioned that `conf --help' perhaps could be
> updated.

What do you want 'conf --help' to look like ?



>  On the other side, none of the entries there tells us such
> details, so there is probably no need for syncconfig to do so.
>
>>   kconfig: allow all config targets to write auto.conf if missing
>>   kbuild: use 'include' directive to load auto.conf from top Makefile
>>   kbuild: add .DELETE_ON_ERROR special target
>>   kbuild: do not update config when running install targets
>>   kbuild: do not update config for 'make kernelrelease'
>>   kbuild: remove auto.conf and tristate.conf from prerequisites
>
> In the surrounding of this patch I noticed -include of auto.conf and
> tristate.conf in scripts/Makfile.modbuildin.  I tried it in some ways
> but was not able to trigger that file being used with a missing
> auto.conf.

Right.  auto.conf and tristate.conf are mandatory there.

'-include' should be replaced with 'include'.

Cater to send a patch?


> On the other hand, if I now manually remove tristate.conf,
> that would not be fixed or even noticed, because of -include and I
> wonder if it is safer to also change the -includes in that file.
>
> It seems, if one of those files is missing, one must have done it
> manually or some other serious issue is present that we probably want to
> notice.

You are right.  If somebody removes tristate.conf on purpose,
it is not self-healing.

I should be fixed by itself, or at least it should fail
with clear message.

I will reconsider this.


Thanks.



> Dirk
>
>>   kbuild: replace include/config/%.conf with include/config/auto.conf
>>
>>  Makefile                    |  46 +++++++++------
>>  scripts/Kbuild.include      |   3 +
>>  scripts/kconfig/Makefile    |  16 ++---
>>  scripts/kconfig/conf.c      |  39 +++++++------
>>  scripts/kconfig/confdata.c  | 139 +++++++++++++++++++++++++++++++++++++-------
>>  scripts/kconfig/gconf.c     |   1 +
>>  scripts/kconfig/lkc.h       |   1 -
>>  scripts/kconfig/lkc_proto.h |   2 +-
>>  scripts/kconfig/mconf.c     |   1 +
>>  scripts/kconfig/nconf.c     |   1 +
>>  scripts/kconfig/qconf.cc    |   2 +
>>  scripts/kconfig/util.c      |  30 ----------
>>  12 files changed, 182 insertions(+), 99 deletions(-)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada

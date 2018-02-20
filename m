Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45944 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752491AbeBTRFL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 12:05:11 -0500
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0DAu1q3jLMN=JjrNAd4a4UVFcEcLF2h1VgSvXjZsU++g@mail.gmail.com>
References: <20180216214117.1947175-1-arnd@arndb.de> <20180216214117.1947175-3-arnd@arndb.de>
 <CAK7LNARvbsMc3JpcxZjvmc3UjvACx3t66cLM_aSDcADiPA0V7g@mail.gmail.com> <CAK8P3a0DAu1q3jLMN=JjrNAd4a4UVFcEcLF2h1VgSvXjZsU++g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Feb 2018 02:04:26 +0900
Message-ID: <CAK7LNAR2GO21TMP=viR1sni_17zFZ+03TUh8pak1etVYEF8kTQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] Kconfig: improve handling for all{rand,yes,no,}.config
 fragments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-20 18:59 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Tue, Feb 20, 2018 at 10:26 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> 2018-02-17 6:41 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>
>>> @@ -621,14 +622,24 @@ int main(int ac, char **av)
>>>                 case randconfig:        name = "allrandom.config"; break;
>>>                 default: break;
>>>                 }
>>> -               if (conf_read_simple(name, S_DEF_USER) &&
>>> -                   conf_read_simple("all.config", S_DEF_USER)) {
>>> -                       fprintf(stderr,
>>> -                               _("*** KCONFIG_ALLCONFIG set, but no \"%s\" or \"all.config\" file found\n"),
>>> -                               name);
>>> -                       exit(1);
>>> +               /* try ./name, arch/$(ARCH)/configs/name and kernel/config/name */
>>> +               if (!conf_read_simple(name, S_DEF_USER))
>>> +                       break;
>>> +               arch = getenv("ARCH");
>>> +               if (arch) {
>>> +                       snprintf(fullname, sizeof(fullname), "arch/%s/configs/%s",
>>> +                                arch, name);
>>> +                       if (!conf_read_simple(fullname, S_DEF_USER))
>>> +                               break;
>>>                 }
>>
>>
>> I am not a big fan of hard-coding the kernel directory structure.
>>
>> We already do this [1], but I am thinking of kicking this out.
>> [1] https://github.com/torvalds/linux/blob/v4.16-rc1/scripts/kconfig/confdata.c#L33
>
> Ok, I see. How about adding a way to detect that we are build-testing
> with randconfig instead?


How about implementing something in scripts/kconfig/Makefile?

merge_config collects config fragments into 'configfiles'

I was thinking of a similar thing.


If KCONFIG_ALLCONFIG is 1,
scripts/kconfig/Makefile searches
'./', '$srctree/', 'arch/$(SRCARCH)/configs/', 'kernel/configs/'
and sets the found file in it,

If KCONFIG_ALLCONFIG already contains a file name, it is used as-is.

scripts/kconfig/conf.c will be simplified.



>> BTW, I am trying to compiler capability check to Kconfig.
>> If this work is done, I hope some "depends on !COMPILE_TEST" will go
>> away (but not all?)
>> https://patchwork.kernel.org/patch/10225375/
>
> I think most of the 'depends on !COMPILE_TEST' are for cases that
> impact compile-testing in some way (more false-positive warnings,
> fewer real warnings, much slower compile speed), rather than a lack
> of check for a specific compiler version.
>
> We might be able to replace the CONFIG_STANDALONE and
> CONFIG_PREVENT_FIRMWARE_BUILD with Kconfig $(shell)
> checks if you think that leads to an improvement.
>

OK, then your kernel/configs/allrandom.config approach will be useful.



-- 
Best Regards
Masahiro Yamada

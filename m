Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:44097 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751341AbeBTJ7u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 04:59:50 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNARvbsMc3JpcxZjvmc3UjvACx3t66cLM_aSDcADiPA0V7g@mail.gmail.com>
References: <20180216214117.1947175-1-arnd@arndb.de> <20180216214117.1947175-3-arnd@arndb.de>
 <CAK7LNARvbsMc3JpcxZjvmc3UjvACx3t66cLM_aSDcADiPA0V7g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Feb 2018 10:59:49 +0100
Message-ID: <CAK8P3a0DAu1q3jLMN=JjrNAd4a4UVFcEcLF2h1VgSvXjZsU++g@mail.gmail.com>
Subject: Re: [PATCH 2/3] Kconfig: improve handling for all{rand,yes,no,}.config
 fragments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 20, 2018 at 10:26 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-02-17 6:41 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:

>> @@ -621,14 +622,24 @@ int main(int ac, char **av)
>>                 case randconfig:        name = "allrandom.config"; break;
>>                 default: break;
>>                 }
>> -               if (conf_read_simple(name, S_DEF_USER) &&
>> -                   conf_read_simple("all.config", S_DEF_USER)) {
>> -                       fprintf(stderr,
>> -                               _("*** KCONFIG_ALLCONFIG set, but no \"%s\" or \"all.config\" file found\n"),
>> -                               name);
>> -                       exit(1);
>> +               /* try ./name, arch/$(ARCH)/configs/name and kernel/config/name */
>> +               if (!conf_read_simple(name, S_DEF_USER))
>> +                       break;
>> +               arch = getenv("ARCH");
>> +               if (arch) {
>> +                       snprintf(fullname, sizeof(fullname), "arch/%s/configs/%s",
>> +                                arch, name);
>> +                       if (!conf_read_simple(fullname, S_DEF_USER))
>> +                               break;
>>                 }
>
>
> I am not a big fan of hard-coding the kernel directory structure.
>
> We already do this [1], but I am thinking of kicking this out.
> [1] https://github.com/torvalds/linux/blob/v4.16-rc1/scripts/kconfig/confdata.c#L33

Ok, I see. How about adding a way to detect that we are build-testing
with randconfig instead?

> BTW, I am trying to compiler capability check to Kconfig.
> If this work is done, I hope some "depends on !COMPILE_TEST" will go
> away (but not all?)
> https://patchwork.kernel.org/patch/10225375/

I think most of the 'depends on !COMPILE_TEST' are for cases that
impact compile-testing in some way (more false-positive warnings,
fewer real warnings, much slower compile speed), rather than a lack
of check for a specific compiler version.

We might be able to replace the CONFIG_STANDALONE and
CONFIG_PREVENT_FIRMWARE_BUILD with Kconfig $(shell)
checks if you think that leads to an improvement.

        Arnd

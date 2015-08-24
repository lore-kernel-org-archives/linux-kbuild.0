Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:55465 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750941AbbHXQgZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Aug 2015 12:36:25 -0400
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com [209.85.220.180]) (authenticated)
	by conssluserg002-v.nifty.com with ESMTP id t7OGa6vO006716
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2015 01:36:07 +0900
Received: by qkda128 with SMTP id a128so25629152qkd.3
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2015 09:36:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55D5BAA4.5050003@suse.com>
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
	<55D5BAA4.5050003@suse.com>
Date: Tue, 25 Aug 2015 01:36:05 +0900
Message-ID: <CAK7LNARtmsBOticVU1dgx1iAXq8m5Q-pi-GkGe6E08HcqeHZZw@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL v2] Avoid conflict with host definitions when cross-compiling
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Pavel Fedin <p.fedin@samsung.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, trivial@kernel.org

Hi Michal,


2015-08-20 20:31 GMT+09:00 Michal Marek <mmarek@suse.com>:
> On 2015-08-14 12:52, Pavel Fedin wrote:
>> Certain platforms (e. g. BSD-based ones) define some ELF constants
>> according to host. This patch fixes problems with cross-building
>> Linux kernel on these platforms (e. g. building ARM 32-bit version
>> on x86-64 host).
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>
> Thanks, applied to kbuild.git#kbuild. But it seems that
> arch/x86/tools/relocs needs the same fix.
>
> Michal


I am not happy with getting weird code to work around issues on
non-Linux systems.

Is it justified to make efforts to build Linux
on other systems than Linux?


Documentation/Changes implies that already running a Linux system is
the requirement:

  Again, keep in mind that this list assumes you are already functionally
  running a Linux kernel.



I work on U-boot, which allows to be built on non-Linux systems.

This is what happened in U-boot community.

In order to build U-boot on non-Linux OSes,
GNU-extensions are forbidden even if they are cool.

After all, such patches are here and there.

http://patchwork.ozlabs.org/patch/395588/
http://patchwork.ozlabs.org/patch/397453/
http://patchwork.ozlabs.org/patch/378773/



Actually, 99% developers work on Linux systems, i.e. they only build
on Linux systems
and send patches.
1% developers send work-around patches to build on other OSes.

Nobody can cover all systems, such as Cygwin, BSD, Mac-OS, etc.

After a long run, mysterious code is sprinkled,
which nobody can judge if it is correct or not.



-- 
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:34792 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752039AbbHYISb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Aug 2015 04:18:31 -0400
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com [209.85.160.180]) (authenticated)
	by conssluserg004-v.nifty.com with ESMTP id t7P8IAXC002887
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2015 17:18:10 +0900
Received: by ykdt205 with SMTP id t205so148929941ykd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2015 01:18:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <00dc01d0df0a$3bda3e90$b38ebbb0$@samsung.com>
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
	<55D5BAA4.5050003@suse.com>
	<CAK7LNARtmsBOticVU1dgx1iAXq8m5Q-pi-GkGe6E08HcqeHZZw@mail.gmail.com>
	<00dc01d0df0a$3bda3e90$b38ebbb0$@samsung.com>
Date: Tue, 25 Aug 2015 17:18:09 +0900
Message-ID: <CAK7LNAQ31nrSZ9vjVGa3p_rr85E0V6xZSaA3xKt3JxYAMMtnLg@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL v2] Avoid conflict with host definitions when cross-compiling
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Fedin <p.fedin@samsung.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2015-08-25 16:47 GMT+09:00 Pavel Fedin <p.fedin@samsung.com>:
>  Hello!
>
>> I am not happy with getting weird code to work around issues on
>> non-Linux systems.
>
>  What is your criteria of being weird? Why are four #undef's weird ?


I am not criticizing your particular patch.

Once we decide to support building on other OSes,
I fear more and more patches would come in
to fix building issues.

I guess shell-scripts are often encountered with portability issues.
People tend to do coding without caring about the portability.


>  Do you want to tell that "all OSes except Linux are weird?" Isn't it too childish?

I am saying that at all.


>  I can say that i use Windows as my desktop OS because only Windows has all the necessary corporate software, and using Linux inside a virtual machine just for running builds is inconvenient. And vast majority of corporate users use Windows.
>  Well, it's just my opinion, i'm not going to start another "Lin vs Win" war, i think it's just stupid.


We are not talking about the majority among corporate uses in general.

Linux is absolutely the majority among kernel developers.
They might also use Windows too, but they most likely run Linux
(on a real hardware, or a virtual machine,  whatever) for developing the kernel.


-- 
Best Regards
Masahiro Yamada

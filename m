Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36087 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426658AbcBRRyj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2016 12:54:39 -0500
Received: by mail-io0-f173.google.com with SMTP id l127so81780134iof.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Feb 2016 09:54:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56C59083.7060501@suse.com>
References: <20160206004438.GA21780@www.outflux.net>
	<CAGXu5jKOqnAGkpgr0iY47gFYAuJXQnsF5dQO655D00voVkX5UQ@mail.gmail.com>
	<56C59083.7060501@suse.com>
Date: Thu, 18 Feb 2016 09:54:38 -0800
Message-ID: <CAGXu5jJaMV+OwfEuAE5V28HVY=_4EnhrkTpmHXROLvQzd7fgsA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: disable Android-specific compiler features
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Feb 18, 2016 at 1:36 AM, Michal Marek <mmarek@suse.com> wrote:
> Dne 18.2.2016 v 00:03 Kees Cook napsal(a):
>> On Fri, Feb 5, 2016 at 4:44 PM, Kees Cook <keescook@chromium.org> wrote:
>>> The Android compilers enable some non-standard features by default. While
>>> most Android build systems inject the needed "-mno-android" option via
>>> KCFLAGS, it happens too late (at least on x86_64), since KBUILD_CFLAGS
>>> gains KCFLAGS after running (and failing) many cc-option tests. (For
>>> example, the stack-protector tests happen after arch-specific
>>> KBUILD_CFLAGS are added but before the external KCFLAGS are added.) As
>>> such, we should notice this option and immediately turn it on as the
>>> first cc-option test we run.
>>>
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> Michal, is this okay? I'd like to get it into -next soon if possible.
>
> Is there a way to detect these compilers and are there some canonical
> versions of these? I do not think it's a good idea to add workaround for
> each random gcc fork.

It's detectable by -mno-android being a valid option. It's not a
random gcc fork, as it's part of the Android SDK gcc prebuilts that
all Android vendors and hobbiests use to build their kernels.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security

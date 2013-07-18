Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:48109 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759450Ab3GRWBD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Jul 2013 18:01:03 -0400
Received: by mail-ob0-f178.google.com with SMTP id fb19so4316011obc.23
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jul 2013 15:01:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130718204744.GC3417@free.fr>
References: <20130718183201.GA21183@www.outflux.net>
	<CAMuHMdX4dj3q53RsWTTmo-AOU1ee-xgp257CwacJnHfWn0BEAQ@mail.gmail.com>
	<20130718204744.GC3417@free.fr>
Date: Thu, 18 Jul 2013 15:01:02 -0700
Message-ID: <CAGXu5j+FddNDgyrF1qMU5_SSODPJjYJrEXnog=J9CBMABiW_ng@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: switch to "long long" for sanity
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, =?ISO-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Jul 18, 2013 at 1:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Kees, Geert, All,
>
> On 2013-07-18 22:00 +0200, Geert Uytterhoeven spake thusly:
>> On Thu, Jul 18, 2013 at 8:32 PM, Kees Cook <keescook@chromium.org> wrote:
>> > Instead of using "long" for kconfig "hex" and "range" values, which may
>> > change in size depending on the host architecture, use "long long". This
>> > will allow values greater than INT_MAX on 32-bit hosts when cross
>> > compiling.
>> >
>> > Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Ok, thanks, I'll take in my tree.
>
> Is it material for -rc-fixes, or can it wait in -for-next?
>
> My gut feelings is that it does not fix an existing breakage, but only a
> potential problem in the future, so it would be a candidate for
> -for-next. Agreed?

Correct. I'm not aware of anything in the tree that currently uses
>INT_MAX values in kconfig.

-Kees

-- 
Kees Cook
Chrome OS Security

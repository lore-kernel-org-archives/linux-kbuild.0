Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35577 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755543AbcGFS5K (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jul 2016 14:57:10 -0400
Received: by mail-wm0-f52.google.com with SMTP id z126so122468469wme.0
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jul 2016 11:57:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160628133942.3ef9ea556a38f98a4c5dcd05@gmail.com>
References: <20160626173451.c8406cd0c7a87cc3f94d9753@gmail.com>
 <CAGXu5jJw-HcYRo8muSQ7Av9ZGuO3jTgV2x_xDcqmK-i=2nu1aw@mail.gmail.com> <20160628133942.3ef9ea556a38f98a4c5dcd05@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 6 Jul 2016 14:57:08 -0400
Message-ID: <CAGXu5jL6H=Y+o5AmZrmZDdLRBiHi5O=51Uro1BzutRBYqDDT+w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/kernel: Disable the latent entropy plugin unconditionally
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, PaX Team <pageexec@freemail.hu>

On Tue, Jun 28, 2016 at 7:39 AM, Emese Revfy <re.emese@gmail.com> wrote:
> On Mon, 27 Jun 2016 09:05:08 -0700
> Kees Cook <keescook@chromium.org> wrote:
>
>> On Sun, Jun 26, 2016 at 8:34 AM, Emese Revfy <re.emese@gmail.com> wrote:
>> >
>> > Reported-by: PaX Team <pageexec@freemail.hu>
>> > Signed-off-by: Emese Revfy <re.emese@gmail.com>
>>
>> Thanks! Can you include a body in the commit message? For this, something like:
>>
>> Disable the gcc-plugin unconditionlly here because ... *reason it is required*
>
> Hi,
>
> You can see it here:
> https://github.com/ephox-gcc-plugins/gcc-plugins_linux-next/commit/a1bb2bd3fd9ac414623ec3210e9c514d9d38cf9e

Thanks, I've squashed this into the latenty_entropy initial commit in my tree.

-Kees

>
> --
> Emese



-- 
Kees Cook
Chrome OS & Brillo Security

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35859 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933345AbcFGV6e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2016 17:58:34 -0400
Received: by mail-wm0-f50.google.com with SMTP id n184so155838413wmn.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jun 2016 14:58:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160607235935.60ef8505b54f052a464bc4de@gmail.com>
References: <20160524000719.b456ed0cd2aafacb4e53f177@gmail.com>
 <CAGXu5jKC=HuCe3FPuuzjAZ+SX6C5AnhMp5BWwLhi8xVXhTGjEg@mail.gmail.com>
 <57458279.6080009@suse.com> <CAGXu5jKw_oQNCVUH+o_k-W+5Z7LDXgJ3UpP24a+y4S0Ny+gvvw@mail.gmail.com>
 <57573559.1010607@suse.com> <CAGXu5j+y-fb7qj+C2xNXzqT1-ob-CJq7D6cLHGNTcpCWMPGA4Q@mail.gmail.com>
 <20160607235935.60ef8505b54f052a464bc4de@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 7 Jun 2016 14:58:27 -0700
Message-ID: <CAGXu5jLGCCoM83wXXasVz=1neBKbfZmrcrT39ZXqXTh7FUgEaA@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] Introduce GCC plugin infrastructure
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>, Dmitry Vyukov <dvyukov@google.com>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Tue, Jun 7, 2016 at 2:59 PM, Emese Revfy <re.emese@gmail.com> wrote:
> On Tue, 7 Jun 2016 13:59:53 -0700
> Kees Cook <keescook@chromium.org> wrote:
>
>> >
>> > I applied the series to kbuild.git#kbuild now, sorry for the delay.
>>
>> Awesome! Thank you very much. I'll prepare the latent entropy plugin
>> for -next now too.
>
> I'll send a new patch series this week because I'm developing a small feature and
> I'm fixing the handling of tail calls.

Depending on timing, it may be best to send a delta patch from
kbuild.git#kbuild. I assume that would be easier for Michal to carry.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security

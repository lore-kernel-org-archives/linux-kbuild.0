Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35906 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750844AbdHLMAG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Aug 2017 08:00:06 -0400
Received: by mail-it0-f66.google.com with SMTP id o72so575739ita.3
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Aug 2017 05:00:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNARVhn9QkjOSfSHr+G2P08v9za2m51cr6kruekA8FwVVhg@mail.gmail.com>
References: <20170724142047.3679-1-bjorn.forsman@gmail.com> <CAK7LNARVhn9QkjOSfSHr+G2P08v9za2m51cr6kruekA8FwVVhg@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 12 Aug 2017 14:00:04 +0200
Message-ID: <CAEYzJUEgX4+1b0c8jqC7TALWZkKqLiqE0HMvB1zqHrEfv9yEEg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: /bin/pwd -> pwd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Jan Kiszka <jan.kiszka@siemens.com>, kieran@ksquared.org.uk

Hi,

On 12 August 2017 at 05:26, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi.
>
> 2017-07-24 23:20 GMT+09:00 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
>> Several places already use pwd and rely on $PATH lookup. Moving the
>> remaining /bin/pwd users over for consistency.
>>
>> Also, a reason for doing /bin/pwd -> pwd instead of the other way around
>> is because I believe build systems should make little assumptions on hos=
t
>> filesystem layout. Case in point, we do this kind of patching already in
>> NixOS.
> [...]
> Could you use $(abspath ...) instead of $(shell cd ... && /bin/pwd) ?
> [...]
> This one should use $(realpath ...) instead of $(abspath ...), I think.
>
> The difference between them is that
> $(realpath ...) returns an empty string if the given path does not exist.

That sounds like possibly changing semantics. I'd prefer to keep the
patch as is, since I'm not familiar with the side effects of inserting
relative vs absolute paths here. Is that OK for you?

Best regards,
Bj=C3=B8rn Forsman

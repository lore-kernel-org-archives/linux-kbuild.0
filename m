Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:38186 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751569AbdHPQOi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Aug 2017 12:14:38 -0400
Received: by mail-it0-f48.google.com with SMTP id m34so19357960iti.1
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Aug 2017 09:14:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATj+oidNg_FTpa57BfUK=kBNhHzs8wdbobCFbQaagV2RA@mail.gmail.com>
References: <20170724142047.3679-1-bjorn.forsman@gmail.com>
 <CAK7LNARVhn9QkjOSfSHr+G2P08v9za2m51cr6kruekA8FwVVhg@mail.gmail.com>
 <CAEYzJUEgX4+1b0c8jqC7TALWZkKqLiqE0HMvB1zqHrEfv9yEEg@mail.gmail.com> <CAK7LNATj+oidNg_FTpa57BfUK=kBNhHzs8wdbobCFbQaagV2RA@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 16 Aug 2017 18:14:37 +0200
Message-ID: <CAEYzJUGzg0fTfvv-dn9_FF+a6whkNguxm__NM+=U0cUguGdxyQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: /bin/pwd -> pwd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kieran@ksquared.org.uk>

On 16 August 2017 at 17:31, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-08-12 21:00 GMT+09:00 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
>> On 12 August 2017 at 05:26, Masahiro Yamada <yamada.masahiro@socionext.c=
om> wrote:
>>> [...]
>>> The difference between them is that
>>> $(realpath ...) returns an empty string if the given path does not exis=
t.
>>
>> That sounds like possibly changing semantics. I'd prefer to keep the
>> patch as is, since I'm not familiar with the side effects of inserting
>> relative vs absolute paths here. Is that OK for you?
>
> I prefer abspath/realpath.
>
> If you are reluctant to do it, I will take a look.

Yes please. I only care about getting rid of /bin/pwd (absolute path).

Best regards,
Bj=C3=B8rn Forsman

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44920 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbfJBXO4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 19:14:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id m13so567068ljj.11
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 16:14:53 -0700 (PDT)
Date: Thu, 3 Oct 2019 02:14:50 +0300
From: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: Re: [PATCH bpf] samples/bpf: kbuild: add CONFIG_SAMPLE_BPF Kconfig
Message-ID: <20191002231448.GA10649@khorivan>
References: <20191001101429.24965-1-bjorn.topel@gmail.com>
 <CAK7LNATNw4Qysj1Q2dXd4PALfbtgMXPwgvmW=g0dRcrczGW-Fg@mail.gmail.com>
 <CAJ+HfNgvxornSfqnbAthNy6u6=-enGCdA8K1e6rLXhCzGgmONQ@mail.gmail.com>
 <CAK7LNATD4vCQnNsHXP8A2cyWDkCNX=LGh0ej-dkDajm-+Lfw8Q@mail.gmail.com>
 <CAJ+HfNgem7ijzQkz7BU-Z_A-CqWXY_uMF6_p0tGZ6eUMx_N3QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+HfNgem7ijzQkz7BU-Z_A-CqWXY_uMF6_p0tGZ6eUMx_N3QQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>

On Wed, Oct 02, 2019 at 09:41:15AM +0200, Björn Töpel wrote:
>On Wed, 2 Oct 2019 at 03:49, Masahiro Yamada
><yamada.masahiro@socionext.com> wrote:
>>
>[...]
>> > Yes, the BPF samples require clang/LLVM with BPF support to build. Any
>> > suggestion on a good way to address this (missing tools), better than
>> > the warning above? After the commit 394053f4a4b3 ("kbuild: make single
>> > targets work more correctly"), it's no longer possible to build
>> > samples/bpf without support in the samples/Makefile.
>>
>>
>> You can with
>>
>> "make M=samples/bpf"
>>
>
>Oh, I didn't know that. Does M= support "output" builds (O=)?
>
>I usually just build samples/bpf/ with:
>
>  $ make V=1 O=/home/foo/build/bleh samples/bpf/
>
>
>Björn

Shouldn't README be updated?

-- 
Regards,
Ivan Khoronzhuk

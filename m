Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:46801 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752856AbdKTVba (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 16:31:30 -0500
Received: by mail-it0-f51.google.com with SMTP id r127so13706373itb.5
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2017 13:31:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171120212941.051d11c4@delmar.localdomain>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-17-samitolvanen@google.com> <20171120152014.hftuded4zxwn2r7m@lakrids.cambridge.arm.com>
 <20171120212941.051d11c4@delmar.localdomain>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 20 Nov 2017 21:31:29 +0000
Message-ID: <CAKv+Gu9gThj2ZHDBjm2drEjnu8CZAWwR96k8XFFfMkXRmfEgaQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] arm64: crypto: disable LTO for aes-ce-cipher.c
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>, Andi Kleen <ak@linux.intel.com>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On 20 November 2017 at 21:29, Alex Matveev <alxmtvv@gmail.com> wrote:
> On Mon, 20 Nov 2017 15:20:14 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
>
>> On Wed, Nov 15, 2017 at 01:34:26PM -0800, Sami Tolvanen wrote:
>> > CONFIG_LTO_CLANG requires the use of clang's integrated assembler,
>> > which doesn't understand the inline assembly in aes-ce-cipher.c.
>> > Disable LTO for the file to work around the issue.
>>
>> Could you elaborate on what the integrated asembler doesn't like?
>>
>> It's not entirely clear at a glance, as the asm in that file doesn't
>> seem to do anything that obscure.
>>
>> Is it a bug?
>
> Turns out, integrated assembler doesn't like this instruction in
> aes_sub():
>         umov    %w[out], v0.4s[0]
>
> Specifically, it barks at "v0.4s[0]" part. And the way I read the spec,
> it's quite correct in not accepting this argument. From UMOV
> description:
>
> UMOV <Wd>, <Vn>.<Ts>[<index>]
>
> ...
>
> <Ts> For the 32-bit variant: is an element size specifier, encoded in
> the "imm5" field. It can have the following values:
>         B       when imm5 = xxxx1
>         H       when imm5 = xxx10
>         S       when imm5 = xx100
>
>
> With "v0.s[0]" it builds fine.
>
> Ard, since this is your code, can you comment? Feels like a typo.
>

Yep.

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:40734 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752725AbdKTV3p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 16:29:45 -0500
Date: Mon, 20 Nov 2017 21:29:41 +0000
From: Alex Matveev <alxmtvv@gmail.com>
Subject: Re: [PATCH v2 16/18] arm64: crypto: disable LTO for aes-ce-cipher.c
Message-ID: <20171120212941.051d11c4@delmar.localdomain>
In-Reply-To: <20171120152014.hftuded4zxwn2r7m@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-17-samitolvanen@google.com>
 <20171120152014.hftuded4zxwn2r7m@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Mon, 20 Nov 2017 15:20:14 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Wed, Nov 15, 2017 at 01:34:26PM -0800, Sami Tolvanen wrote:
> > CONFIG_LTO_CLANG requires the use of clang's integrated assembler,
> > which doesn't understand the inline assembly in aes-ce-cipher.c.
> > Disable LTO for the file to work around the issue.  
> 
> Could you elaborate on what the integrated asembler doesn't like?
> 
> It's not entirely clear at a glance, as the asm in that file doesn't
> seem to do anything that obscure.
> 
> Is it a bug?

Turns out, integrated assembler doesn't like this instruction in
aes_sub():
	umov	%w[out], v0.4s[0]

Specifically, it barks at "v0.4s[0]" part. And the way I read the spec,
it's quite correct in not accepting this argument. From UMOV
description:

UMOV <Wd>, <Vn>.<Ts>[<index>]

...

<Ts> For the 32-bit variant: is an element size specifier, encoded in
the "imm5" field. It can have the following values:
	B	when imm5 = xxxx1
	H	when imm5 = xxx10
	S	when imm5 = xx100


With "v0.s[0]" it builds fine.

Ard, since this is your code, can you comment? Feels like a typo.

Regards,
Alex

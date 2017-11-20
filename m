Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:35138 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751155AbdKTOrH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 09:47:07 -0500
Received: by mail-it0-f51.google.com with SMTP id u132so12058277ita.0
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2017 06:47:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171120144306.z5uyeyectmce6plu@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-7-samitolvanen@google.com> <20171120144147.7iawjcw644zc4xes@lakrids.cambridge.arm.com>
 <20171120144306.z5uyeyectmce6plu@lakrids.cambridge.arm.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 20 Nov 2017 14:47:06 +0000
Message-ID: <CAKv+Gu8z58yJAS7MJW0xwhpf_=a_8ZVLed5gTftawNFHZdM=9A@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] arm64: kvm: use -fno-jump-tables with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On 20 November 2017 at 14:43, Mark Rutland <mark.rutland@arm.com> wrote:
> On Mon, Nov 20, 2017 at 02:41:47PM +0000, Mark Rutland wrote:
>> On Wed, Nov 15, 2017 at 01:34:16PM -0800, Sami Tolvanen wrote:
>> > Use -fno-jump-tables to make sure clang doesn't generate branches
>> > to EL1 virtual addresses.
>>
>> Are there any other reasons that clang might generate absolute
>> references/relocations?
>>
>> It would be nice if there was the option to disable that more generally,
>> rather than disabling individual optimizations. Is there any PIC/PIE
>> option that we could use?
>>
>> We might need something simnilar for GCC, even if we're not seeing
>> problems today.
>
> ... and likewise for the EFI stub, which needs to be
> position-independent much like the hyp code.
>

Actually, we are already using -fpie for the EFI stub, but it is a bit
fiddly because it requires visibility overrides, given that PIC symbol
references are usually indirected via GOT entries. At the time, it
didn't occur to me that the HYP code has similar issues. Of course, in
the EFI stub we already check for ABS64 relocations to make sure that
the resulting code is correct (and /me makes mental note to add
R_AARCH64_GOT_xxx relocations to that as well)

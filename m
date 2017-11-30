Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33868 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753482AbdK3Acz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 19:32:55 -0500
Received: by mail-lf0-f48.google.com with SMTP id x20so5995251lff.1
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 16:32:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129234442.655-2-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com> <20171129234442.655-2-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Nov 2017 16:32:52 -0800
Message-ID: <CAKwvOdme29UPfaV1CCbMXRM=LzZJ-asytEjGm_F7ARN0WrMsEg@mail.gmail.com>
Subject: Re: [PATCH 1/7] kbuild: add ld-name macro and support for GNU gold
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>

On Wed, Nov 29, 2017 at 3:44 PM, Sami Tolvanen <samitolvanen@google.com> wrote:
> GNU gold may require different flags than GNU ld. Add a macro for
> detecting the linker and conditionally add gold specific flags from
> LDFLAGS_GOLD.

Right, but you're still only ever using one linker per build, correct?
 Can we get away without 2 distinct flags?

> +# Add any flags specific to ld.gold
> +ifeq ($(ld-name),gold)
> +LDFLAGS                += $(LDFLAGS_GOLD)
> +endif
> +

Patch 1 and 6 have this pattern of always assigning to LDFLAGS_GOLD,
then that to LDFLAGS.  Wouldn't it be better to check the ld-name and
conditionally assign to LDFLAGS? Then LDFLAGS_GOLD is not necessary.
For example, what I'm suggesting is what is done in patch 4.

> +# ld-name
> +# Expands to either bfd or gold
> +ld-name = $(shell $(LD) -v 2>&1 | grep -q "GNU gold" && echo gold || echo bfd)
> +

This part LGTM.

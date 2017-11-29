Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:40704 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752708AbdK2X54 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 18:57:56 -0500
Received: by mail-lf0-f44.google.com with SMTP id t197so5891268lfe.7
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 15:57:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129234442.655-6-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com> <20171129234442.655-6-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Nov 2017 15:57:53 -0800
Message-ID: <CAKwvOd=PcTVZaMCtY7Wy-OEi7Dd1M4hVz8mpJCQR3M+dVROdmg@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: keep .altinstructions and .altinstr_replacement
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>

On Wed, Nov 29, 2017 at 3:44 PM, Sami Tolvanen <samitolvanen@google.com> wrote:
> Make sure the linker doesn't remove .altinstructions or
> .altinstr_replacement when CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is
> enabled.

This sounds like a bug in the original implementation of
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION? If so, this can likely get
merged regardless of the rest of the patchset, ie. gold support.

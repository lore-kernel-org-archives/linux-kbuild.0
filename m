Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:40222 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752129AbdK3CKo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 21:10:44 -0500
Date: Thu, 30 Nov 2017 12:10:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/7] kbuild: fix LD_DEAD_CODE_DATA_ELIMINATION with GNU
 gold
Message-ID: <20171130121029.3647ea43@roar.ozlabs.ibm.com>
In-Reply-To: <20171129234442.655-4-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
        <20171129234442.655-4-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, 29 Nov 2017 15:44:38 -0800
Sami Tolvanen <samitolvanen@google.com> wrote:

> Don't remove .head.text or .exitcall.exit when linking with --gc-sections,
> and include .init.text.* in .init.text and .init.rodata.* in .init.rodata.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Fine by me, if you consider my other comments.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:46151 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750784AbdKPQfx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:35:53 -0500
Received: by mail-io0-f193.google.com with SMTP id t11so5809159iof.13
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:35:53 -0800 (PST)
Date: Thu, 16 Nov 2017 08:35:49 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 09/18] arm64: explicitly pass
 --no-fix-cortex-a53-843419 to GNU gold
Message-ID: <20171116163549.GD94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-10-samitolvanen@google.com>
 <20171116114722.GD9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116114722.GD9361@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 11:47:23AM +0000, Will Deacon wrote:
> But if ARM64_ERRATUM_843419 is enabled, we'll go ahead and generate
> broken code?

This bug has been fixed in all current versions of GNU gold, but of
course, if someone is using a broken linker, it will generate broken
code. We can't do anything about that in the kernel.

The reason for this patch is that the linker can be configured to
enable the erratum fix by default, and we must explicitly disable it
if we don't want the fix, whether it's because of a broken linker, or
in our case, because of issues with kernel modules.

Sami

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:46608 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933987AbdKPQRg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:17:36 -0500
Received: by mail-it0-f66.google.com with SMTP id r127so591627itb.5
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:17:36 -0800 (PST)
Date: Thu, 16 Nov 2017 08:17:31 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Message-ID: <20171116161731.GA94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-19-samitolvanen@google.com>
 <20171116115810.GH9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116115810.GH9361@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, peterz@infradead.org, paulmck@linux.vnet.ibm.com

On Thu, Nov 16, 2017 at 11:58:11AM +0000, Will Deacon wrote:
> I'll be honest with you: I'm absolutely terrified about enabling this.

That's understandable, I wouldn't want to enable this by default
quite yet either. This patch doesn't enable LTO for arm64, just makes
it possible to enable the feature. I'm perfectly fine with marking
CONFIG_LTO_CLANG experimental if it makes people more comfortable.

> How much testing has this seen?

I've been running clang LTO kernels for a few months on a Pixel 2 device
without any issues. This is on a 4.4 kernel though.

> Right now, the C standard isn't on our side here and we're relying on
> the compiler not doing this kind of thing. Can we continue to rely on
> that in the face of LTO?

I'll have to check with our LLVM experts, but I have not run into these
issues with current compiler versions. Looking at Andi's old patches,
looks like gcc might be more aggressive in reordering things with LTO
than clang.

Sami

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:42661 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752720AbdKTUvn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 15:51:43 -0500
Received: by mail-io0-f182.google.com with SMTP id u42so17123087ioi.9
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2017 12:51:43 -0800 (PST)
Date: Mon, 20 Nov 2017 12:51:39 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 16/18] arm64: crypto: disable LTO for aes-ce-cipher.c
Message-ID: <20171120205139.GC89108@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-17-samitolvanen@google.com>
 <20171120152014.hftuded4zxwn2r7m@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171120152014.hftuded4zxwn2r7m@lakrids.cambridge.arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Mon, Nov 20, 2017 at 03:20:14PM +0000, Mark Rutland wrote:
> Could you elaborate on what the integrated asembler doesn't like?

Here's the error, looks like in aes_sub:

<inline asm>:1:69: error: invalid operand for instruction
        dup     v1.4s, w12              ;movi   v0.16b, #0              ;aese   v0.16b, v1.16b          ;umov   w12, v0.4s[0]   ;
                                                                                                                     ^
LLVM ERROR: Error parsing inline asm

Sami

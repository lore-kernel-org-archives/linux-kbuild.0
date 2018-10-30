Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40369 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725743AbeJaGGj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Oct 2018 02:06:39 -0400
MIME-Version: 1.0
References: <1540905994-6073-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1540905994-6073-1-git-send-email-yamada.masahiro@socionext.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Oct 2018 07:41:21 +1030
Message-ID: <CACPK8Xf4+M9Q1zC5GBC0PBJBZnim14m_s5HoQJQOn5Dc-uCDag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: replace cc-name test with CONFIG_CC_IS_CLANG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org, Michal Marek <michal.lkml@markovi.net>, jhogan@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Tue, 30 Oct 2018 at 23:58, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Evaluating cc-name invokes the compiler every time even when you are
> not compiling anything, like 'make help'. This is not efficient.
>
> The compiler type has been already detected in the Kconfig stage.
> Use CONFIG_CC_IS_CLANG, instead.

Thanks, I didn't know about this.

>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

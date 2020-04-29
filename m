Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbgD2HEz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 03:04:55 -0400
MIME-Version: 1.0
References: <20200423171807.29713-1-natechancellor@gmail.com> <20200428221419.2530697-1-natechancellor@gmail.com>
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 29 Apr 2020 09:04:42 +0200
Message-ID: <CA+icZUVz8zYVY3rgT4hS6a11+1Pw6y_Du-hkPra1PkgtLWgRbA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>

On Wed, Apr 29, 2020 at 12:14 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Patch 1 adds ld.lld support to Kconfig so that we can avoid certain
> ld.bfd checks.
>

Is it possible to introduce and add LD_IS_BFD Kconfig for ld.bfd in this series?
Most people agreed on this name AFAICS.
What do people think?

- Sedat -

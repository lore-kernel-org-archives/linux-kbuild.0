Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD3DGd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 23:06:33 -0400
Date: Wed, 29 Apr 2020 20:06:30 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Message-ID: <20200430030630.GB3546299@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <CA+icZUVz8zYVY3rgT4hS6a11+1Pw6y_Du-hkPra1PkgtLWgRbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUVz8zYVY3rgT4hS6a11+1Pw6y_Du-hkPra1PkgtLWgRbA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>

On Wed, Apr 29, 2020 at 09:04:42AM +0200, Sedat Dilek wrote:
> On Wed, Apr 29, 2020 at 12:14 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> 
> > Patch 1 adds ld.lld support to Kconfig so that we can avoid certain
> > ld.bfd checks.
> >
> 
> Is it possible to introduce and add LD_IS_BFD Kconfig for ld.bfd in this series?
> Most people agreed on this name AFAICS.
> What do people think?
> 
> - Sedat -

What is the use case for LD_IS_BFD right now? I am not sure I see a
reason to add a CONFIG value that won't see any immediate use.

Cheers,
Nathan

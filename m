Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:35333 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWnd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 May 2020 18:43:33 -0400
Date: Sat, 2 May 2020 14:50:34 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200428221419.2530697-5-natechancellor@gmail.com>
Message-ID: <alpine.LFD.2.21.2005021435100.3602499@eddie.linux-mips.org>
References: <20200423171807.29713-1-natechancellor@gmail.com> <20200428221419.2530697-1-natechancellor@gmail.com> <20200428221419.2530697-5-natechancellor@gmail.com>
Content-Type: text/plain; charset=US-ASCII
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Tue, 28 Apr 2020, Nathan Chancellor wrote:

> Before this patch, LD=ld.lld did nothing:
> 
> $ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
> String dump of section '.comment':
> [     0] ClangBuiltLinux clang version 11.0.0

 What does it mean "did nothing", is `arch/mips/vdso/vdso.so.dbg.raw' not 
produced?  Where does `arch/mips/vdso/vdso.so.dbg' come from then?

  Maciej

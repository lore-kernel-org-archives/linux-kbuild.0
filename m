Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:21203 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWlD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 May 2020 18:41:03 -0400
Date: Wed, 29 Apr 2020 18:46:33 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
Message-ID: <alpine.LFD.2.21.2004291835400.851719@eddie.linux-mips.org>
References: <20200419202128.20571-1-natechancellor@gmail.com> <20200423171807.29713-1-natechancellor@gmail.com> <20200423171807.29713-3-natechancellor@gmail.com> <20200426162737.GA9322@alpha.franken.de> <20200427020830.GA260@Ryzen-7-3700X.localdomain>
 <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org> <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
Content-Type: text/plain; charset=US-ASCII
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Mon, 27 Apr 2020, Nathan Chancellor wrote:

> >  Can you actually record in the change description what the difference in 
> > the relevant link command is, as shown where `V=1' has been used with 
> > `make' invocation?
> 
> That will be rather unweildy to put in the commit message since
> currently, $(CC) + $(KBUILD_CFLAGS) is being used but I can if it is
> really desired. Otherwise, I can just put it where I put the changelog.

 Umm, is the difference so huge?  I think a note along the lines of:

"[...] This change adds/removes[*]:

<part of the command affected>

from the invocation of [...], which is required for [...]"

-- only quoting what's actually changed will be sufficient.  Reword as 
required.  Otherwise it's hard to guess now what the change actually does, 
and it will be even harder for someone who comes across it and tries to 
understand it the future, when the context might be hard to reproduce.

[*] Delete as appropriate.

  Maciej

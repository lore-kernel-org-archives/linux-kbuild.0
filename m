Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40389 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932845AbeFUMni (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jun 2018 08:43:38 -0400
Date: Thu, 21 Jun 2018 14:43:34 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCHv4 3/3] x86: Add build salt to the vDSO and kernel linker
 scripts
Message-ID: <20180621124334.GA30110@gmail.com>
References: <20180612003224.3658-1-labbott@redhat.com>
 <20180612003224.3658-4-labbott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180612003224.3658-4-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org


* Laura Abbott <labbott@redhat.com> wrote:

> 
> Both the kernel and the vDSO need to have unique build ids.
> Insert the build salt section to make the build ids unique.
> 
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
>  arch/x86/entry/vdso/vdso-layout.lds.S | 3 ++-
>  arch/x86/kernel/vmlinux.lds.S         | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)

Acked-by: Ingo Molnar <mingo@kernel.org>

What is the upstream merge plan for this series? kbuild tree?

Thanks,

	Ingo

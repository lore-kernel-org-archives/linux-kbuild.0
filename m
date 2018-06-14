Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.136]:60711 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755325AbeFNUuO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 16:50:14 -0400
Subject: Re: [PATCH v5 2/3] x86/asm: add _ASM_ARG* constants for argument
 registers to <asm/asm.h>
References: <20180613210518.113983-1-ndesaulniers@google.com>
 <20180613210518.113983-3-ndesaulniers@google.com>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <b027a324-ffae-fd5e-d8a3-03934be91a2d@zytor.com>
Date: Thu, 14 Jun 2018 13:47:27 -0700
MIME-Version: 1.0
In-Reply-To: <20180613210518.113983-3-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, akpm@linux-foundation.org, mingo@redhat.com, tglx@linutronix.de
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, virtualization@lists.linux-foundation.org, astrachan@google.com, manojgupta@google.com, ghackmann@google.com, sedat.dilek@gmail.com, tstellar@redhat.com, keescook@google.com, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, geert@linux-m68k.org, will.deacon@arm.com, mawilcox@microsoft.com, arnd@arndb.de, rientjes@google.com, acme@redhat.com, pombredanne@nexb.com, aryabinin@virtuozzo.com, kstewart@linuxfoundation.org, boris.ostrovsky@oracle.com, jan.kiszka@siemens.com, rostedt@goodmis.org, kirill.shutemov@linux.intel.com, ard.biesheuvel@linaro.org, akataria@vmware.com, brijesh.singh@amd.com, caoj.fnst@cn.fujitsu.com, gregkh@linuxfoundation.org, jarkko.sakkinen@linux.intel.com, jgross@suse.com, jpoimboe@redhat.com, mka@chromium.org, thomas.lendacky@amd.com, tweek@google.com, mjg59@google.com, joe@perches.com, andrea.parri@amarulasolutions.com, "H. Peter Anvin" <hpa@linux.intel.com>

On 06/13/18 14:05, Nick Desaulniers wrote:
> From: "H. Peter Anvin" <hpa@linux.intel.com>
> 
> i386 and x86-64 uses different registers for arguments; make them
> available so we don't have to #ifdef in the actual code.
> 
> Native size and specified size (q, l, w, b) versions are provided.
> 
> Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

I still object to Suggested-by: here.  Sedat did a correction, which is
a Reviewed-by:, but unless I'm completely out to sea, there was no
suggestion on Sedat's part of this; and I had certainly not seen it when
I wrote the code.

	-hpa


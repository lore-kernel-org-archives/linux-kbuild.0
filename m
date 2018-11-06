Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:39018 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbeKGFCi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Nov 2018 00:02:38 -0500
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
Date: Tue, 6 Nov 2018 11:57:57 -0700
MIME-Version: 1.0
In-Reply-To: <20181003213100.189959-3-namit@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, Stephen Bates <sbates@raithlin.com>



On 2018-10-03 3:30 p.m., Nadav Amit wrote:
> +ASM_MACRO_FLAGS = -Wa,arch/x86/kernel/macros.s -Wa,-
> +export ASM_MACRO_FLAGS
> +KBUILD_CFLAGS += $(ASM_MACRO_FLAGS)

I'm not sure how much we care about this or what we can do about it, but
adding the macros.s to the command line like this has effectively broken
distributed compiling with distcc and icecc as of v4.20-rc1. Neither
tool will successfully distribute any compile processes because the
non-local machines won't have a copy of macros.s.

Thanks,

Logan

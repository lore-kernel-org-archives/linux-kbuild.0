Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:45134 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbeKOLZc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 06:25:32 -0500
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-2-namit@vmware.com> <20181113113000.GB4788@gmail.com>
 <40E4E1B4-EF5F-43A1-B42C-C4CF6349FC62@vmware.com>
 <48577A3F-0F76-4CCA-A959-965344D7259F@vmware.com>
 <7ff5de62-d1df-9a67-1c86-497ce00a4de4@deltatee.com>
 <7072A2D8-30F8-45CB-AB0C-B1BE4A30259A@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <db8293cf-9abc-e899-8f43-6e42039006d9@deltatee.com>
Date: Wed, 14 Nov 2018 18:19:45 -0700
MIME-Version: 1.0
In-Reply-To: <7072A2D8-30F8-45CB-AB0C-B1BE4A30259A@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>



On 14/11/18 10:46 AM, Nadav Amit wrote:
> 
> Actually, we can just figure out whether distcc or icecc are used in the
> Makefile according to the “version”, similarly to the way clang is detected.
> This would neither require new Makefile arguments or Kconfig options.
> 
> What do you say about the following?

That may be a good idea, but I was kind of hoping to be able to add
support for this to at least a future version of icecc (though I'm not
committing to that...). So it would be nice to have a way to force it
one way or the other with an environment variable.

Thanks,

Logan

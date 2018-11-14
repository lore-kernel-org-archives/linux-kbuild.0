Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:39404 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727576AbeKNRbx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 12:31:53 -0500
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-2-namit@vmware.com> <20181113113000.GB4788@gmail.com>
 <40E4E1B4-EF5F-43A1-B42C-C4CF6349FC62@vmware.com>
 <48577A3F-0F76-4CCA-A959-965344D7259F@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <7ff5de62-d1df-9a67-1c86-497ce00a4de4@deltatee.com>
Date: Wed, 14 Nov 2018 00:29:38 -0700
MIME-Version: 1.0
In-Reply-To: <48577A3F-0F76-4CCA-A959-965344D7259F@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>



On 13/11/18 11:34 AM, Nadav Amit wrote:
> Just one question before I send v2, since I have second thoughts. Does it
> make sense to require the “DISTCC” make parameter, or should it be set in
> the Kconfig? It can be detected automatically, the same way gcc/clang are
> detected or manually through a config option.

I very much prefer the make variable as it can be set in the environment
without having to change the Kconfig.

Logan

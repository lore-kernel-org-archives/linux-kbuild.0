Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:34032 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752579AbeGBUdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 16:33:51 -0400
Date: Mon, 2 Jul 2018 13:33:21 -0700
From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address
 sanitizer
Message-ID: <20180702203321.GA8371@bombadil.infradead.org>
References: <cover.1530018818.git.andreyknvl@google.com>
 <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
 <CAN=P9pivApAo76Kjc0TUDE0kvJn0pET=47xU6e=ioZV2VqO0Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN=P9pivApAo76Kjc0TUDE0kvJn0pET=47xU6e=ioZV2VqO0Rg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kostya Serebryany <kcc@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@google.com>, aryabinin@virtuozzo.com, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, will.deacon@arm.com, cl@linux.com, mark.rutland@arm.com, Nick Desaulniers <ndesaulniers@google.com>, marc.zyngier@arm.com, dave.martin@arm.com, ard.biesheuvel@linaro.org, ebiederm@xmission.com, mingo@kernel.org, Paul Lawrence <paullawrence@google.com>, geert@linux-m68k.org, arnd@arndb.de, kirill.shutemov@linux.intel.com, Greg KH <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, rppt@linux.vnet.ibm.com, kasan-dev <kasan-dev@googlegroups.com>, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Evgeniy Stepanov <eugenis@google.com>, Lee Smith <Lee.Smith@arm.com>, Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Jacob Bramley <Jacob.Bramley@arm.com>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Jann Horn <jannh@google.com>, Mark Brand <markbrand@google.com>, cpandya@codeaurora.org, Vishwath Mohan <vishwath@google.com>

On Wed, Jun 27, 2018 at 05:04:28PM -0700, Kostya Serebryany wrote:
> The problem is more significant on mobile devices than on desktop/server.
> I'd love to have [K]HWASAN on x86_64 as well, but it's less trivial since x86_64
> doesn't have an analog of aarch64's top-byte-ignore hardware feature.

Well, can we emulate it in software?

We've got 48 bits of virtual address space on x86.  If we need all 8
bits, then that takes us down to 40 bits (39 bits for user and 39 bits
for kernel).  My laptop only has 34 bits of physical memory, so could
we come up with a memory layout which works for me?

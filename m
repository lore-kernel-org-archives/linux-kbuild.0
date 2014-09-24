Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:46215 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751641AbaIXPLi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Sep 2014 11:11:38 -0400
Date: Wed, 24 Sep 2014 08:11:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 00/13] Kernel address sanitizer - runtime memory
 debugger.
Message-Id: <20140924081137.087fde81.akpm@linux-foundation.org>
In-Reply-To: <1411562649-28231-1-git-send-email-a.ryabinin@samsung.com>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
	<1411562649-28231-1-git-send-email-a.ryabinin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Dmitry Chernenkov <dmitryc@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dave Hansen <dave.hansen@intel.com>, Andi Kleen <andi@firstfloor.org>, Vegard Nossum <vegard.nossum@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org, Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Dave Jones <davej@redhat.com>

On Wed, 24 Sep 2014 16:43:56 +0400 Andrey Ryabinin <a.ryabinin@samsung.com> wrote:

> Note: patch (https://lkml.org/lkml/2014/9/4/364) for gcc5 support
> somewhat just disappeared from the last mmotm,

hmpf, I must have fat-fingered that one and accidentally lost
the patch.  Fixed, thanks.

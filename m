Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:51351 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbeIRA1p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Sep 2018 20:27:45 -0400
Received: by mail-it0-f68.google.com with SMTP id e14-v6so12659436itf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Sep 2018 11:59:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACT4Y+adO3n4Nb4XOPyXdt43DbYjb=Kz6__tPTmb1CX=00qNSQ@mail.gmail.com>
References: <cover.1535462971.git.andreyknvl@google.com> <6cd298a90d02068969713f2fd440eae21227467b.1535462971.git.andreyknvl@google.com>
 <CACT4Y+adO3n4Nb4XOPyXdt43DbYjb=Kz6__tPTmb1CX=00qNSQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 17 Sep 2018 20:59:05 +0200
Message-ID: <CAAeHK+w+Znw-t_wd29PO5B+pNegS3wqzS1mUVCmfrgdCXpavWw@mail.gmail.com>
Subject: Re: [PATCH v6 07/18] khwasan: add tag related helper functions
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Martin <dave.martin@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, kasan-dev <kasan-dev@googlegroups.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sparse@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Lee Smith <Lee.Smith@arm.com>, Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Jacob Bramley <Jacob.Bramley@arm.com>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Jann Horn <jannh@google.com>, Mark Brand <markbrand@google.com>, Chintan Pandya <cpandya@codeaurora.org>, Vishwath Mohan <vishwath@google.com>

On Wed, Sep 12, 2018 at 6:21 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Aug 29, 2018 at 1:35 PM, Andrey Konovalov <andreyknvl@google.com> wrote:

>> +void *khwasan_preset_slub_tag(struct kmem_cache *cache, const void *addr)
>
> Can't we do this in the existing kasan_init_slab_obj() hook? It looks
> like it should do exactly this -- allow any one-time initialization
> for objects. We could extend it to accept index and return a new
> pointer.
> If that does not work for some reason, I would try to at least unify
> the hook for slab/slub, e.g. pass idx=-1 from slub and then use
> random_tag().
> It also seems that we do preset tag for slab multiple times (from
> slab_get_obj()). Using kasan_init_slab_obj() should resolve this too
> (hopefully we don't call it multiple times).

The issue is that SLAB stores freelist as an array of indexes instead
of using an actual linked list like SLUB. So you can't store the tag
in the pointer while the object is in the freelist, since there's no
pointer. And, technically, we don't preset tags for SLAB, we just use
the id as the tag every time a pointer is used, so perhaps we should
rename the callback. As to unifying the callbacks, sure, we can do
that.

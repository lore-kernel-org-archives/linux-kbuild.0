Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:37544 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbeIKVKI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Sep 2018 17:10:08 -0400
Received: by mail-it0-f66.google.com with SMTP id h20-v6so2232486itf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Sep 2018 09:10:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3f2dee71-1615-4a34-d611-3ccaf407551e@virtuozzo.com>
References: <cover.1535462971.git.andreyknvl@google.com> <db103bdc2109396af0c6007f1669ebbbb63b872b.1535462971.git.andreyknvl@google.com>
 <3f2dee71-1615-4a34-d611-3ccaf407551e@virtuozzo.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 11 Sep 2018 18:10:07 +0200
Message-ID: <CAAeHK+wke5swBfwJUandKe=Oo643n7vHiwPGfUtarT3UmsHetg@mail.gmail.com>
Subject: Re: [PATCH v6 16/18] khwasan, mm, arm64: tag non slab memory
 allocated via pagealloc
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Martin <dave.martin@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, kasan-dev <kasan-dev@googlegroups.com>, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sparse@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Lee Smith <Lee.Smith@arm.com>, Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Jacob Bramley <Jacob.Bramley@arm.com>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Jann Horn <jannh@google.com>, Mark Brand <markbrand@google.com>, Chintan Pandya <cpandya@codeaurora.org>, Vishwath Mohan <vishwath@google.com>

On Fri, Sep 7, 2018 at 6:06 PM, Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>
>
> On 08/29/2018 02:35 PM, Andrey Konovalov wrote:
>
>>  void kasan_poison_slab(struct page *page)
>>  {
>> +     unsigned long i;
>> +
>> +     if (IS_ENABLED(CONFIG_SLAB))
>> +             page->s_mem = reset_tag(page->s_mem);
>
> Why reinitialize here, instead of single initialization in alloc_slabmgmt()?

Hm, don't see why I did it this way, looks odd to me as well. Will fix
in v7, thanks!

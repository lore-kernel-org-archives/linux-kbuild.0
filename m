Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:37107 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756167AbeASR6q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jan 2018 12:58:46 -0500
Received: by mail-oi0-f54.google.com with SMTP id e144so1684520oib.4
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Jan 2018 09:58:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20516c34-7826-e07a-cda6-6228776ebee6@virtuozzo.com>
References: <7d2dddbb7e4d4522fcf8e57c7da072c1ac76e1b0.1516373316.git.andreyknvl@google.com>
 <20516c34-7826-e07a-cda6-6228776ebee6@virtuozzo.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 19 Jan 2018 18:58:45 +0100
Message-ID: <CAAeHK+yDWfAcdN2=THQFsfXHh2bKZ8QUDiOWKGc6weX3zpkPgw@mail.gmail.com>
Subject: Re: [PATCH] kasan: don't emit builtin calls when sanitization is off
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Jan 19, 2018 at 4:57 PM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
>
>
> On 01/19/2018 05:54 PM, Andrey Konovalov wrote:
>
>> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
>> index dbbd4382f15a..db473309f136 100644
>> --- a/scripts/Makefile.kasan
>> +++ b/scripts/Makefile.kasan
>> @@ -39,4 +39,7 @@ else
>>  endif
>>
>>  CFLAGS_KASAN += $(call cc-option, -fsanitize-address-use-after-scope)
>> +
>> +CFLAGS_KASAN_NOSANITIZE := $(call cc-option, -fno-builtin)
>> +
>
> I think it should be fine to drop cc-option here. Even ancient versions of GCC have -fno-builtin.
>

Mailed v2.

Thanks!

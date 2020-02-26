Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:44976 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgBZPpm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 10:45:42 -0500
Subject: Re: [PATCH v2] Documentation/llvm: add documentation on building w/
 Clang/LLVM
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <20200225210250.64366-1-ndesaulniers@google.com>
 <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d70e7d82-4f08-0a30-e54b-8b0f225145df@infradead.org>
Date: Wed, 26 Feb 2020 07:45:39 -0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On 2/26/20 3:30 AM, Masahiro Yamada wrote:
> Hi.
> 
> 
> On Wed, Feb 26, 2020 at 6:02 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> Added to kbuild documentation. Provides more official info on building
>> kernels with Clang and LLVM than our wiki.
>>
>> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> ---
>> Changes V1 -> V2:
>> * s/On going/ongoing/
>> * add Randy's Suggested-by
> 
> 
> I do not understand this tag update.
> 
> As far as I saw the review process,
> I do not think Randy deserves to have Suggested-by
> because he just pointed out a typo (on going -> ongoing) :

I agree.

> https://patchwork.kernel.org/patch/11401189/#23179575
> 
> (or, was there off-line activity I had missed?)


-- 
~Randy

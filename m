Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40620 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932802AbeGCHVu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jul 2018 03:21:50 -0400
Subject: Re: [PATCH v6 3/3] x86: paravirt: make native_save_fl extern inline
References: <20180621162324.36656-1-ndesaulniers@google.com>
 <20180621162324.36656-4-ndesaulniers@google.com>
 <20180622022402.GA24194@gmail.com>
 <CAKwvOdn5gnB5cK=cy6weKyxAn4SNEdZTT_MtT_D_nHRG5EDZ4g@mail.gmail.com>
 <20180626071325.GA25751@gmail.com>
 <CAKwvOdnW9r=pgmodEL0VXCv=PZVt_WMCA+B5x4D5oKRM1y-0Ow@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <21810770-ebf2-d21e-aeef-b106849bce2f@suse.com>
Date: Tue, 3 Jul 2018 09:21:30 +0200
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnW9r=pgmodEL0VXCv=PZVt_WMCA+B5x4D5oKRM1y-0Ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, Ingo Molnar <mingo@kernel.org>
Cc: mingo@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, hpa@zytor.com, linux-efi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, virtualization@lists.linux-foundation.org, Alistair Strachan <astrachan@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, sedat.dilek@gmail.com, tstellar@redhat.com, Kees Cook <keescook@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, geert@linux-m68k.org, Will Deacon <will.deacon@arm.com>, mawilcox@microsoft.com, Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>, acme@redhat.com, Philippe Ombredanne <pombredanne@nexb.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kate Stewart <kstewart@linuxfoundation.org>, boris.ostrovsky@oracle.com, "J. Kiszka" <jan.kiszka@siemens.com>, rostedt@goodmis.org, kirill.shutemov@linux.intel.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, akataria@vmware.com, brijesh.singh@amd.com, Cao jin <caoj.fnst@cn.fujitsu.com>, Greg KH <gregkh@linuxfoundation.org>, jarkko.sakkinen@linux.intel.com, Josh Poimboeuf <jpoimboe@redhat.com>, Matthias Kaehlcke <mka@chromium.org>, thomas.lendacky@amd.com, Thiebaud Weksteen <tweek@google.com>, mjg59@google.com, joe@perches.com, andrea.parri@amarulasolutions.com

On 26/06/18 18:22, Nick Desaulniers wrote:
> On Tue, Jun 26, 2018 at 3:13 AM Ingo Molnar <mingo@kernel.org> wrote:
>> Ok!
>>
>> Acked-by: Ingo Molnar <mingo@kernel.org>
>>
>> What's the planned upstreaming route for these patches/fixes?
> 
> While the fix is mainly for paravirt, 2/3 of the patches exclusively
> touch arch/x86, so I think they should go up in the x86 tree (as
> opposed to paravirt's), if you would be so kind.  hpa mentioned not
> handling merges in https://lkml.org/lkml/2018/6/14/903, so I reached
> out to you and tglx.

As there is no paravirt tree the x86 one seems to be appropriate. :-)


Juergen

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36991 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752194AbcKOWlk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Nov 2016 17:41:40 -0500
Received: by mail-wm0-f45.google.com with SMTP id t79so31661633wmt.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Nov 2016 14:41:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <70eb7a4c-be31-3fdd-a5b4-8075b29b3b38@au1.ibm.com>
References: <20160626173451.c8406cd0c7a87cc3f94d9753@gmail.com> <70eb7a4c-be31-3fdd-a5b4-8075b29b3b38@au1.ibm.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 15 Nov 2016 14:41:38 -0800
Message-ID: <CAGXu5j+8=3Vxm52Y2QbkDiCPx5X6DWemPO7B=2kj2EdVQpLHpA@mail.gmail.com>
Subject: Re: [kernel-hardening] [PATCH] powerpc/kernel: Disable the latent
 entropy plugin unconditionally
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>

On Tue, Nov 1, 2016 at 10:06 PM, Andrew Donnellan
<andrew.donnellan@au1.ibm.com> wrote:
> On 27/06/16 01:34, Emese Revfy wrote:
>>
>>
>> Reported-by: PaX Team <pageexec@freemail.hu>
>> Signed-off-by: Emese Revfy <re.emese@gmail.com>
>> ---
>>  arch/powerpc/kernel/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index 01935b8..e9ef44f 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -14,11 +14,12 @@ CFLAGS_prom_init.o      += -fPIC
>>  CFLAGS_btext.o         += -fPIC
>>  endif
>>
>> -ifdef CONFIG_FUNCTION_TRACER
>>  CFLAGS_cputable.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>>  CFLAGS_init.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>
>
> I think you meant prom_init.o...
>
> Additionally, DISABLE_LATENT_ENTROPY_PLUGIN is conditioned on
> CONFIG_PAX_LATENT_ENTROPY rather than CONFIG_GCC_PLUGIN_LATENT_ENTROPY, so
> it doesn't get exported correctly.
>
> Will submit fixes along with patches to enable plugins on powerpc once I get
> that sorted.
>
> (In future please remember to cc linuxppc-dev.)

Just checking in: did these patches materialize? I'd love to see
plugins working on v4.10 for ppc.

-Kees

-- 
Kees Cook
Nexus Security

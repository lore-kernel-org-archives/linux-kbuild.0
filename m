Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58885 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751799AbcKBFGe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 01:06:34 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uA254Xhd123892
        for <linux-kbuild@vger.kernel.org>; Wed, 2 Nov 2016 01:06:33 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
        by mx0b-001b2d01.pphosted.com with ESMTP id 26f740k8p9-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Nov 2016 01:06:33 -0400
Received: from localhost
        by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Wed, 2 Nov 2016 15:06:30 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
        by d23dlp01.au.ibm.com (Postfix) with ESMTP id 44C7A2CE805C
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Nov 2016 16:06:29 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
        by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id uA256TKr3866886
        for <linux-kbuild@vger.kernel.org>; Wed, 2 Nov 2016 16:06:29 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
        by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id uA256S09020663
        for <linux-kbuild@vger.kernel.org>; Wed, 2 Nov 2016 16:06:28 +1100
Subject: Re: [kernel-hardening] [PATCH] powerpc/kernel: Disable the latent
 entropy plugin unconditionally
References: <20160626173451.c8406cd0c7a87cc3f94d9753@gmail.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Wed, 2 Nov 2016 16:06:26 +1100
MIME-Version: 1.0
In-Reply-To: <20160626173451.c8406cd0c7a87cc3f94d9753@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <70eb7a4c-be31-3fdd-a5b4-8075b29b3b38@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel-hardening@lists.openwall.com, keescook@chromium.org
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, pageexec@freemail.hu, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>

On 27/06/16 01:34, Emese Revfy wrote:
>
> Reported-by: PaX Team <pageexec@freemail.hu>
> Signed-off-by: Emese Revfy <re.emese@gmail.com>
> ---
>  arch/powerpc/kernel/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 01935b8..e9ef44f 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -14,11 +14,12 @@ CFLAGS_prom_init.o      += -fPIC
>  CFLAGS_btext.o         += -fPIC
>  endif
>
> -ifdef CONFIG_FUNCTION_TRACER
>  CFLAGS_cputable.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  CFLAGS_init.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)

I think you meant prom_init.o...

Additionally, DISABLE_LATENT_ENTROPY_PLUGIN is conditioned on 
CONFIG_PAX_LATENT_ENTROPY rather than CONFIG_GCC_PLUGIN_LATENT_ENTROPY, 
so it doesn't get exported correctly.

Will submit fixes along with patches to enable plugins on powerpc once I 
get that sorted.

(In future please remember to cc linuxppc-dev.)

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited


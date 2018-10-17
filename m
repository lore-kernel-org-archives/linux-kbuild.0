Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39024 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbeJQKuc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 06:50:32 -0400
Subject: Re: [Lkcamp] [PATCH 2/4] Renames variable to fix shadow warning.
References: <20181017000834.GA21330@WindFlash>
From: Helen Koike <helen@koikeco.de>
Message-ID: <b17297ec-9044-d0c4-ee0e-664b53713020@koikeco.de>
Date: Tue, 16 Oct 2018 23:56:56 -0300
MIME-Version: 1.0
In-Reply-To: <20181017000834.GA21330@WindFlash>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hi Leonardo,

Thanks for the patch, just some small comments below.

Please, check previous log messages with git log
arch/x86/entry/vdso/vdso2c.h, you will see that most patches had the
prefix "x86/vdso:" in the commit message.

On 10/16/18 9:08 PM, Leonardo Brás wrote:
> Renames the char variable to avoid shadowing a variable previously
> declared on this function.
> 
> Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
> ---
>  arch/x86/entry/vdso/vdso2c.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
> index fa847a620f40..9466998d0f28 100644
> --- a/arch/x86/entry/vdso/vdso2c.h
> +++ b/arch/x86/entry/vdso/vdso2c.h
> @@ -93,11 +93,11 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
>  		int k;
>  		ELF(Sym) *sym = raw_addr + GET_LE(&symtab_hdr->sh_offset) +
>  			GET_LE(&symtab_hdr->sh_entsize) * i;
> -		const char *name = raw_addr + GET_LE(&strtab_hdr->sh_offset) +
> +		const char *name2 = raw_addr + GET_LE(&strtab_hdr->sh_offset) +
>  			GET_LE(&sym->st_name);

Could you please use a more meaningful name instead of name2 please? I
believe sym_name should be fine.

>  
>  		for (k = 0; k < NSYMS; k++) {
> -			if (!strcmp(name, required_syms[k].name)) {
> +			if (!strcmp(name2, required_syms[k].name)) {
>  				if (syms[k]) {
>  					fail("duplicate symbol %s\n",
>  					     required_syms[k].name);
> 

Regards
Helen

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34317 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbeJQMM3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 08:12:29 -0400
Subject: Re: [Lkcamp] [PATCH 4/4] Changes macro usage to avoid shadowing a
 variable.
References: <20181017000943.GA21382@WindFlash>
From: Helen Koike <helen@koikeco.de>
Message-ID: <1f8c4570-4e56-1e96-711d-78f119f8d261@koikeco.de>
Date: Wed, 17 Oct 2018 01:18:40 -0300
MIME-Version: 1.0
In-Reply-To: <20181017000943.GA21382@WindFlash>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hi Leonardo,

Thanks for the patch, just some small comments below.

On 10/16/18 9:09 PM, Leonardo Brás wrote:
> Changes the usage of DEF_FIELD_ADDR in this function to create a
> reference and operate over it using an aux variable.
> It also changes the loop logic used to find duplicates, to avoid
> creating another variable.
> 
> Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
> ---
>  scripts/mod/file2alias.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 7be43697ff84..9ea1db2aefdb 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -641,25 +641,27 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
>  	unsigned int i;
>  
>  	device_id_check(mod->name, "pnp", size, id_size, symval);
> +	DEF_FIELD_ADDR(symval, pnp_card_device_id, devs);
> +	typeof(devs) devs_last;
>  
>  	for (i = 0; i < count; i++) {
>  		unsigned int j;
> -		DEF_FIELD_ADDR(symval + i*id_size, pnp_card_device_id, devs);
> +		devs_last = devs + i * id_size;
>  
>  		for (j = 0; j < PNP_MAX_DEVICES; j++) {
> -			const char *id = (char *)(*devs)[j].id;
> -			int i2, j2;
> +			const char *id = (char *)(*devs_last)[j].id;
> +			int j2;
>  			int dup = 0;
>  
>  			if (!id[0])
>  				break;
>  
>  			/* find duplicate, already added value */
> -			for (i2 = 0; i2 < i && !dup; i2++) {
> -				DEF_FIELD_ADDR(symval + i2*id_size, pnp_card_device_id, devs);
> +			while ((devs_last -= id_size) >= devs) {

You forgot to consider the dup variable.

Also you inverted the order of this loop, I am not sure this is
important (I just took a quick look) but you need to be careful.

This is also hard to read, I would define another variant macro where
you can set any name of the variable, e.g.

#define DEF_FIELD_ADDR_VAR(m, devid, f, var) \
	typeof(((struct devid *)0)->f) *var = ((m) + OFF_##devid##_##f)

In this way you don't need to change the logic, just the name of the
variable.

>  
>  				for (j2 = 0; j2 < PNP_MAX_DEVICES; j2++) {
> -					const char *id2 = (char *)(*devs)[j2].id;
> +					const char *id2 =
> +						(char *)(*devs_last)[j2].id;
>  
>  					if (!id2[0])
>  						break;
> 

Regards,
Helen

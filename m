Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbgBCB2P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 20:28:15 -0500
Date: Mon, 3 Feb 2020 10:28:09 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 3/3] kallsyms: fix type of kallsyms_token_table[]
Message-Id: <20200203102809.7626e0bf9b83afc84c031f4c@kernel.org>
In-Reply-To: <20200202050922.12402-3-masahiroy@kernel.org>
References: <20200202050922.12402-1-masahiroy@kernel.org>
        <20200202050922.12402-3-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org

On Sun,  2 Feb 2020 14:09:22 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> kallsyms_token_table[] only contains ASCII characters. It should be
> char instead of u8.

Indeed.

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  kernel/kallsyms.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 136ce049c4ad..53f84f685841 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -44,7 +44,7 @@ __attribute__((weak, section(".rodata")));
>  extern const unsigned long kallsyms_relative_base
>  __attribute__((weak, section(".rodata")));
>  
> -extern const u8 kallsyms_token_table[] __weak;
> +extern const char kallsyms_token_table[] __weak;
>  extern const u16 kallsyms_token_index[] __weak;
>  
>  extern const unsigned int kallsyms_markers[] __weak;
> @@ -58,7 +58,8 @@ static unsigned int kallsyms_expand_symbol(unsigned int off,
>  					   char *result, size_t maxlen)
>  {
>  	int len, skipped_first = 0;
> -	const u8 *tptr, *data;
> +	const char *tptr;
> +	const u8 *data;
>  
>  	/* Get the compressed symbol length from the first symbol byte. */
>  	data = &kallsyms_names[off];
> -- 
> 2.17.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>

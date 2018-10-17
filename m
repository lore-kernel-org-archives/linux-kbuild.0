Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44270 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbeJQLA0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 07:00:26 -0400
Subject: Re: [Lkcamp] [PATCH 3/4] kbuild: Removes unnecessary shadowed local
 variable and optimize testing.
References: <20181017000912.GA21339@WindFlash>
From: Helen Koike <helen@koikeco.de>
Message-ID: <d3185020-b1aa-3eeb-b8e7-ecaefd624236@koikeco.de>
Date: Wed, 17 Oct 2018 00:06:49 -0300
MIME-Version: 1.0
In-Reply-To: <20181017000912.GA21339@WindFlash>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hi Leonardo,

On 10/16/18 9:09 PM, Leonardo Brás wrote:
>     Removes an unnecessary shadowed local variable (start).
>     Optimize test of isdigit:
>     - If isalpha returns true, isdigit will return false, so no need to test.

This patch does two different things, it should be in two separated patches.

> 
> Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
> ---
>  scripts/asn1_compiler.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
> index c146020fc783..08bb6e5fd6ad 100644
> --- a/scripts/asn1_compiler.c
> +++ b/scripts/asn1_compiler.c
> @@ -413,7 +413,7 @@ static void tokenise(char *buffer, char *end)
>  
>  			/* Handle string tokens */
>  			if (isalpha(*p)) {
> -				const char **dir, *start = p;
> +				const char **dir;
>  
>  				/* Can be a directive, type name or element
>  				 * name.  Find the end of the name.
> @@ -454,10 +454,9 @@ static void tokenise(char *buffer, char *end)
>  
>  				tokens[tix++].token_type = TOKEN_TYPE_NAME;
>  				continue;
> -			}
> +			} else if (isdigit(*p)) {
> +				/* Handle numbers */

Actually you can't do that, p is being altered in the first if statement.

>  
> -			/* Handle numbers */
> -			if (isdigit(*p)) {
>  				/* Find the end of the number */
>  				q = p + 1;
>  				while (q < nl && (isdigit(*q)))
> 

Regards
Helen

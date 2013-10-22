Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0023.hostedemail.com ([216.40.44.23]:36369 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753987Ab3JVQgi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Oct 2013 12:36:38 -0400
Message-ID: <1382459794.2041.91.camel@joe-AO722>
Subject: Re: [PATCH 2/3] Kbuild: Handle longer symbols in kallsyms.c
From: Joe Perches <joe@perches.com>
Date: Tue, 22 Oct 2013 09:36:34 -0700
In-Reply-To: <1382456783-22826-3-git-send-email-andi@firstfloor.org>
References: <1382456783-22826-1-git-send-email-andi@firstfloor.org>
	 <1382456783-22826-3-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On Tue, 2013-10-22 at 08:46 -0700, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> Also warn for too long symbols

[]

> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
[]
> @@ -27,7 +27,7 @@
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
>  #endif
>  
> -#define KSYM_NAME_LEN		128
> +#define KSYM_NAME_LEN		256

Maybe nicer to get these #defines via #include <>
to avoid getting out of sync.
 
>  struct sym_entry {
>  	unsigned long long addr;
> @@ -118,6 +118,12 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>  			fprintf(stderr, "Read error or end of file.\n");
>  		return -1;
>  	}
> +	if (strlen(str) > KSYM_NAME_LEN) {
> +		fprintf(stderr, "Symbol %s too long for kallsyms.\n"
> +                                "Please increase KSYM_NAME_LEN both in kernel and kallsyms.c",
> +			str);

Missing newline?

Also maybe nicer to show symbol length and KSYM_NAME_LEN values.



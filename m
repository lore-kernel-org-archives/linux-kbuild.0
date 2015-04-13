Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42443 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754192AbbDMNQU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 09:16:20 -0400
Message-ID: <552BC1A1.7010504@suse.cz>
Date: Mon, 13 Apr 2015 15:16:17 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCHv2 RFC 1/1] Explicit check for existing X.509 module signing
 keypair
References: <1428626238.3789.0.camel@memnix.com>
In-Reply-To: <1428626238.3789.0.camel@memnix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Abelardo Ricart III <aricart@memnix.com>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, keyrings@linux-nfs.org

Added David Howels and keyrings@linux-nfs.org to Cc

Michal

On 2015-04-10 02:37, Abelardo Ricart III wrote:
> 
> The module-signing.txt documentation states that the kernel will use an existing
> x.509 key pair for module signing should they exist in the root of the source tree.
> However, user provided signing keys are unexpectedly overwritten during build if the 
> last-modified times on the key pair are older than the "x509.genkey" target dependency.
> This fix stops this unexpected behavior, and warns if the key pair was not found.
> 
> Signed-off-by: Abelardo Ricart III <aricart@memnix.com>
> ---
> 
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 1408b33..10c8df0 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -168,7 +168,8 @@ ifndef CONFIG_MODULE_SIG_HASH
>  $(error Could not determine digest type to use from kernel config)
>  endif
>  
> -signing_key.priv signing_key.x509: x509.genkey
> +signing_key.priv signing_key.x509: | x509.genkey
> +       $(warning *** X.509 module signing key pair not found in root of source tree ***)
>         @echo "###"
>         @echo "### Now generating an X.509 key pair to be used for signing modules."
>         @echo "###"
> 


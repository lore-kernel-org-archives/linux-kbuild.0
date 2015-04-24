Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 66.63.173.11.static.quadranet.com ([66.63.173.11]:38602 "EHLO
	q1.ich-9.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1946098AbbDXXEh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Apr 2015 19:04:37 -0400
Message-ID: <1429916673.4011.0.camel@memnix.com>
Subject: Re: [PATCHv2 RFC 1/1] Explicit check for existing X.509 module
 signing keypair
From: Abelardo Ricart III <aricart@memnix.com>
Date: Fri, 24 Apr 2015 19:04:33 -0400
In-Reply-To: <552BC1A1.7010504@suse.cz>
References: <1428626238.3789.0.camel@memnix.com> <552BC1A1.7010504@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, keyrings@linux-nfs.org

What's the word on this?

On Mon, 2015-04-13 at 15:16 +0200, Michal Marek wrote:
> Added David Howels and keyrings@linux-nfs.org to Cc
> 
> Michal
> 
> On 2015-04-10 02:37, Abelardo Ricart III wrote:
> > 
> > The module-signing.txt documentation states that the kernel will use an 
> > existing
> > x.509 key pair for module signing should they exist in the root of the 
> > source tree.
> > However, user provided signing keys are unexpectedly overwritten during 
> > build if the 
> > last-modified times on the key pair are older than the "x509.genkey" target 
> > dependency.
> > This fix stops this unexpected behavior, and warns if the key pair was not 
> > found.
> > 
> > Signed-off-by: Abelardo Ricart III <aricart@memnix.com>
> > ---
> > 
> > diff --git a/kernel/Makefile b/kernel/Makefile
> > index 1408b33..10c8df0 100644
> > --- a/kernel/Makefile
> > +++ b/kernel/Makefile
> > @@ -168,7 +168,8 @@ ifndef CONFIG_MODULE_SIG_HASH
> >  $(error Could not determine digest type to use from kernel config)
> >  endif
> >  
> > -signing_key.priv signing_key.x509: x509.genkey
> > +signing_key.priv signing_key.x509: | x509.genkey
> > +       $(warning *** X.509 module signing key pair not found in root of 
> > source tree ***)
> >         @echo "###"
> >         @echo "### Now generating an X.509 key pair to be used for signing 
> > modules."
> >         @echo "###"
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

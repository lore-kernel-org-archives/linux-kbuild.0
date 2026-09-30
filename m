Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A1D3E1D17;
	Wed, 30 Sep 2026 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761732; cv=none; b=EkAfhH48KCLFrjdG3V5RSxZlTmc4gFz7hC0EFf4SM/FPe1Gd5Y/aZG8u7GGy1b2ANQCtkAX0DHv7pgZaDJuONBsFaQoqnOOh1if7G0L4tE5kFxhTPfqnOzK+eXcYpZ75AxnOqa7JpjxtUUo07IPgkqCKM/g7xxBrHI/UR3yGPMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761732; c=relaxed/simple;
	bh=c1pWf5KazEdiAa4Ea9cIOs55m+7sgqCivQnFS70WSzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/tixEpX+Wx6eN6wdb/EJzJesUtGzbNtVidFkNMKRpGHlPCm1RSaA3Tz2mtO7+ZyKK1vCw2iS8cfDFuNQjePcpIyK6SVUxkg+bexHKij3ep+QSnxThEf2TFlq/+UGM4iqR1OuN/+wdLA5/dB39unQSHI9EUPPJ+J6QKCNGaqkdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SlrBsAqQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SlrBsAqQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qf3VAn39dgRaRdsnEtqKy7usItPghgcMfYhUb8awYLI=; b=SlrBsAqQWwyEqJOj8k57wrfsmE
	W/az/jxjJOKA1vAbNvgun8uxZRuN+Oa3yhPaIfoIW3iJi9RoIIYK5WS6XPmel+xyXt7pjV6Sdg0jk
	9HX+r0QmhC6HQrFuH9G97M8+YtFN3X1dUgc6noQ3BWoMUpZMAumAxeFZ96s5t+lplEPja/WYyfgLg
	ZA870BoToTSNFBAxgGkyDthoCI+ZrmemGR3KzCynra+htMcCcPnJcOyPxiX8LR6RLacHxVB4Xo5FE
	lcztF8oJnJvQtxrSja6sZVc5hgsW62om7FsWmpqqUQKQo6gO900twJSZGlVOwsbLGAQ+MsZ/IvDBn
	SjjdB/5w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqvS-0000000C2Wb-3R8f;
	Wed, 30 Sep 2026 09:48:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 370D8300673; Wed, 30 Sep 2026 11:48:34 +0200 (CEST)
Date: Wed, 30 Sep 2026 11:48:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sv@linux.ibm.com,
	alexandre.chartre@oracle.com, alexghiti@rivosinc.com,
	aliceryhl@google.com, ardb@kernel.org, bp@alien8.de,
	chleroy@kernel.org, elver@google.com, ihor.solodrai@linux.dev,
	jpoimboe@kernel.org, kees@kernel.org, legion@kernel.org,
	lossin@kernel.org, maddy@linux.ibm.com, masahiroy@kernel.org,
	mpe@ellerman.id.au, nathan@kernel.org, npiggin@gmail.com,
	nsc@kernel.org, ojeda@kernel.org, pmladek@suse.com,
	rostedt@goodmis.org, tamird@kernel.org,
	thomas.weissschuh@linutronix.de, thuth@redhat.com,
	yuxuan.zuo@outlook.com, sourabhjain@linux.ibm.com
Subject: Re: [PATCH v2 2/6] objtool: Set ELF_F_LAYOUT flag to preserve
 vmlinux segment layout
Message-ID: <20260930094834.GK88198@noisy.programming.kicks-ass.net>
References: <20260929055138.43489-1-shivangu@linux.ibm.com>
 <20260929055138.43489-3-shivangu@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929055138.43489-3-shivangu@linux.ibm.com>

On Tue, Sep 29, 2026 at 11:21:33AM +0530, Shivang Upadhyay wrote:
> From: Sathvika Vasireddy <sv@linux.ibm.com>
> 
> When objtool writes changes back to vmlinux with --ftr-fixup --link,
> libelf recalculates the file layout and inserts padding between
> sections. This corrupts the ELF segment structure, causing kexec to
> fail with:
> 
>     ELF Note corrupted !
>     Cannot determine the file type of vmlinux
> 
> This happens because libelf's default behavior assumes it can freely
> rearrange section offsets when writing, which breaks the carefully
> constructed vmlinux layout produced by the linker.
> 
> Set ELF_F_LAYOUT after elf_begin() to instruct libelf that the
> application is responsible for the file layout. This prevents libelf
> from inserting padding or repositioning sections while still allowing
> data modifications to be written back.
> 
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
> ---
>  tools/objtool/elf.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
> index a791f4ea6ec1..55c20a993f5d 100644
> --- a/tools/objtool/elf.c
> +++ b/tools/objtool/elf.c
> @@ -1239,6 +1239,9 @@ struct elf *elf_open_read(const char *name, int flags)
>  		goto err;
>  	}
>  
> +	if (opts.ftr_fixup)
> +		elf_flagelf(elf->elf, ELF_C_SET, ELF_F_LAYOUT);

So per the previous email; you need this because this is a post-link
pass. As such, anything that has absolute sections would need this. So
should this be conditional on that, rather than ftr?

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78432E729;
	Tue, 10 Feb 2026 21:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770758413; cv=none; b=D1KzPnzRygb32d5soyncsKPcnZwOoiAYxF/8+OZXGcjvbn2N/nk1Z4vuMvJlhs02M8jcGk4TPvoeyXXN8QLd3YF2wKzXkwBnYbRQRFLwDuN21QP8X/xZqZZ6xEXEp8K7VEZ7l6rSLann0tKUhA3f97N6uMF4qYxNhxy6KayGH+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770758413; c=relaxed/simple;
	bh=0bpA5wvvJckbZhDqQnp7IZzgogiw3mVzH8eI7Up3uuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVvzGVPAkETEc70iKJ4u0WdlKo/cwg3XBlfnIOskVaoep6Jg6MVQhHB6H3YT+iUPi/g8PrjQOOSYsQyWYN03gYhROdn4vdQuq1O86qslvKeOZg+mvXrkiisCX47EfRW59j4FGpxRr2yKXyao/Euwc1qYwyUiTHkA8XH5JVrjOKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBuuKgGy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBuuKgGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAE8C116C6;
	Tue, 10 Feb 2026 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770758413;
	bh=0bpA5wvvJckbZhDqQnp7IZzgogiw3mVzH8eI7Up3uuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBuuKgGySempnJ7d5N/SbfM1cX3JZ5cQPXT3/T9MvLDMRq6+ZBqPfpyKCHut3usbO
	 ziYE/CIT/mG39+RVOUlNBOPiXqrPtfy3ZGEa9RZE40lsxsfaub8jQKp/5aML6Ou/+a
	 QckbFDJxMY3G9BW5Y9d0OMPjou8SC0MvF1SPLTE58G9ht3WpRs2O5glbFqs9T9f2ql
	 TdIdouM/m5MW4Uou5JDcZgu2L0nPRy4nmDDoZXH1lAAs/wp7LObWZyQcFQSG0PSufd
	 ulXFuFboSEjIGD2qrSRHDd1Js2XEHY6Xjlc1kFPYh4pyd/1DNqXhG3f+qHGpr9qE1U
	 uZqeU7ZEUC+WQ==
Date: Tue, 10 Feb 2026 14:20:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org,
	kees@kernel.org, naveen@kernel.org, jpoimboe@kernel.org,
	peterz@infradead.org, npiggin@gmail.com, maddy@linux.ibm.com,
	segher@kernel.crashing.org, christophe.leroy@csgroup.eu,
	mingo@kernel.org, mpe@ellerman.id.au, nsc@kernel.org
Subject: Re: [RFC PATCH v3 6/6] powerpc: Enable build-time feature fixup
 processing by default
Message-ID: <20260210212007.GA1148627@ax162>
References: <20260209084820.57298-1-sv@linux.ibm.com>
 <20260209084820.57298-7-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209084820.57298-7-sv@linux.ibm.com>

On Mon, Feb 09, 2026 at 02:18:20PM +0530, Sathvika Vasireddy wrote:
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index e3dd7fc62f20..3d2a203b8908 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -88,6 +88,11 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
>  # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7
>  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
>  
> +# --emit-relocs produces .rela.* sections needed by objtool --ftr-fixup;
> +# strip them from vmlinux after fixup processing is complete.
> +remove-section-$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)    += '.rel*' '!.rel*.dyn'
> +remove-section-$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)    += '.rel.*'

Rather than duplicating the remove-section values from
CONFIG_ARCH_VMLINUX_NEEDS_RELOCS, I would like to see them combined with
something like:

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index fcae1e432d9a..f70c3a36aee2 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -81,11 +81,15 @@ endif
 # vmlinux
 # ---------------------------------------------------------------------------
 
+# These configurations require vmlinux.unstripped to be linked with
+# '--emit-relocs', which need to be stripped from the final vmlinux.
+uses-emit-relocs := $(or $(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP))
+
 remove-section-y                                   := .modinfo
-remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
+remove-section-$(uses-emit-relocs)                 += '.rel*' '!.rel*.dyn'
 # for compatibility with binutils < 2.32
 # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7
-remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
+remove-section-$(uses-emit-relocs)                 += '.rel.*'
 
 remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
 

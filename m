Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3436E5038EF;
	Fri, 18 Sep 2026 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751385; cv=none; b=TblolqveTsYjZ5q7n7+wFnq0kn0Qpolnf2KLdDZtpgDoMyOpVP02sxJUB4YiC0HcinChOppwdPT/HtnaqkDAugprmxYZqrqbQW/CO4M5s/c+TjDHxgyLAUUkiFlRfeWF1HNRxIrzg8lN7hYD3gHjVWFkrT2jIr6q1FT6motbzV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751385; c=relaxed/simple;
	bh=cLlatevR+/SpRjJpDb9SSz0QigrGJ3OmsCk/osE+jMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7EBsPkKhoY5BWmO2qCYs7RmMtVpLfkpKFbNyyX3m97dTBESW8O2zuLDCvkmTMgjID0rZwZoUxfO9nB5BmaiuFfMEy6A3vYhanhmq6tEs+wzALJJ+4ZIFCKhcir/Eo+/xLjRotWihm8HbaiveN/UhpjdJEljDGAfYvI/xYHXXag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=nt2xHkiX; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="nt2xHkiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789751372; bh=cLlatevR+/SpRjJpDb9SSz0QigrGJ3OmsCk/osE+jMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nt2xHkiX/Ivaa2a+J4pTXwLgoBIwAZSYZ9S/dyt1m++16Ab4a25kdVEaRATjnrk3y
	 Ugde1oRP8ijDf79Kc8uVzmOedn5J3EWg3Xxes9PolFlaSR8dLMe3ZTovEStQr93WmK
	 YRA0UEmUqx4Rz3kzchxSJIUbrvKiAZw7FG0fxAgtQR6pqWY9oHrWKIhiFEr8Pbw5Bb
	 alxFROBXzio1dRHfv/so4mqlh9TaGWHxjDxF+bH1EsDSJ8XygtFUpeLSXhPFfQZ33e
	 iLCShwc9E6vB1HT1NaeVz2T/aeyRCyghsHCcNor7e4QIvMj2uWslhIOtjOHBIbwtaM
	 Q8nf4PgmrezQg==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aad704c-03cd-7f0000032729-7f000001ba02-1
	for <multiple-recipients>; Fri, 18 Sep 2026 19:09:32 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 18 Sep 2026 19:09:32 +0200 (CEST)
Date: Fri, 18 Sep 2026 19:09:30 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 01/20] kbuild: do not allocate .modinfo in vmlinux
Message-ID: <20260918-meek-spectral-nightingale-53d88d@l-nschier-aarch64>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-1-9ecf4163ff36@kernel.org>
 <202609170950.480F90A28@keescook>
 <20260918005142.GA1585590@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918005142.GA1585590@ax162>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789751372-64FF7EE1-36D82441/0/0
X-purgate-type: clean
X-purgate-size: 2436
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 4B2F3A02B9  external: no

On Thu, Sep 17, 2026 at 05:51:42PM -0700, Nathan Chancellor wrote:
[...]
> 
> From 008046b33ef4b476048e3ddb2c679a453254e535 Mon Sep 17 00:00:00 2001
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Thu, 17 Sep 2026 17:29:53 -0700
> Subject: [PATCH] kbuild: Remove alignment on .modinfo section
> 
> Commit d50f21091358 ("kbuild: align modinfo section for Secureboot
> Authenticode EDK2 compat") aligned .modinfo because it appeared in the
> x86_64 compressed kernel image after commit 3e86e4d74c04 ("kbuild: keep
> .modinfo section in vmlinux.unstripped"), breaking boot.
> 
> Commit 8678591b4746 ("kbuild: Split .modinfo out from ELF_DETAILS")
> properly addresses .modinfo appearing in unexpected contexts like
> compressed images by moving it out of ELF_DETAILS and explicitly
> specifying its location in every architecture's vmlinux linker script or
> discarding it where it may appear elsewhere.
> 
> Effectively revert commit d50f21091358 ("kbuild: align modinfo section
> for Secureboot Authenticode EDK2 compat") and its follow up fix,
> commit a26a6c93edfe ("kbuild: Strip trailing padding bytes from
> modules.builtin.modinfo"), as they are no longer necessary in the
> current tree. This simplifies future cleanups.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

[...]
> 
> Then this patch becomes much more obvious (at least to me)
> 

Yes, thanks.  Looks good to me and I think it's a good idea to apply 
that patch first.

for Nathans patch:  Reviewed-by: Nicolas Schier <n.schier@fritz.com>


[ Lorenzo's patch, updated by Nathan ]
[...]
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 6833b517cacb..95b523fe4f9e 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux

[...]
> @@ -103,10 +100,7 @@ vmlinux: vmlinux.unstripped FORCE
>  # ---------------------------------------------------------------------------
>  
>  quiet_cmd_modules_builtin_modinfo = GEN     $@
> -      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> -                                    chmod -x $@
> -
> -OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> +      cmd_modules_builtin_modinfo = $(OBJCOPY) -O binary -j .modinfo --dump-section .modinfo=$@ $< /dev/null

By shifting from "$(cmd_objcopy)" to "$(OBJCOPY) + args", 
$(OBJCOPYFLAGS) is dropped.  It this by intention?

Kind regards,
Nicolas

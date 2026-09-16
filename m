Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F036A374;
	Wed, 16 Sep 2026 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571355; cv=none; b=JDeiiWe8CeuZa0mD4V9MuUXbtpaaX6zkNkAwa6lbVvi/Zt8yLyNENR7l61LES1NsINotGYLkfn4G4wBflOmGdZ7Xm/nktggAgqPz0Z4Pj4FaqWqJaZ1kDaxZCpl6s+R7/a1fVTN0pADLvIX774iTvy9P5GWXE6tR83Lzpse0Ghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571355; c=relaxed/simple;
	bh=jXIEwZc8L43FA4LhXwVn3sl3ROh0Hjg2OQThG0axdew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfWehC1mHPFjnFY2ZWnKFGyXAQb60mGkFx4Q6zRpFsLjc552ElMfNU0iqg5zfJICLnY/cqgiD9cUeY5CM/L1zbbGKW5+GbOBhxKBXS0h340mHBPzkvPdglWZytwY9tBa0GZwg/e5yERdEkhZMxbo26QWlIS7c2inlugKmyehm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ/YnETS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQ/YnETS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE5E1F00893;
	Wed, 16 Sep 2026 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789571354;
	bh=xoF4dYmQzIJXq0fSxJUTUy/UPdSdLpwkj7dn41ZSZiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RQ/YnETSWlVD8/z+hju38CT8whqZSAySeU8JxURT5snABOURQzZQAxqwbS+i9BUQ9
	 4/G7s8NPFQYpnRyOkzbt9iyQUi6rKt2PQt6HMSvDTDkkWfMRAuCcZWplS/Rn7PRtP1
	 34XnNw07IRIMJb53SQrHPiBMQopz2XyZndz9sNvlLKdktAdiO02vZlEuDzR7MWsTNl
	 +Ps4NHcT/O1pPHiDyd+0YSKVlwC9tppz9EZgvoL2RS/m44JnfpQ0Lrpq1CiV6VmXJI
	 0ZHdDN9voRpOIWMxMlWZAnSIV7ZHMw8w4VQ+f8luDO+maSgAwmHkaJt7m+CyWhgJbZ
	 4biSv1uFrX9wQ==
Date: Wed, 16 Sep 2026 08:09:14 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
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
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <202609160805.0DE45DB@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
 <aqqqZfa8Q4D5dBt5@gremlin>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqqZfa8Q4D5dBt5@gremlin>

On Wed, Sep 16, 2026 at 04:03:39PM +0100, Lorenzo Stoakes (ARM) wrote:
> This is clearly the way forward, will do that in v3, thanks! :)

Great! I'm really excited to see this (and the other stuff in this
series) land; I spend _so_ much time waiting on builds. :P

> [Oh and on precedent, it seems the arm64 FIT image builder,
>  scripts/make_fit.py, uses pigz already if available :>)]

Oh nice find!

-- 
Kees Cook

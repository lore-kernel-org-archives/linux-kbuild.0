Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514934;
	b=U2YoIwVLkhF3fbfvtG3iB5Z/pegnOXYknRWcu21PshJpaw7/t9s1w1KJVe/FpNV3F4j8
	 pYt/GSk0vhVjmWMuImhfoqi1Mrwtu637Mb+2wvzjM/6wElSVrb8HNXVHy5ThgJc0t0cyz
	 +a3xGYrWItbU1eBe8EbeGj8n5Vxujxna1rLIjvuoCBtA7l5JwK4kcOVZCpv/TMgKSOUbY
	 UPXXbgXACj78eQPOw+uSRmjvh97l5HxQ8ARjNNlvydaR17VJU/lEiTPbCGtO2QBNPqeMY
	 8F8m0BihJEr+YcyOb9K25TIclJ6ow4yo/HPW6bgoQRf9kULIYCiNtOmoj7O8dG8JfWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514934;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ffNri5wPyaoWDuKhZ9FxbDlSlTSKcXafOoFdLA+gTVM=;
	b=lVDbDeUfLMT/W6xuRkv9cMEHjnOGFrR1cgzdt9MtW/PuBHn9q4LwsFsuhNXVL+uai5AK
	 YYzmbhYDvMf2i/yYOL0V8jZDMvjJYxJCDOv0uBHeInPwTRUEidK/u6HGfHi3RDG9Y+By9
	 F720KIqpCoku25yYCZ4p3+R+bhr6RtU3xETesQAJkk9a1mvD25lpU7efU89PJ8Ge6CDoA
	 dGyVrmvebPnDJ1NkZYyY68IMZ2shrYi4GGGaWQ3WLQjesuyBKqxLuPvw/NEqcolb/+xvS
	 kjQnSA4WMXhOV9sUfL0QoqlMtsm9FKZFwgzAcJI5bvPetnK7CgQo744uU0BmFkIygGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2HtaYb0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9DDD4606A31C;
	Thu, 12 Nov 2026 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2HtaYb0
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 059E11F000C4;
	Thu, 12 Nov 2026 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794514934;
	bh=ffNri5wPyaoWDuKhZ9FxbDlSlTSKcXafOoFdLA+gTVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2HtaYb0RYo+2Rg0DlGRfceiiYpMWFEDJHtWMm5QL9V+DTGJARH/Jgy5SKuV1YIBa
	 RR4GVmiYY0f4uZ3zWXbMs7xNNIwEXAm6Ko14uFv15kWrsUACnjrRsE7TbsnzgB2L87
	 mCBtFGGdWpEJgXxIoZ1Yu44Nt5cQt0vJ2Fh8MuaJLd/UrGcaFl6Hu1CW1JsgzFvl+p
	 Nno54RXQHwEzyGAjV8vm0jvCSXbgtkwr5OEvfr7k2xaNc7z1qhqTVkd5I/6ySD3Wee
	 Xf2WIYLqiBBtDAlXGM+uQ8YaXE4mTqOXvcZsrgmymUQvsiNU4tGELxr7S3XHCEYEuX
	 mzU6gudkDNWDQ==
Date: Thu, 12 Nov 2026 21:12:16 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
Message-ID: <avYdoI-g8YPwNwUG@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-5-b2d9415c1757@kernel.org>
 <avWkWm1N5rv52GG4@levanger>
 <20261112174753.GC4107043@ax162>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112174753.GC4107043@ax162>

On Thu, Nov 12, 2026 at 10:47:53AM -0700, Nathan Chancellor wrote:
> On Thu, Nov 12, 2026 at 12:34:50PM +0100, Nicolas Schier wrote:
> > On Wed, Nov 11, 2026 at 05:52:07PM -0700, Nathan Chancellor wrote:
> > > -config CC_HAS_ASM_GOTO_TIED_OUTPUT
> > > -	depends on CC_HAS_ASM_GOTO_OUTPUT
> > > -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
> > > -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
> > 
> > The comments reads as if gcc 8 to 10 are affected.  Is the comment
> > somehow misleading, or should we still keep this until gcc-10 is the
> > minimum gcc version?
> 
> It is a little misleading. GCC 11 was the first version that supported
> asm goto with outputs, so this program will not compile with GCC 8 to 10
> as a result:
> 
>   <stdin>: In function 'foo':
>   <stdin>:1:51: error: expected ':' before string constant
> 
> The bug that it is trying to trigger was fixed during the GCC 11
> development cycle between the initial asm goto with outputs commit and
> the final release. As a result, for GCC, if it supports asm goto with
> outputs, it supports tied outputs in the expected manner.
> 
> This test was mostly to catch buggy versions of clang, as asm goto with
> outputs was first shipped in clang-11 but using tied outputs breaks the
> build until they were fixed to be compatible with GCC in clang-14:
> 
>   <stdin>:1:29: error: invalid operand in inline asm: '.long (${1:l}) - .'
>   int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }
>                               ^
>   <stdin>:1:29: error: unknown token in expression in '.long' directive
>   <inline asm>:1:9: note: instantiated into assembly here
>           .long () - .
>                  ^
>   2 errors generated.
> 
> So if the compiler results in CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y, we know
> that CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y will be present as well.

ah ok, thanks for clarification!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

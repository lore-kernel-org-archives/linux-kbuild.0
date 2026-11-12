Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505680;
	b=2Xjy8Fog0UNcWjkLzZ8gClBRysymPT3BKtB5h6M0cDXdESUFrjMzegYBpqnik9ii6wGk
	 xUPivDwGn0x+s0FWECn4JO5hrQxJiWpFLOj2si29aaXv6BEZr8AOvRykx3YjTJFgVXNIc
	 E8Upgk9aXqqzhloKM1T+Nu/YBK0PgMpKLJ/ZSJlr3nDd/ugeMT4k83jWKEkh8p7LDOJP7
	 o5R5XMNY8DKzb36ZWTQh53plAat/6oEg8fmQAiUE4q0v5AyPqwMRpJiNps07LlW+zvDnC
	 Km/3rdzlyn7eVUkLq0GmXgUUeDWRkxHmvVuZAoQEHCO+IGSdBSOkKeTrkDfgjfDORyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505680;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zaOiQXaj6cqdaLfvFVkz/GzQHYgpVXTXcmV319+t8cI=;
	b=1C8iDAOxxPboA4Q7M6/hRXL6XQwbtGkueLSSv7IdDj+Tz0fx3ERR7D2xPea6LGmym8Jp
	 PT81y2JD60p2qUyj7oMOL23GxboHQFK5Gt0Hz9k6dwUHBNtBxpjR27GM2VaX8xAxd2k0E
	 HVRyYTmiC3r/lMBiePvc06vgjZgSW9vyW65v47VbwkUnKqAYxBsrCrNXMELGpeBP8QldL
	 caGrX4bV8ZSbepkE3VBdYjwFdCCbgPmV7vPoZMrRx9jeQiHPfIvs3N5mh9hsuiRECDBcH
	 0DC3WRi8uOWhnp9b49cDuwPBndBeZx9VXttAbhyjXbdhPZr0XikR5We63e2gDy5zhcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAXT8BCQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8780E606A321;
	Thu, 12 Nov 2026 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAXT8BCQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E631F000C4;
	Thu, 12 Nov 2026 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505680;
	bh=zaOiQXaj6cqdaLfvFVkz/GzQHYgpVXTXcmV319+t8cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAXT8BCQGA0v1Y1k8ymmF1rs8DPDUlmUSugJ0yuskL5i+CZXcn3Slwf0Lukko3L1v
	 cHr5vmYmUszoaX3cexipeI91nWId6S4XC2HROr+kQibp128sYRTtNpCpwRpvySo+TP
	 TAYWL2VLQyUmSBGjBQ01qn9TPkni/n+smsz3H6E/Vww7bopXYJFnxpmc8SZ1T91sWr
	 +zLZ0r76GW8HJmqAEnFf3EJU8s0zykr6Iim6AlveagpPipZ44ndU9Zxb9kHqata28N
	 yGMghD6Bj/2nOthHKbco/k49feZEDgLDBdKADDboN7SXjmXb96pnCXdAMNUBRwb3lM
	 s6xeiboXrSSMg==
Date: Thu, 12 Nov 2026 10:47:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
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
Message-ID: <20261112174753.GC4107043@ax162>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-5-b2d9415c1757@kernel.org>
 <avWkWm1N5rv52GG4@levanger>
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
In-Reply-To: <avWkWm1N5rv52GG4@levanger>

On Thu, Nov 12, 2026 at 12:34:50PM +0100, Nicolas Schier wrote:
> On Wed, Nov 11, 2026 at 05:52:07PM -0700, Nathan Chancellor wrote:
> > -config CC_HAS_ASM_GOTO_TIED_OUTPUT
> > -	depends on CC_HAS_ASM_GOTO_OUTPUT
> > -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
> > -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
> 
> The comments reads as if gcc 8 to 10 are affected.  Is the comment
> somehow misleading, or should we still keep this until gcc-10 is the
> minimum gcc version?

It is a little misleading. GCC 11 was the first version that supported
asm goto with outputs, so this program will not compile with GCC 8 to 10
as a result:

  <stdin>: In function 'foo':
  <stdin>:1:51: error: expected ':' before string constant

The bug that it is trying to trigger was fixed during the GCC 11
development cycle between the initial asm goto with outputs commit and
the final release. As a result, for GCC, if it supports asm goto with
outputs, it supports tied outputs in the expected manner.

This test was mostly to catch buggy versions of clang, as asm goto with
outputs was first shipped in clang-11 but using tied outputs breaks the
build until they were fixed to be compatible with GCC in clang-14:

  <stdin>:1:29: error: invalid operand in inline asm: '.long (${1:l}) - .'
  int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }
                              ^
  <stdin>:1:29: error: unknown token in expression in '.long' directive
  <inline asm>:1:9: note: instantiated into assembly here
          .long () - .
                 ^
  2 errors generated.

So if the compiler results in CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y, we know
that CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y will be present as well.

-- 
Cheers,
Nathan

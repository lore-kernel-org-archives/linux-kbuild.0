Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483773;
	b=p+m66sCT9r/8T0C6zhSDAzOX52o8cZY30yEZwga++kC7X+bG2xnF2CCrcLTzyyVal/MH
	 zNWeHTm0pkM02tarsrOwCnLRTVGNEONZlR2mJKTivedz0ZGMD9e9D+H5KaRS5oFPLnrlV
	 /KZ2I3DcM68y7Z6f++yX5au3Mi1/1SjNud9zvmIlMClBvuuXueHJgALLXZ05CMf2nsjcD
	 lIbVuaax9h/SH47nMH1suUnkCh6NStBUHj1hQUHNSZP0pdeRx7+d0zpth8yc6ZNHVvDZK
	 RHH7OWuPWThCrRaWNeii5PtXsXma6972hACB9lY1BBl2W5cAnyIAfwjAjKSEzhwJCmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483773;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yBDSrz0rU0DnRkMjKw+YlslHT/Bdl8TFcwbvYkOH9kc=;
	b=0yh7z+IlgSuhQdAUnjgqto7q2eskkJEjA1flz9ke6cvVclOcfMUxxhQ/Hi/JDBYUDVRE
	 6CdUX4rNxnRqmVBqT9JsZWXUBj3ZA+NSss1VFjNmvs75rj3n4NrpaI3QouvNEQi7qxkoB
	 PLy+Bb6wXdY/up3h4wU7YuG7+XeH/+bawHyJcqltkkNMla9pwLfJa73FRwjjoB1nv5GVj
	 ABkUncb/9t3p6b5mrXd7WPZ8j8TsBJUwfJK4O3nonwofc/iECPj/Kgz+aZz5Hy8Ie6IU2
	 iBHE5dL8cXl/KfH59jDk4HCQwwl0tCqSWAmJI+biO1/JmbLAoER/WjHQavEbVgAdJNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SIijVHf/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 2942F606A8A8;
	Thu, 12 Nov 2026 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIijVHf/
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 43F8A1F00A07;
	Thu, 12 Nov 2026 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483772;
	bh=yBDSrz0rU0DnRkMjKw+YlslHT/Bdl8TFcwbvYkOH9kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SIijVHf/6S9PX5Y0aCOMGOz2Vl6lijH5dTGNQgaiJkvoVxp2rXOIUpvBdcuMLMEpc
	 vc6pOfDpl3mtDzLjIkcPL9fMNUaboYnSQp0ZZriyAt7VMYr+pLp/sc6UWy19CD5loR
	 5b/OvSc1hJ9LIij+KM7rROKyTFblQsPgWMNjUfMMmJbcAgZwSF8C4+X756fVlrfmJP
	 L4lbmWhMUPoHDas/afVpjdZ2OohiQn1d56TP7UjHRFlaWUTzyunPsqF21Ecava8BnG
	 UFZCozyja/o025Qt2sAGxqd6MDBygofYwzlUSZdzDDrnvysMM/eg+WuCxR4u3SfPYb
	 ep+C4q2/gYBgA==
Date: Thu, 12 Nov 2026 12:34:50 +0100
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
Message-ID: <avWkWm1N5rv52GG4@levanger>
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
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-5-b2d9415c1757@kernel.org>

On Wed, Nov 11, 2026 at 05:52:07PM -0700, Nathan Chancellor wrote:
> Commit 1aa0e8b144b6 ("Kconfig: Add option for asm goto w/ tied outputs
> to workaround clang-13 bug") added CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT to
> avoid a bug in clang's asm goto with outputs support when a tied output
> was used. The fix in clang was to match GCC's documented behavior.
> 
> Now that the minimum supported version of clang has long been bumped
> past the version where the fix landed (clang-14), any compiler that
> satisfies the dependencies of CONFIG_CC_HAS_ASM_GOTO_OUTPUT will support
> tied outputs properly. Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT in
> favor of just checking for CONFIG_CC_HAS_ASM_GOTO_OUTPUT directly.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

[...]
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 6520a06a9103..9454ef5294d5 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -120,11 +120,6 @@ config CC_HAS_ASM_GOTO_OUTPUT
>  	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
>  	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
>  
> -config CC_HAS_ASM_GOTO_TIED_OUTPUT
> -	depends on CC_HAS_ASM_GOTO_OUTPUT
> -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
> -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)

The comments reads as if gcc 8 to 10 are affected.  Is the comment
somehow misleading, or should we still keep this until gcc-10 is the
minimum gcc version?

-- 
Nicolas

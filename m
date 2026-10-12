Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698A48C8CE;
	Mon, 12 Oct 2026 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816766; cv=none; b=YlkfKJ3KlsAG0OE1ARV6HRcxATm79MGVMqEa/NBapFe2UCd6TNCnANo77dZJYNV3XLchdyTwH2/PgNrCFtAG/bLst3Rnn08d14S0l7Pk7hJ8ie41xVsaMMHcthkcGjBEkY1f6gtqA1BOJT5I7VjHitUTJP+a/Nxy4/GCQPWPGB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816766; c=relaxed/simple;
	bh=IleSOSNkSFAO9MhUZ0KKM8eTKL6/bDq63SCpXAlXqmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsbtMU04p/60uL3YV6D89atWz+n/9dCfp+bidPqb+LVXnkU4Cjf23wPMGC6fmEiv8H6Pe4AVUWB2Kjwt9I5oFWUDfypBEFFuTnWPOAxRRpnxw/4oNmg9Xyx7hm+QSwiBS+8sggtu84cwIkp3K4JPzBxzHPhyikXCYdxY2NTSvKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSVxTkFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSVxTkFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8961F0089B;
	Mon, 12 Oct 2026 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791816763;
	bh=++9/kUt44kAUgHENKZc+rwCY2UCiq7Jqb/ANO3lupso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HSVxTkFOyak1+9V3vwKcDUyTRL1TKOR617BBD8k5GFmRXY+TbCZrIU+72FXhnuFlc
	 OzOIGB3eJ8iXNIR1orYDS5BLsHZMDEz01fl3XfwJ+XxzzIs3SlHhRO2bLMCW4dDNyE
	 T3vPWLdgPHJ4yVOM4kSKbk0E1WMSp27xEXTmWG0YPZ2hFLT+mb/71fsQXEYtkLq/JK
	 ovEBAqdL/0Ty7MSeD6IB7R1lua5FOS0LabXl1bv50OGhvAJNU/Ptj9OLBJw2vD4x0Q
	 3E2TeSySXmAOSwX1ym4XwoH1VRRnX+u/7sY5DZ8tv0QmaiAM6jif46suGU3nSamhda
	 dEZIojbrENgWw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D52F4F40068;
	Mon, 12 Oct 2026 10:52:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 12 Oct 2026 10:52:41 -0400
X-ME-Sender: <xms:OfTMajBWKskVBuGg79BTiDfE7EbczDnyxJiPMhj__eBi9N6oN2C-0w>
    <xme:OfTMarY6pCcWT5d1adHw3hN7BLdRNONuIww05zLVlfQmuRwLtHO1C4cru9gLHUc8b
    go74c9GnBj0aicJFbZF6apU_VT5ZTNM88LwfAu_4apauS4LaENlTdU>
X-ME-Received: <xmr:OfTMajPANGzigbKa33CraD4qUnpWrnXG6E8qAgOlFXwB6K8Wd-SwW8E21TJgSBM-TWEd7PpQOnJ_wuEEpoHeLUiYklj28e_z>
X-ME-Proxy-Cause: dmFkZTGQjzbzJkrc7kB2sAZm2TSI5woc2yhK2Xfz2IIuCAGi5DSZcyK1DRZSIf/kmJRhhF
    J2uW2YGXri8vW6rG7Ahqs0OIrtoJQYhzqRJkGnMdavN0NUTCtc21sPb9qIqMyYQVnfTfgZ
    /bXcuUzlHJ0U6IsSizwDu64O66SV/yBX8Cy898G2rViBgiC+1W0BD80G8TuwFhqvSpahI4
    HJEfkX2GBHV0zJ5Rie2gekpZbMHCpoXfExf+WnnkUDPfjymgZXxx9KXofcUY8nOr3WcCDi
    +tWKpA9ZVoP+hOKoMRd8eByv4BFox3nlIroHd5V1iaWXVSzCRd2yO7ub+gsD4mSAKElHr7
    ARJ7mZM0TcpHoLP8JpljAn28/sHET6vNolUrvFmf4NPRgXRvEFvC7Gp3Vn1sCFUv+4JMIf
    ZJQ3zaPJRZHS1EsvqM6bAX/x38hKdOQAUfPZ7DkH6LZ6ekY+LsT+JJMCM8JqGV8UyJGcOI
    EXWBzC5saSoFhyLMuZpPcCnikMr7hhjXFX+jYmbyFQW/qxYJhXucD1yQKmBLq1lkfkfcCC
    bYMs8fEaxNQDVLsq0qAvzB4UaXLWa6Tc7hrvLZiFxdUsgM/2M9YG1QHTXhiQqos2oRiiSk
    o6To78wEf+rhFVuJB0+SXCun/YWLPmrUeHDpI0rTO2h8/DPErNIF3lRmb6eQ
X-ME-Proxy: <xmx:OfTMakTwkHOHjoTmqOy8ONA9OkX9jien3EuoRiHvFR_ra6GimNMd6A>
    <xmx:OfTMaoTaz9TpyOPVskP2VIWl8U9qmTHTlzWZ8KTu-uW67ht9lsekoA>
    <xmx:OfTMalBDf6NrYowKVLnrh-c1Mc7d1yos6bEW3IrJAaZCYAg9_jKBOA>
    <xmx:OfTMaiAeyp-M2tDkHAQw9VS7MG90baQijArva_mpQXP6CTCv7e48dg>
    <xmx:OfTMamzMkMHHdl8okQfas7YL9YFrnuxxtQhqrLrsiSWBUED9XOeVGtdn>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Oct 2026 10:52:40 -0400 (EDT)
Date: Mon, 12 Oct 2026 07:52:40 -0700
From: Boqun Feng <boqun@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,	Alexander Potapenko <glider@google.com>,
 kasan-dev@googlegroups.com,	linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	Asahi Lina <lina+kernel@asahilina.net>,	Yury Norov <ynorov@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
Message-ID: <asz0OM48dedfuQY0@tardis.local>
References: <20261012134159.912183-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012134159.912183-1-elver@google.com>

On Mon, Oct 12, 2026 at 01:39:14PM +0000, Marco Elver wrote:
> Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> KCSAN relies on; however, Rust code is not currently instrumented.
> 
> Pass -Zsanitizer=thread and the same TSan backend options used for C
> code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> with C (though rustc currently rejects linking crates with mismatched
> instrumentation).
> 
> rustc only accepts -Zsanitizer=thread for targets that declare support
> for it. Of the targets used by the kernel, this is only possible for the
> generated x86_64 target specification, so restrict instrumentation of
> Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> Rust code remains uninstrumented as before.
> 
> All TSan options used are supported by the LLVM versions of the minimum
> supported rustc, so no rustc-option checks are needed (they would also
> fail, because x86_64-unknown-none used for option checks does not
> support -Zsanitizer=thread).
> 
> With this enabled we can detect data races in kernel Rust code and
> between Rust and C code.
> 

Help has finally arrived! :)

Thank you for looking into this, for both patches:

Acked-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  Documentation/dev-tools/kcsan.rst |  7 +++++++
>  lib/Kconfig.kcsan                 |  7 +++++++
>  scripts/Makefile.kcsan            | 13 +++++++++++++
>  scripts/Makefile.lib              |  3 +++
>  scripts/generate_rust_target.rs   |  2 +-
>  5 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
> index 8575178aa87f..3bb8754f844b 100644
> --- a/Documentation/dev-tools/kcsan.rst
> +++ b/Documentation/dev-tools/kcsan.rst
> @@ -14,6 +14,9 @@ Usage
>  KCSAN is supported by both GCC and Clang. With GCC we require version 11 or
>  later, and with Clang also require version 11 or later.
>  
> +Rust code is instrumented as well on architectures whose Rust target supports
> +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
> +
>  To enable KCSAN configure the kernel with::
>  
>      CONFIG_KCSAN = y
> @@ -121,6 +124,10 @@ the below options are available:
>  
>      KCSAN_SANITIZE := n
>  
> +  Note that ``rustc`` rejects linking crates built with and without KCSAN
> +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o``
> +  cannot currently be used for Rust code.
> +
>  .. _"Marking Shared-Memory Accesses" in the LKMM: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/access-marking.txt
>  
>  Furthermore, it is possible to tell KCSAN to show or hide entire classes of
> diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
> index 4ce4b0c0109c..f0096e1c8b61 100644
> --- a/lib/Kconfig.kcsan
> +++ b/lib/Kconfig.kcsan
> @@ -10,6 +10,13 @@ config HAVE_KCSAN_COMPILER
>  	  For the list of compilers that support KCSAN, please see
>  	  <file:Documentation/dev-tools/kcsan.rst>.
>  
> +config HAVE_KCSAN_RUSTC
> +	def_bool RUST && X86_64
> +	help
> +	  rustc only accepts -Zsanitizer=thread for targets that declare
> +	  support for it; of the kernel's Rust targets, only x86_64 does.
> +	  Elsewhere, Rust code is not instrumented.
> +
>  menuconfig KCSAN
>  	bool "KCSAN: dynamic data race detector"
>  	depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
> diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
> index 19f693b68a96..01af6fd71006 100644
> --- a/scripts/Makefile.kcsan
> +++ b/scripts/Makefile.kcsan
> @@ -24,3 +24,16 @@ kcsan-cflags += $(call cc-option,$(call cc-param,tsan-instrument-func-entry-exit
>  endif
>  
>  export CFLAGS_KCSAN := $(kcsan-cflags)
> +
> +ifdef CONFIG_HAVE_KCSAN_RUSTC
> +# The minimum supported rustc's LLVM supports all of these options.
> +rustc-param = -Cllvm-args=-$(1)
> +kcsan-rustflags := -Zsanitizer=thread \
> +	$(call rustc-param,tsan-compound-read-before-write=1) \
> +	$(call rustc-param,tsan-distinguish-volatile=1)
> +ifndef CONFIG_KCSAN_WEAK_MEMORY
> +kcsan-rustflags += $(call rustc-param,tsan-instrument-func-entry-exit=0)
> +endif
> +endif
> +
> +export RUSTFLAGS_KCSAN := $(kcsan-rustflags)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0a4fdd8bd975..78f1c23e54be 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
>  _c_flags += $(if $(patsubst n%,, \
>  	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
>  	$(CFLAGS_KCSAN))
> +_rust_flags += $(if $(patsubst n%,, \
> +	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
> +	$(RUSTFLAGS_KCSAN))
>  # Some uninstrumented files provide implied barriers required to avoid false
>  # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation only.
>  _c_flags += $(if $(patsubst n%,, \
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 7687b0dd5474..4b02bffa6b46 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -231,7 +231,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> -        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
> +        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thread"]);
>          if cfg.rustc_version_atleast(1, 91, 0) {
>              ts.push("target-pointer-width", 64);
>          } else {
> -- 
> 2.56.0.385.gd3acb90ef8-goog
> 

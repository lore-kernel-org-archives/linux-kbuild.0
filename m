Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D23D7D83
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901999; cv=pass; b=rvMn03s7iT2pqAdOpKUeJLv0ZtAArURvxfEwazVRCuPAqAaqpr6Vz3w4ZF63pQtJzuKfzDWSjfh7V+vgKGEXc1XEi+/ZXD2TsT8thMQ6qk112eHeXw9eEWwIuR59PzorYSJIhSgmKakSlMXfGDB9uo2sBMluTWFnBBtiueWFm+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901999; c=relaxed/simple;
	bh=ABcg7txfjreOEvrgYloSz7dmSAX99sKg32JTqnOhFhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfQSRYVfkfQ748zV0A/ckic4gS+J1Ln1OVnCpaHp9iUC+ARF2OUrA8j1wzULQHrp8RwWMCzWdJDY+rq+dDG3Ew3huqvkOUF6t3yY8vCr2Ut/wNXZ1k+P8jqF16ZJrojdPLDmunRJQoembCyF8XMlsZ6eWBTIuwNqZZYz9BnTRcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPf6ZmPD; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPf6ZmPD"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab16a9b0so215443a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901998; cv=none;
        d=google.com; s=arc-20260327;
        b=onIoUXS/KtBD5D1zlTvBrC5Slci//warUr0JSrxFWRQJF4A8LreFe5mnt4YGkNqnct
         Haavgoc3q6zQ6MEfqd+TJgCUQ43VfE08tuy0hNoot1GKtCPtxhAsKN7SUrq+X0xCFD/N
         YF5GMeqscnmYszxfpzXod3KYkT8NCshTiMquiUIJmHKHFQ8dzBLeB11Vyqp5ToOpU9H+
         bvVI5qCojZGBnRbn4fQdljle1PBe6wVEDHrUNgk4fl6pz1rvENkfsd0RckfxajVBrxR6
         VUUHaWLQZzIQJhbNqEXt6waYpHyRR+uGihqklM+8yoXkr8p0ZQ7/9W8bICcJDnQ3XsL8
         3ctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        fh=zYG8gtaqvauk1DehBZmwqt8MUEVp3nSWONOE1q9oTtU=;
        b=nbTwDzmBMthZplKWdWp1b8D9dJgMO7NASv82rvybvczR7ztruj9Nx+2QuDgrd9TQOi
         3iG04buv151oDpTTiR3+0hPHtX8yv5qQ0K7uuHikhO9e7QDGbOeQMnZ/rVmiJLp9gE3h
         oONI0+s9mY3I6zqTgWYa3LiP0P2VWajCz8IrnRZggVFUA308DVYoBez/4t57Lof53oU6
         3nXz9Wx03czJ4u7lOZUYMlXSfaHO4olAb9HPSO35Hx0rlQdCjQWeKya077/Sl0qTGw1y
         XLdO9avHThxXvTCL7TdnThRqz8nBnwbmNbOKRUV5IluBDqj6W8MTrQ8pcbNgSkE+VsQs
         P8DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788901998; x=1789506798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=kPf6ZmPD2v4AefzfbB96CY/1Ro8ul1IcFijnGdxXVXzXHHTesc60tRNbKo2R6qNiCV
         COm6UKvfUu6Q7EJ03xDCsbtZZbD+boDtakiCuWcq39IiGKN4AWNMMaVstLpEFMUY9fs/
         fA3Ai9ETukyNfyw4rNxQfgzC3yRmNdwLUvg5cs5n0LI7BG+oMLyNjugmjmLMSwmDxeii
         iJ9ESmD+qArHzXwghsJnFKtjbvVeFcor+5i9UXIjBUduxGmJNTr6bn/S+Vu/qGuE5X55
         I4+dUgYq6dDOehzn331667NXRaNpuSHWvSLVHlvtNcNxcI1Le57wdyswdbpjKOR//hsO
         L2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901998; x=1789506798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=U0SvRZuolkoQBRs4efNnBIn96jYTLCgIA+TISll3h5eNRxwCtmke8ZRCfNMnhQ8aaJ
         n6tA6MoUkNnZVAwKsvPR04X2PCQSAcZFW0LHkzFMkAp16G8y+eDSZhv54URMvVuaMgQ8
         czPNy1YEiQDEWe5WHEvBxsi/7UG7Yi7krhUWd88IA0AYspmBAkp3XTV7XJ9c5FvVebLI
         EQY5iT0hFqLJ/c54+lerjWmCuvUp69KwaIrf4ZCGJb/u9lPHwwRptYwgSxcWdGTiki9O
         D/M2bRnPBFB7DUIIq8c+ckSCt3x4sVpBrIHK2CsIEZjtSj2Pd/u9zR3xtYO4gKcnKv2o
         ZhwQ==
X-Forwarded-Encrypted: i=1; AKwUvByhB+0V3cLojxVrSCHwN403kyvVsUPkbvVpduChrLPxZ5rn5RdbzduUI6OfRbTATlC4nGJb7+7lVy3ku8E=@vger.kernel.org
X-Gm-Message-State: AFuF++mmy1Zv6g0JSAmOuBB1ucE71SMXwQnm6uscW9e2O9x42jqs4Sna
	UDLDFW+mCGtN7AdrrtqRf+IQD+fcqzLxo0bWiem6c/fD9sAcfKRpOMQ5AiofMDXqpMM53sk3hXK
	1xAzX/QKyLklb/4s+RkkHGhSQOR/E/F8=
X-Gm-Gg: AYBFou3cP5ekpgmm7IdQ+pQInE16LmcKN8ChUNUBXn3t2Acel6IyN9FWQ3Gx+pqKY8b
	7iyHtak8dDhoCfczFS1HmsvDUMLjUotYqXebYdaK929c/wdj/dJPDKuIv8dNRDPRacfxO/WvrXx
	l2p4YSO4ktP8Lrg/+mNKXXb6RwMFynlnLQWEdrwoULc7FH1JZWC9JvdA5jtEExxcIfVujt4AEmy
	DNPPqJGbVZQgmtaEPgCY1erQkr3yqBobPIhQcOrpBsqapwj60YGBxxgks1XuGuWU7iZ3RmXjAcJ
	ubTxQ71mu1CluLPGdCrOo8S+L7LBHqgyDByj9XwX+ZcZ/d6gqAJBjtQA98u9EPNC4PtyIXPOOng
	sli+Shuy6lNTvxgCEMITybx+Zy0eF5A98ZjCMSoWLqYFHtZUgFbYMjHLMz1OXBkb5GSIvLttEly
	G/Rt1YhkQLkB1Nu/U6ywRCY45z3rjaiFA5CurAOmLH2Kzrxd9XxL0=
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id
 98e67ed59e1d1-39b268ce386mr30178901a91.3.1788901997757; Tue, 08 Sep 2026
 14:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:13:04 +0200
X-Gm-Features: AcwNN1U58TdOwuasMFef5tH_3N3xyJMe8mAu14nPZtzZCuWKC0n_7MgG3XQZVuw
Message-ID: <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:59=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A future -j/--jobs option is planned for
> rustc:(rust-lang/compiler-team#1005), so check to see if this available a=
nd
> if so use it.

This is already implemented in nightly as far as I can tell. If it
weren't, we shouldn't add it, even if planned.

(By the way, could you please add Link tags for those URLs?)

> +config RUSTC_HAS_JOBS
> +       def_bool $(rustc-option,-j8)
> +
> +config RUSTC_HAS_ZTHREADS
> +       def_bool $(rustc-option,-Zthreads=3D8)

We can simplify using `RUSTC_VERSION` for these like we do elsewhere.

Cheers,
Miguel

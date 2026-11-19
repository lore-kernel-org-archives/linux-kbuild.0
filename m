Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099210;
	b=s9oCUZvwByDSpwzUHh1oa0ECRodWmhVpyDOV910VUzx2jZVOf6MB7L0uFtqmvwBeBm6c
	 jRMy3mwnjanOlUWMMaluIbmGfelXyPQ5CdRgChnIA620l9pJ/2rhFVv5kKjBM/hxhH3Ql
	 OUPfxX7aQXKfl/9LIIpmYCLzxx5fcGOGNNXe4WUi1wKM/2T32tXIXSpk02GuYeiYh/xkc
	 N41aBkolRkQkJoMGeI1OVloKxRbgu7JZ/Jgxxkn68aWzU4wgnqYR2GDIh4pW2Prn39iys
	 2HcROZPRJ5oHOTMwYsWw/1/XGPIlr9tM6bpCWx0EWTg1JD6tiDUabGaM64wbGlLPQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099210;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jGUNa2nkwgmbkFv5PZDi3+5NxDpJOH/HW6VIk5Cn1XI=;
	b=Xa34qynAl3zCFFJs4d3LghFlFMO3dvPGmUv2x12aKGXm4OwhyNkRI/0MkAOGkHIgmBTG
	 fwPvOx+dNt95rgJnO94mQwWFOZu1bHgR6DviATB/1//3SplRpMCD4ft2PXJfyZDXEHPo/
	 VJm/pf8qHhycUaSQXW6VpDTVMila/NmmQUUM2oB9WY/JHzi7QhhRwmTuzxfKB1XTgioZb
	 zhZb1im5H4IfhRe1CZ19fzv53odze51LvmOjnwJIZUvKXV+oVJ2sicDRRXThBlpVtzy/i
	 2NlR1OmKixt3PD7oDU1UQhmlvyK2mDhycr71N+v+xLMoAyeEneg2RwGmMKXji7cXY4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8Da98U0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 03000606A32F;
	Thu, 19 Nov 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8Da98U0
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 497251F000CC;
	Thu, 19 Nov 2026 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099209;
	bh=jGUNa2nkwgmbkFv5PZDi3+5NxDpJOH/HW6VIk5Cn1XI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P8Da98U0KKGyVjG5Co+Bq3lcopEB0AluEtILidv5HO2nC9IyOWGoRGjYm27bzTqIx
	 +lW6pso1BJ3BrPzJxPix2npnl41J3OXdsNde4rlJ4Xk33Mfr/2uOKj234ZaQxLFsaN
	 JHUbeyIxXwLPaI5mqCcxB7neudbJ5YHjlmjUvbCJnEzfr2AGo6qGaBb72MAV7L8wyy
	 CFQXCc9Tw0dMdoeIYdGl7ZLMA0okVeqgKyTU6Pf/vA4x9SI4OyVKsgMksYPaEOyaLx
	 rCFP1VQuX+46JDr07Y6DI/ct6ui/VXSAcdZu7oQ2XjGA/E5dOjTOfDtLZjFT0ADzEm
	 tTU3agC4K7jFw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 0/6] scripts/Kconfig.toolchain: Document minimum supported versions for dynamic checks
Date: Thu, 19 Nov 2026 15:39:59 +0100
Message-ID: <179509785409.3080802.12400900075505469862.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Nov 2026 17:52:02 -0700, Nathan Chancellor wrote:
> Now that we have a fairly unified location for compiler and linker
> feature checks in scripts/Kconfig.toolchain, we should make it easy to
> clean up the checks as they become obsolete through minimum supported
> version bumps by documenting when they were first supported. I somewhat
> modeled this after the documentation in compiler_attributes.h but I did
> not want it to be as verbose.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable) and applied Kees' R-b
trailer to 1-3+6, thanks!

[1/6] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
      https://git.kernel.org/kbuild/c/aac435fa2bae
[2/6] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
      https://git.kernel.org/kbuild/c/836ac9c65e4d
[3/6] scripts/Kconfig.toolchain: Clean up '-fno-allow-store-data-races' handling
      https://git.kernel.org/kbuild/c/e2c2434465c8
[4/6] riscv: checksum: Fix CC_HAS_ASM_GOTO_TIED_OUTPUT check
      https://git.kernel.org/kbuild/c/f67671cfeafb
[5/6] Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
      https://git.kernel.org/kbuild/c/fe2493fd4bd9
[6/6] scripts/Kconfig.toolchain: Document minimum supported versions for dynamic checks
      https://git.kernel.org/kbuild/c/c71019d89ed4

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


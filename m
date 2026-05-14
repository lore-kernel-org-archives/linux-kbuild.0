Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508EF31A053;
	Thu, 14 May 2026 01:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722734; cv=none; b=Z8pHNFNtcFawRocP/K+ixI0INpWEroUOPRfF4GRBWRzu+3VwtDTe1wgd3y5gVT55sLmBXWhMWWCgF+DuwlWcCkhMJUBiEifXt4I0ycG9gb8Y5U6c1BQa8RnMfbCrx8YwETPsERRm6hAsWZXkfFrnz+gfrh47Sz1Ptv0miskBG5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722734; c=relaxed/simple;
	bh=azx75L+0LsCmzV7YzgWzSDXiprim9aRbKB+QdHdpWcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cf5/nS5+2BiI58b0/Keq8mHYmCcYedU4aCZEov+M1Vsmr1UlTkrgwYNR/BQGGd4mOKVRUpdn5wfcqfeoVP19+BgqhAXTEpNM8NKO3OCCvOehlLvt8h6YsB1jsavnXMRhd0srI6zo/QgXwwhhQU3rfysP0AkWqNaePePSG9jANds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWelMqc1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWelMqc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A213C19425;
	Thu, 14 May 2026 01:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778722733;
	bh=azx75L+0LsCmzV7YzgWzSDXiprim9aRbKB+QdHdpWcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JWelMqc1orGpixsJdFi9RzJHAPx2YWdVYrYvGbGWfan07qTlSKpw03aLSoN/oFIWG
	 Gce/A3jHn6z/5m6YZym0FadHtug59M9PYnI6Dmw8cZ53l7W9qY1RtBiNyG2GlHcapZ
	 V+Ocbx5kF51bz5hu94O6oXtDSfrElIbbOAP4/3LH7pndT21dVP7uIItQ5ur9kQdYYh
	 y/HVozFDPlAkneMoF03TVVZwRqWUz2CxPCP55DmfTBWbS589DnrjsRldEo1lgvCZal
	 eVYNb1GS3paQPLRZrw6k2i7e7f6o8qQnUy6eOnj020OmUIhIj9yz9CwztKzgcKaIF9
	 i+nShwmL0M3Jw==
Date: Wed, 13 May 2026 19:38:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
    Justin Stitt <justinstitt@google.com>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 09/14] riscv: Drop tautological condition from
 TOOLCHAIN_NEEDS_OLD_ISA_SPEC
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
Message-ID: <39e64254-2a21-5b50-a8fa-a6295e61fed5@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org> <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Apr 2026, Nathan Chancellor wrote:

> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the Clang dependency part of
> CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC is always false, so it can be
> removed. Adjust the help text to remove mention of Clang < 17, as it is
> irrelevant for the kernel after the minimum supported bump.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org> 

Acked-by: Paul Walmsley <pjw@kernel.org>  # arch/riscv


- Paul

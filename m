Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851286;
	b=4OMJ0ZJHNFZjvPypCUDL/KRkth2YkBWHrP+CyLpHeS5VJeE9GQwr9ZltXFtVEppSDxar
	 BEr0W1YtLsRWhy8Kc9JNfeAEvxXjxEOzi4JHRBVMc0Cegq7jK0AGFIzgx43dEZMWoy4f0
	 CXVQAcvsISTqq1GefCEJrqplO3EFBlvabl4PT1rWzc0b3VD5P4JJ1X4m7aLB7kbdgdEod
	 QAgqYKVdYhxPQumP85XWQsxOJmmzNfLemO8k36+hllvXLd/LP7fd9QyOaJ+MUK/gtdRYE
	 6rkuKjdsLnic2JYWDbVLooM8TIpcGsK4KlbNUeugW1579HkqBcUFGFcoMYffIbTVMiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851286;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SUrp0/rauUAD8Fy1TIhBCL3jjtkn44nBvu8hj89xu+c=;
	b=WBVz5YvTXFFK5cYQr5S9p3jWE/3tZpb19/KEjn+uJTuLpTTjUYzDc61SlqnuAMHbhH0B
	 DSNJq2VDD4K2pxu/3D+BgyVjTP63lSlpD6r6kbFx4j0rzzyYEeyAWSLgQHyedrNJuN5Sx
	 PuXm+Gi2zynluURr4syQS2Hi0aCbv8JphoQTo+8858p84z9K+TDpBoGrVEMtUidNqBh9j
	 4O36zUMvHyuj8EMQHiOyK3FXJM5tKPecqWNauSkMJShFbRUcH1U+uBmNsHD0+lD8DbbOu
	 0zz3BMnaChhKDP1d7vOZqNfR5lF/AQ5uqmnr7kCn0+dpFbAuAJeEFei+aeJz4/HzM/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nuIi02Z4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDE606A32C;
	Thu,  5 Nov 2026 04:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nuIi02Z4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4A11F000C1;
	Thu,  5 Nov 2026 04:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793851285;
	bh=SUrp0/rauUAD8Fy1TIhBCL3jjtkn44nBvu8hj89xu+c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nuIi02Z48znFEH+HLyULohBTNIlOaoHsLPUcYZ7z63b6NYqOA/Bnf0OgOwJZjD9YE
	 CA7ymw3aV3zUSMMn/LLtCloqMjVqgEjNxSmeUKElMpkd8mvhTn4P2NeQX7mnGrwpxE
	 EFE6YbUNl30aHtmmL5RmGPN7/L+BSEWPgC0AbdD12Rmyn1n/a9Xc5o+reJsvqlrkrz
	 AACl6cS+mucTDC57TMdLaf7khIjD+5LlnUcNE+yDCEowJnvIDFrZJ3i8TjSi8L8ZYw
	 rJe7+1fwMdCW1EIsNE2NpnYbWDQ69pmVhCxrIiyM3S+gEzuP8UAPDwtStKB8NK33Sw
	 PYwz+/h88DzFw==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] kconfig: fix use-after-free when a variable refers
 to itself
From: Nathan Chancellor <nathan@kernel.org>
To: Leizhen Zhang <lzsx618@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, julianbraha@gmail.com, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008164504.3683811-1-lzsx618@gmail.com>
References: <20261008164504.3683811-1-lzsx618@gmail.com>
Date: Wed, 04 Nov 2026 21:01:14 -0700
Message-Id: <179385127413.826739.15688072837646047543.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FzUC3YXWBmCl/LGM0tLnwj+mlFG1qIwcw2mlKON8I4s=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmv//c8FExZGpCbs2fNy6YXjcfXrdqstOTILDabQ5uV+
 89bfjj1v6OUhUGMi0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBM5PADhn8aHEcl9s/wvVD6
 6Z72Hok9J/Qe1FSULmh8d/BJidr94ueLGBnmftg/a2mqRYhpvZ3LTNdjP8SUGHZ4CVxwMQ8UqGG
 4Is8FAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> For a simply expanded variable, variable_add() frees the old value of an
> existing variable (or allocates a new variable with an uninitialized
> value) before expanding the right-hand side. If the right-hand side
> refers to the variable itself, which is a common idiom in Makefiles,
> e.g.
> 
>   X := 1
>   X := $(X) 2
> 
> the expansion reads the freed (or uninitialized) value. With ASan this
> is reported as a heap-use-after-free, or a SEGV if X was undefined.
> Without ASan, X silently ends up as " 2" instead of "1 2".
> 
> Expand the right-hand side before updating the variable, initialize the
> value of a newly created variable, and only free the old value when it
> is actually replaced. Add a test case for this.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: 1175c02506ff ("kconfig: support simply expanded variable")
> Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Just for the future, you can omit Assisted-by per

  1e035297ffda ("docs: remove Assisted-by references")

although I would still like to see how AI was used in the creation of a
patch below the fold '---' like the v2 text.

-- 
Cheers,
Nathan


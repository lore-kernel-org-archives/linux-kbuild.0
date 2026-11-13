Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530747;
	b=mnarBtgY/A9PQXQ764S8STW4uTupcjQbLX0XDhFKim685y1m2LKtUAnJQNZNwr4y35th
	 dEpBRQMCJ3jHC7viEnRpMWiyqbsJRxi91cSR9RTGZcwYn8vaG4V6QRGrjAfpNwEJRv+FZ
	 j9/Otnb4Toma2Joz76YbmjrRTwp9oRVPCHtfaEGOZ4ue7ZUSjAOCf58NoLb1/FI0Jw0Md
	 3Hs0jiYvEdCFQh8tmaM6c1HsqaNhj9qlYs/8QP+NTm70oN2q2P6157JV3jtERXtdWVxOO
	 rmIS/vhuQ+2duAlgK00Bo24an60me7GWSgrMteLYAWaTd1lUYSqvQFPN9Pl90bvjuHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530747;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sOPD7XTjcQco9W/qUFQ4vgb6nmjatct8ubb0RneDSQ8=;
	b=Qg+NYPLqgm5JF+N4pHh8qcjn4Nm2gPGwNQtu9cD+2wyApWkf+OksmQWjGFb/nRf7wJL6
	 i8pWtb+PgY15wQaWsIO2nll0z0mzRa7xdLNrutDIDtpgpaKznug4rJ+35pcWC7vj32jeM
	 ubb9J9iThOngCtFDe/D0hXEvs5Ax1/RQgtc7rseBw6fDUVJlKc3thH5DTnbMbuyISgZ6U
	 eCo9/y7u2UYbac/tnMOaILTUKCnqHApQq0ruFHbFXQ8WRP8xvMLQjTxGk43D1j70zVAi7
	 tpKbywequYkcHb2pUvaWPytplNq0KYkc4F8HM4vxUDm03IS42hQi4fnSgTIXbFTEphQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Walq2Bbj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45119606A89C;
	Fri, 13 Nov 2026 00:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Walq2Bbj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F3E1F000C6;
	Fri, 13 Nov 2026 00:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794530747;
	bh=sOPD7XTjcQco9W/qUFQ4vgb6nmjatct8ubb0RneDSQ8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Walq2BbjXpDxWLlA3YF3wLZMpoLxFWW4U9/pk1DHBYaWlNB+bT9PlnbdDKYv+YUMW
	 NUpVL6iWQE/p7uOLE3mZuzV9BrkLC4Jp0ApY+1MdhzD4xne9HgMgqV+Cy28m5oNUlZ
	 UcnfVBv1+opXkRLD4/wSClDocLJwkuxBWB9hqO32WDmDyxtyypKK2ac7eiEsSl8BJW
	 eIph+VdqEvRp/FielEG2sVB3w+cDHKp173y+yMO67hLVI4IZzIteuw/2+4V7Jhyiak
	 00RMqLQCYLS2afQcoDCa/GqNNPETEwT8AqalpcorYveZ+/Q1y8QCZhwKMz04GxbSyd
	 G/76cIkZMHLEg==
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
Subject: Re: [PATCH v2 18/20] kconfig: add CC_HAS_CONDITION_COVERAGE for
 MC/DC support detection
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Chuck Wolber <chuck@wolber.net>, 
 Julian Braha <julianbraha@gmail.com>, linux-kbuild@vger.kernel.org, 
 Marco Elver <elver@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20261103015238.3780910-19-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-19-sashal@kernel.org>
Date: Thu, 12 Nov 2026 17:45:18 -0700
Message-Id: <179453071829.814257.15879259562619274005.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=nathan@kernel.org;
 h=from:subject:message-id; bh=R3/a0ar+NyTCe6tX1zIbO4VBx1tJcSEYyNlmM39lqoE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnfYpeyS0QKWL1fw613b929u483Pn/rMS2Hr+CtkJdB9
 AuG+rSWjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjAR808M/yNNHq6/nc/bdUze
 5r9XmVCvuc9qyd9/avr31H53WFRs95nhn82XaY7OLS+03Bj1txV9/BzmXPqEYYus2oSD5+3vxHe
 f4gYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> Add a Kconfig symbol to detect compiler support for -fcondition-coverage,
> which enables MC/DC (Modified Condition/Decision Coverage) instrumentation.
> This flag is available since GCC 14.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  scripts/Kconfig.toolchain | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 2acbd40a38f1..76c1e794d115 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -188,6 +188,9 @@ config CC_OPT_NO_ALLOW_STORE_DATA_RACES
>  config CC_HAS_MNOP_MCOUNT
>  	def_bool $(cc-option,-mnop-mcount)
>  
> +config CC_HAS_CONDITION_COVERAGE

Please add

  # gcc-14: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=08a52331803f66a4aaeaedd278436ca8eac57b50
  # clang: not supported

to match what I am doing for the rest of the file:

  https://lore.kernel.org/20261111-kconfig-toolchain-updates-v2-6-b2d9415c1757@kernel.org/

-- 
Cheers,
Nathan


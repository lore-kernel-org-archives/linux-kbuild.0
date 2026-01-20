Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCB47884E;
	Tue, 20 Jan 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937245; cv=none; b=NQvPEODMruMJoMitXKBV1AYrfO7BCB0ZY/HbElObAquH2wyfUCgL3ws4Zl3w3p9GUIWLQK0qnuPz+lbCTGLXu0wL264eqUQ+0a602Ik+vi+2Mk5V3SVd85maFPGd6iDdaV+rc3Rtpf+URrO8hJgKNP+3qmk9SyFUPx+CG7dNTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937245; c=relaxed/simple;
	bh=if+kL/O8iAI2iqfjwBnNKaWo72op3Za5GKQzP+73q54=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WdIJX0B/8yHSPAcmJ2OfqtHfIuoxi5gX+57urwexL9T8cVMxNNo0g5s0mU6RD9LCk7CKLAv3oMELdOc0Tp6ikIOA/IGF/pgR35i9kYoRzLGE9kh8GgVD0xIZgO1c/PaVKVBmf0e1MztuxrkprUg4klDQDvXdAg3NC6mYkAetbV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDH3+ugy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDH3+ugy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE6DC16AAE;
	Tue, 20 Jan 2026 19:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768937244;
	bh=if+kL/O8iAI2iqfjwBnNKaWo72op3Za5GKQzP+73q54=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fDH3+ugylGkTC+KohN4mkzSqEUYzwFr44MhQiH7WuEELSpjxKRYz8TeMOQEjEitgX
	 iFLTkvgY1IY/lHu6aTj3ZjHeUB9gYTiBWQ1ZRG5Z3meRLZPcdagy0vJmanNoEvzWQL
	 m97UZ8KtlCPZ3b+dGmMqNI6c9jagaARoPHSkgkqVK9m8e434iAVla4TppCrQgkWm9Q
	 8wtynev74zYcDfVsAdnPOSagvoWvAjqJcYoGwehzpCJGNdiR8YHCZ8gkC/oBFANEt1
	 iAXu87WznuKvJ/WLnqHprro8rDb6JrtOZHFGGe8gAAAxEOrUB4usGSUQ6LLnZKfnVY
	 PhEhglsMdKtHA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 20:27:19 +0100
Message-Id: <DFTNX1DYBXWJ.24E4YYMAJSH9N@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] rust: reduce duplicate information
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>

On Tue Jan 20, 2026 at 5:10 PM CET, Tamir Duberstein wrote:
> This series reuses `rust/Makefile`'s knowledge of `pin_init` and
> `pin_init_internal`'s `cfg`s in `scripts/generate_rust_analzyer.py` and
> reduces the ceremony needed to use that knowledge in the script.

This is a cool idea, I don't maintain the makefile code, so this doesn't
mean much, but it's on my radar :)

Acked-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
> Changes in v2:
> - Split into two patches. (Miguel Ojeda)
> - CC kbuild. (Miguel Ojeda)
> - Link to v1: https://patch.msgid.link/20260116-rust-analyzer-pin-init-du=
plication-v1-1-5e85c5824a02@kernel.org
>
> ---
> Tamir Duberstein (2):
>       rust: kbuild: extract configs for reuse
>       scripts: generate_rust_analyzer.py: reduce cfg plumbing
>
>  rust/Makefile                     | 32 +++++++++++++++++++++++---------
>  scripts/generate_rust_analyzer.py | 13 +++++--------
>  2 files changed, 28 insertions(+), 17 deletions(-)
> ---
> base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> change-id: 20260116-rust-analyzer-pin-init-duplication-a22d05221771
>
> Best regards,
> -- =20
> Tamir Duberstein <tamird@kernel.org>


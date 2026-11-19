Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795049130;
	b=lIFZoshjVhqIPXe+Ahi9pkm6S4pYYg9czzX2L1Gblqvw8cxh7TzX5UqEL3laSNCUkc/y
	 2S1pwEvwXx1ozp6a54axVJ4qEe9n0bKKjhrivv7pL3FAXtE1iKy+S56KNDDO6iNA52EdI
	 boR2iMD4jGCAbL6k3KZ9pGcD3hW5bVY0/iH5neY/BQS4DwwKQLnPQ70jFblulxaryYbg5
	 y9QUm9S4xyhhscBoCujcG6zXyqmYHqrRk7PhtbGDSUWQ5VVlAVl0YPRYn0PEnIqtd/1Gi
	 p5GkO1fzmP/0zfjC2cN6f99sBpTUoTTfjJjTaseWINFavW45UVLlFKKfYnlraCdZBBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
	b=PaSp/4VnnxCNI+blR+3p+5tRQhjngWSOdMKclDhzkZ91D6k1Fy+PwlEW+FcoF4srTpc1
	 MzxL4axQj8ae8noCgTd9VOFmnqfoDsjoBLy/WWphI1BX2JghStwqlmi3vBSAx0WMSy+ls
	 QxPNtd6HtSIne7xnKGx3a1vLxeKXtZtez7aQ0PDb5PPQKSghG+WAUHfzLI1crMyfyfMiu
	 +3jyitmJ35ZJnp1hFw380mGrmvBHT54a/zH26YZGKurYC2AV4iBS2YfwJeQe+VdDv5HM9
	 b9jH0fe3wMm8mCDMYaBaiSsryZ2Svv8cj4FbajIC+fhxSNWJgzgFainZc7hwtJiIkow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dctIdyXN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4012606A332
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Nov 2026 00:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4012606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dctIdyXN
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so10185e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 16:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795049128; cv=none;
        d=google.com; s=arc-20260327;
        b=YEgDrA0FPsXgQL5GoDg9JC8Xrl3bNLcLEiFIYaBtZE/5l/VkmCJ/prP45dIAKnraRW
         YKZCMNVnpe9/kTHXBla1yJJBKojSGENvwwTlUirhyK/q6A60m6tznahB7GAbYxk4bBlJ
         2Ou8kHDvSymdAvI6zZuFvyw4UmgcRU+XO2+ddvE1hPCVvGGixZZoGl7KxErLNB1c2JdS
         0oOjyvKIKxprlFvVhjSmqThSm2s86cM5sDt2rFvQN1JswRt1rmKnEhgU00uTD/+gEWPY
         e2GBXk1Zs1GUxfrCeX+vzNz7SrRLIrmfGRidmUQZqCPWeAYzuAsV3DxX/eUwgLg9bV3d
         euYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        fh=T+IHey+dEgAe9eL0hATPFx2WVMT2PZYWlWFE/UO15sk=;
        b=XsMm736mL7VNNfLgYm2BzosRx2tT96diASz7vQuOyyAPdg0zcL3MxraSTK8zwiO813
         Hy0RZHadptKFp1AyN9yxiAzUUwqAMZlPK1ciY5J6eeWniXN+Ap7MKLFFLflTRPczwPjU
         NmwxezX0TAtm/g9cWFFsW3Xaa/sTL3jikCDGT/EkvfIW7cQImAgQW1zgnywTDttkH5lH
         zd5013j0ClhCRr8CzW8DxgwDcXsnCRPSTAqq+ltLjV2+yQ/rFmrXrAfhDHOzDLTSrknN
         5eiXaQom4Sn74EdZDuhsCGw7xPlDAR9KfJrcQki0qBQdLy2r9JnbIqnZhV1pC2VCPYCy
         YaNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795049128; x=1795653928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        b=dctIdyXNTFOmu6P0yiuU9EAiTrjaoKS6u0AaJF9HmA281BEX+p/zl88sqijdx+DJq9
         G+zNh/CuWCQpA3z6cdByYHBnHi73s8VrPdRcpMFzr7xvXitN21kWHC5FzKzmkpG59TDx
         FtwXO/GJxAl9BDXtP1kwFFehq0N2jkz6gaXMh8YWVP+KDXMgJdAx6Pit8Qo6+8esR3sK
         hJdI4Mz3Y3QuoMv223DxSF9/bh1THeZMuHLgNcQRNeZjYKjktisXU78Eref678HFwQUQ
         lgC9TQ6Dk8hv0ofuQ4L0NwiX+aeR9CxQKEyygnbsFjq61cg3Pi+fkvrtILQgIQ4oaMAx
         e7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049128; x=1795653928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sS940tCKYm9vcpUdjMxPgdq6c4Dw9nIfl/dAmKtgNk=;
        b=YK0bPop34ED2qzE+VrBlMgAldKz6E0Zxkgo6DBgcs43Ar2lGv2iwXocUbd0LK9HM/g
         mPSmgo7uHf37moeVJdktO/r2PHzgmNUNFrVQJX219OVY3DQSIMbFzU6YiMGk4uHglrsG
         bbeWJbxVsJ10qJAVZsYb6bNy9e+hG4OkJcR+ev4/fMWN+hLeGpdQwavye4kYw3Fh/+X6
         3CVqOf7YZ1ofGWk2jJ1Ephh0b7S0PxJ+vv8pGzFYn1w6TXmlqOY0VDWdOpTbH1iRubJH
         RoRljsYaMzxzUWBH+Lju6MSowGyaBSsQtlbEvJiMlbc5kiVOIk2SDwah138xmE6Iw9Uc
         d+Eg==
X-Forwarded-Encrypted: i=1; AL+hErHqmvq1K2+ydoYfKaJbLhew4KtAXptSwSdTSWwqVh+YB/l5N6zhYeMQFEXWUXMxTaNofI239lGxxMAlHQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+40IW/vcokRZ4PQMJ/ZzhIrRk9NQ9T9kb+XDEd4dEgr9g16li9
	JF206F68a1rmceyj5ZHRYPcCuQRdX2IY8COdkhDSXnghDdyGsDD9CCrLr6Bgn37LSXpcYIubIXy
	7tCHGxLvi71bu6LJcDEwiLZZ/QkPzuLByUfy7yfwa
X-Gm-Gg: AYBFou0qokwLokO6DIZToQ61kkVw8PasoKWNdQjFlqCkOETi34mSJbwOU+1szcbfmd9
	+IPdiFBSbm7BHQvOatYmem+cntXLpjaWiUG5JF2LlIESPzQ/gHcrai+uIOrnYXWqk0jQzhf0AF3
	ONtlnf4jEIsbxZwtC7tXxROEBUQM2MA/L6URWG/DytN4RxLH1xRctB+KKFd0cXLJ6cM2pe+W/da
	LI6hLUbjhOfPHnPxitEyQwcLm7FT6rXfGVG03hgOsTRJDEpcYxamRU+kwHG+/tA/xUhKh06yjlC
	noo5UGiiH1kRFi+wBsQsoWWDX1m5SjpYVIRa8fHI8Svj2ugu8WkWgyEUKFrz25yYc8FiRLDCbxG
	qQrXZwrrGy8l6tv3vN63Pph8qCPWUqSMOsw==
X-Received: by 2002:a05:600c:5489:b0:4a1:e368:cbf7 with SMTP id
 5b1f17b1804b1-4bb84b99968mr104985e9.0.1795049127672; Wed, 18 Nov 2026
 16:45:27 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-fix-rust-build-error-modversions-v1-1-7c1023764f30@gmail.com>
In-Reply-To: <20261118-fix-rust-build-error-modversions-v1-1-7c1023764f30@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 16:44:50 -0800
X-Gm-Features: Aa3M54rPrnjXnHBMBUtGdNtQCrNUnFqzZgAcYH5tW2jPXgiVWnHrDJiqQAFq-hM
Message-ID: <CABCJKufsw-egbnyqc3_D=+D=AdPQN-Q2bi6-uGi3e6UV_FZkKw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:08=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> CONFIG_RUST_BUILD_ASSERT_ALLOW exports rust_build_error to modules.
> When CONFIG_MODVERSIONS is also enabled, modpost warns that the export
> has no symbol version and records a zero CRC because the build_error.o
> rule skips gendwarfksyms.
>
> Generate the checksum from build_error.o with the existing Rust library
> rule. Make build_error.o depend on rust/Makefile when module versioning
> is enabled so incremental builds pick up the change. Kbuild's saved
> rustc command does not include the gendwarfksyms step.
>
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1201
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
> An incremental x86-64 build with LLVM=3D1 CLIPPY=3D1 clears the modpost
> warning. The kernel export and a Rust module that references it both
> record the same nonzero CRC.
>
> OpenAI Codex assisted with coding and testing.
> ---
>  rust/Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

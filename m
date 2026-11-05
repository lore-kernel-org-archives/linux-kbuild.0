Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852997;
	b=zUnNuHltkS9e8Y+jEz2ezgaXdU9j15aLeL10ueEPIDThtsj7XPb68njawP+LHyfSiVAT
	 AlXJU2PNt3G1gQQEoynAB5ryuAwug6/EW7tEvX96Mi3cuBKkNtdZdfX7Lzt1PzSHyu0SH
	 J0YRgOd7j63YkTz/+7ZoK5y7tpGMe+RgtA0X9qYrPCAxm5n2Ysce7BWeyI+Pz5uFwuzLU
	 O7fAf3k3phESUvbA19dIaEwBIQNOlSj10jpP7TZtzRVL1Tkb3/T/xGaLQ193MSNoJvvOe
	 BYBfeAHKOOJ3QlYVuuRJiNsZ/K/hjMtDLyLeJ7rfgKgzvfc92bP6cT8X0y0p7cXuyAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852997;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KPAE/pf5spCt8tF+n7sHzxlhCQ7JpQ1fLOMEjct2Pr4=;
	b=LfrJUDInLbGSNc7qMo+mwV7b1Fa3CnUZISjw4dt3QONJi8vjqFTScQBWhKcHt+k7DhJa
	 CVn/uMGfV0BlSx+i2l3uEkwy0s8Orv852SjRnoBm29aKG8tKGVJkR9I8fx3GNUzmwtPl+
	 AvK5uOlfHqDVHgLxlmfUBQADtEWNfMD93qZMkprz3Q0dV5iYOoF7CHdfNmuN0VUnWgct+
	 xff6GDkOkhfiIlwNJdbvVDjPrYADP/IBIjLgYFLqjqXj3IGROTWI6DaWbdAF1GdDy3PKe
	 aJJ468Zc/IVeJmZBmM0KweGHYCu2dy/byQU1dbW/4yp9AdSntn+Rx4w7dqWyXecCbJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnW1KUcH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5F3606A31B;
	Thu,  5 Nov 2026 04:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnW1KUcH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742131F000C1;
	Thu,  5 Nov 2026 04:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793852996;
	bh=KPAE/pf5spCt8tF+n7sHzxlhCQ7JpQ1fLOMEjct2Pr4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nnW1KUcHDyqhxCdLaCIf0P6zIXDgT0qimcY/G1Wi3jqu5KPta4IlSe7KvxzStMJWE
	 ZmJ3UWpqpPxJWX6h7GknaqjOmOT8GdQ03kxOMuJfp8ZSz2MU0huCiXQrGBc9FTb08s
	 H3QKxUiJQMmZWtjZGiXxU7WpW94aH8bHzKPYDNLJ04418w8fPZvHxjwNOOFbzMmLKI
	 fe41DkyMi8OHOpWgiL8OYZcXSQmmFYncMRO4K2SlzvbIy4eb4nRzaHv2uwLcf8ffe4
	 AHpphWhqAtXEuaEj8SsaxV94xjX1nUK3FBPMvviiY9r0SURBXkN0M6Bd68wcq+jhf/
	 m1lALSSqPIKlQ==
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
Subject: Re: [PATCH 1/2] scripts: add --registry option to container tool
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-doc@vger.kernel.org, 
 workflows@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
References: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
Date: Wed, 04 Nov 2026 21:29:46 -0700
Message-Id: <179385298671.826739.5987343385077824329.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZBL3o99fNPmo9r7pegdnSdndLZN3q1BXEi5XkfHaaAM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlv2OyvTDbQS9vxsP5Zrlj9Aov106YWz3sTqD1xt1GSm
 UjFrhaHjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRj3WMDI9muF9YssyAvfFg
 lPzVvXfvrm+8o+uysJpxRp3B7qwJu68x/DNeFXSdUelA5xymI1dk2WetEbv0INJQ7vhDPX7vy4a
 XXvEDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> Add a --registry / -R command line argument to the container tool to
> specify an altnerative image registry and support it in the TOML
> configuration file accordingly.
> 
> This uses a mechanism based on regular expressions to parse the
> container registry and image names and construct the final one based
> on a set of priority rules.  A registry can be included directly in an
> image name; an empty string means a local image.  It can then be
> overridden by explicitly specifying a registry name via the CLI option
> or the TOML file, with the CLI option taking precedence as always.
> 
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>

Hi Guillaume,

I don't have any real strong opinions on the patch itself (although
Sashiko seems to have its usual complaints about validation and such)
but I am not sure the commit message or documentation make it very clear
why it is useful to support this. In theory, the registry can be added
to the image parameter, is that not sufficient?

-- 
Cheers,
Nathan


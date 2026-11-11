Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378262;
	b=083Jqf+jsS0h+IHoBBaKyWs8xUAP4OMYvUMSZusXkbzSLfaRhj++1qHm4cm7ce6H1Scg
	 aQ212uyjg8H7lt2GNZ3n8CsYX+zz+Li9UtBhQq8FGps420dW6ndcT+2VQuXEdjZEYaFe7
	 3Ear+wR500yEW866EjKND5ry8ZcLp6eVuDM8rq7gBe1mdu3Kbu6ue0obNTvLUZeUgs6Vu
	 L0NygCRndu7VlSmPfmvCnj8/Sw5rvNx7sc++Bvq1unlReOhoTRxwAYUmycoCf0ayG0L+R
	 ptuUkxSIlRdQsmZfDMkq+C8th1HMIztiOOxLrGRJYYnR8RX6GfBQRIfuhJnePFuQhAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378262;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JOxuYyfrb9gbgDfv5K62rv8MvE5D5nz7Dj7W0Dso62I=;
	b=h3nlc+zEhqfnEFKqk2UmlYBQtCjYEN0TK7eJ/vhdqjghbPxvg7pJ5b15v0dDLDLdz5id
	 qvZ6kdvZScs4mHKH5eZZjbwaniC+Z5SHOPq9nn1xTxKnko5mn2WkPNMQYnThoiZMNOjV5
	 X6wWxIYhpRiRI9O6VaGtO41W75Up3RQJRJxMSzRhVv6G2ehPzL91GWnThl2vV7lueo4Yw
	 NIXbljbcYU7OWsytmKx/aM8aLHNam5coHbsbyIMXdPCifNyp5bQeN/faXrpkM/yUZj3ql
	 tW6zz/hiNr1dXyQHxE92VNkdqjkqJYcY7Hwi+avfgfQ/n7zLQwCpckhUnlz0qEPajuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSc4GRMG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE9606A320;
	Wed, 11 Nov 2026 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSc4GRMG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA4B1F00A05;
	Wed, 11 Nov 2026 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794378262;
	bh=JOxuYyfrb9gbgDfv5K62rv8MvE5D5nz7Dj7W0Dso62I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=aSc4GRMGiQX5m+E/yAsFP160niIfgExLMEAy3NLMRiwsghKII3dWbbkWu9qgkPQCN
	 j0d8vXiLkdgTWXnfIM0C956uyrHtD3KHXXQ7gTVdGsoscT7jdwaf1B4i8WI+vqQQ8A
	 XBq5+S5X61DQpqbQZz4SHYXpIjvy9Wg1/hNFLkBJs7f6kpxyBDNxhJzJHOHf0eWFR6
	 kuOEeo3IKGzYTIJK+2OYQmMqg5TiG4HRUAeH52NbywqkXXv5YO6UtQNnL+DQg1eaBB
	 2e72bUcht0tn0hKYP5McBXyb8kHf35p9z53H50gmsumYHtOs8muaUvuHnrxIxINMdN
	 ZwIec3TI0d53g==
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
Subject: Re: [PATCH] check-uapi: avoid truncating the failure count in the
 exit status
From: Nathan Chancellor <nathan@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: nathan@kernel.org, nsc@kernel.org, arnd@arndb.de, 
 quic_johmoo@quicinc.com, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hamdy.aea@protonmail.com
In-Reply-To: <20261107191355.151276-1-info@daylightlinux.ch>
References: <20261107191355.151276-1-info@daylightlinux.ch>
Date: Wed, 11 Nov 2026 00:24:13 -0600
Message-Id: <179437825358.3770401.4695368955990838276.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=nathan@kernel.org;
 h=from:subject:message-id; bh=RFEPffWlAg9ClLarAUVGl5FRKtWYIBEKsarqpL64/DY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfuAQC7k2buF93+VazZV7tK5piHh+bXhHy7+Tj+GxLI
 xXRW+/bOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEsuwZGd5df1zi5Ct54NuN
 mIfptomrL/hnML8/Mrl4e8nzr/xbDf4x/JW7IlOSqJiwQGyi5JWphn2Fze3tGZOFih7EByh+OLw
 mix0A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> check_uapi_files() returns the number of failed header checks as its
> status. Bash truncates this to eight bits, so 256 failed checks return
> zero. run() then treats the ABI check as successful. With -q, the error
> diagnostics are hidden as well.
> 
> Return a boolean status instead, while keeping the full failure count
> in the existing summary.
> 
> Tested the complete CLI with fixture Git trees containing 0, 1, 255,
> 256, 257 and 512 removed headers, plus -j 1 and -q. The 256- and
> 512-failure cases now exit 1 instead of 0.
> 
> AI assistance: ChatGPT/Codex identified the issue and prepared the
> change, commit message and executable regression tests.
> 
> Fixes: 1f7f31bf7202 ("check-uapi: Introduce check-uapi.sh")
> Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

Seems a little contrived but the fix is simple so:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


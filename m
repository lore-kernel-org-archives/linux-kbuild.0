Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057297;
	b=IhmlQV229b0d4NamPAMP2M4PzpDEgHckpRgUyw7eaFLqetVmmiHEmw4cabuZeLbkhL3F
	 YfrA2KtkTPcZhF2kThiCcPV7s7X7w9zlVTIgOAcoTwrgs/e9ZkwGwdxZ/JqUQxp57bTel
	 cSrzVNHaFkoGFCkS8lJVGO4I5VDg+JRtYal5EkTb75l8HDnfiwMvquR1Q0jNlIhjuZXA1
	 5q6F92zt0vr+PH2nmfhxCgL0UC69aAuKnAZmUAi9xZH1bH8gJ1AML1cW6d8WlpflMJLHv
	 vbNEERTbVpZQGi61gfllYlfqsB7EcwiqbrQSMTiCSaMLyIqs45BlhwRnAmizKce4pGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057297;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O3Z/W+pFM7Jt+ww/1hF0Exw9/hjMGiUg9ShLdHu1PZU=;
	b=1m9WK5CMdEIuQoNEbbPlmJXdfngAS0RMB0ycHUtaKH3PldJGHiF5Bc6M6yCK25tlMt2/
	 X5Y/0HpoXeqnkChaYy9fLH/eAnThRg1+ocyllw+e5+Ck4BVIEkRUVFOQqSHhjI0udD/KF
	 eAgTtFn9sCGz0QrIQCoWf7r+8ldIQVecfKFC31tMX27voBVRyQDymHqZgqQsT63JurS3Y
	 x5Id6BOAmLd5w+GXBakGQvuKff5hXmcw2b6Df7JwK4EhjzTTLp1gQqYv7PkgQnQm+uQb9
	 2SVdqP8tbNPbq4FK0z29UL4yhZanfrC98axyqN8TUqnTg+9rzSc+o29VrXJrg8aXr2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtvXIhN8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 55BC8606A32D;
	Sat,  7 Nov 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtvXIhN8
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 680A21F0089F;
	Sat,  7 Nov 2026 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794057296;
	bh=O3Z/W+pFM7Jt+ww/1hF0Exw9/hjMGiUg9ShLdHu1PZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YtvXIhN8RENn3g6HUz47++v6lcxJHeXoYs5XAV2dJHCAE6a/WQYVaWaTAtviZoUo1
	 T4EID3yCsKHz2qGPXKgvcz8LRthqjMcjbYOW45rpftGjN7Lo5nXygnBqYM12Ec2YLF
	 BnHZQf0FdGLNkQV+fL8NGUy3nQw8yv+dMqPIlDHJpJL2Yr2fiZlPwj/OtMTB6lBbRW
	 rhJMrdL3mKMtRiQUV45tEiWhjEmZ3nnamhotukz8VOq4IYuoSEAAiycXIzxt0sLhH1
	 uRERu7zXUhfm7Fc13OaskwGKC6pKjhj+bmHNV3PJKR7qpqzxz9aMcAR6BiacLkQ5PI
	 BA5WPlFUgmpEA==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org,
	Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: Re: [PATCH] kbuild: detect module name collisions between '-' and '_'
Date: Sat,  7 Nov 2026 14:14:49 +0100
Message-ID: <179405726799.59648.18423712734918184078.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103110411.11698-1-info@daylightlinux.ch>
References: <20261103110411.11698-1-info@daylightlinux.ch>
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

On Tue, 03 Nov 2026 12:04:11 +0100, Hamdy Abou El Anein wrote:
> Kbuild converts hyphens to underscores in KBUILD_MODNAME, and the module
> loader treats both characters as equivalent. However, modules-check.sh
> compares module basenames without normalization. Consequently, modules
> named foo-bar.o and foo_bar.o pass the conflict check even though they
> have the same effective module name.
> 
> Normalize basenames before checking for duplicates, and use awk to show
> the original module paths in diagnostics. Preserve detection of exact
> duplicates and leave distinct names unaffected.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), with 'Fixes:' tag added, thanks!

[1/1] kbuild: detect module name collisions between '-' and '_'
      https://git.kernel.org/kbuild/c/bc348949

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


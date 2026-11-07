Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060269;
	b=RQnnVl3pcuiKsGttWyUII232iH4R4cVZcdLhx0BFWqTzmdS6ETshENf/QKB5XO6+kjSq
	 tbnVwlqzsDHXMTxigfFjf8wzln541V/fz4EDVps1mbZjuvFnzsO9kt25xdKPUrEcjyhmo
	 Kg0HkKjpTxvAf08wbyezHXJ/GQ2Rmi/OwZz91XVMJVnERWwD/GiLsWZhltQyxwzge2bz+
	 vzvOC7I+KSNyLz/u3BL6VNn0/f/YL0QXu5cfv8lkgtV2GwJHx4UgeCUHjMX9wcpYFbM9j
	 Y22rMKsxywTRxdr9OrfuAZ0iuXrS6JU+qXisxE8s/r+G+m/tDmgwnFMVVw9+bOl+Otg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060269;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iz4ILeaLK/9TEw5ONvASXLYJT0mntrU76Bzr9kVTezY=;
	b=lWunQYvfwqFIaDFn3YwJ8noIvNfBD5fNRXanCBkN8xnv8kcL5/d1BLoGhNR4rc/PgBEJ
	 UQKlIxnXfza+m3mAFYUGDI2SXda5Iiy6GQlHaE0b7Cc67xusp1kZnvKIiVsv078hqFY8F
	 InFgexmXxJ42HIRwPKUAVKlHvf8C6ZcWgpdtDJLL1xl2zR+V840LfPGa4BYhM/0BRWrm/
	 lKumQXOsfbcYwodDiZMuRpJsE1GxF0F1iry5M5lUyCvT0tzIYxtufs94AMfUUy2ZjlHcq
	 0vyASDvnLIgVRksCkid/Sou2ds/y8Jt8T40SBCe2gq9AbbTQPBNejemRZqjz4ThI4Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mpz5/dtc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0336C606A32F;
	Sat,  7 Nov 2026 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mpz5/dtc
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 526C71F0089F;
	Sat,  7 Nov 2026 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060268;
	bh=iz4ILeaLK/9TEw5ONvASXLYJT0mntrU76Bzr9kVTezY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Mpz5/dtcs5Oc1x2Cl6ofTg+wKDhbgL4uDEzJQ4kKHPtFuDGr6xcb/VK7I/srTWr2B
	 2H0PlikMuGuIeItRN9Qs6YZMfby6kcZwLGX5okXMaXOIAeQfdUWT09kbXOCl+dPWGy
	 Rp1NnEQSxn2Gbm2MDLYdYodW3T0nXB4IDg8msm4ZzHZoTVvbqAeHVzqHgtovCjaxlD
	 Rp08vYuYF+R/ppvq9XzGVm2AS2cxJCbeKRSztmkLAzhSkDINbkrP25AlPatVh9XvMQ
	 MiyUvjkhIX1ft31NCtkZ2UFYpVpLpl4kCuH+XU2WEV7rPjJg/sSnBEnYPCqMaJ8Czu
	 AwWn7EsD9/iLw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
References: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
Subject: Re: [PATCH v2 0/3] kbuild: don't print DESCEND messages from
 tools/ build
Message-Id: <179406011233.60865.11422599083662810895.b4-ty@b4>
Date: Sat, 07 Nov 2026 15:01:52 +0100
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
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=1L9SHaZtINA5liODJBQps+4sD4pjccWDUemDimkDLc0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq7y9WVg/jsvxvFP6Z+1ga3i37Mfba+nG3nRMm2
 284vtqKJpiJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCau8vVgAKCRAHUgpwFiYS
 aVqcEADig7BFDmuzoYu+B7awlKcgqOquIqrwkW1FPgQOg2hE/l0FqIDUHQM1RfrAAkANOfnZ8oj
 z5rHwIsbSQQmVSz6si8D/r6tcMB2MWXjDVU23aTZhvyEL20hZdHbIX8PcxmU2CxFRLUuOio/TCn
 XD/S2tYpaLm4RDhhGSKAKSiQmwxLo2KVBPmwNCkcr3AOjJ+CJgeNP9EI2JHN3sNPjzo8sQc2D0g
 ZoR9H9ViqcdM6mBh5Zv+FrGQgSvCE1Fy+cZ9mi8cQw7TWzwIQSE1YUdFKu26CVWMTgTTiVn7IUt
 BTs0O2vJ4vzobSfAz0q+THjhD6b4b5TNw7RyoLpV3n8jgdTVzLtD51r7OcHv6l+Guz9sV+fXCoY
 XBtp54aTHWZW1SWnQqkGKKivGEspHkbmO9MWeIFQvb7r5z++PLVFYvBdrmtmktStl30AWKi4WPU
 l+jOohPMRysoBiuoN0n3cmsF22JYN5VDfxZHMBnk5n1loyzC1LzGA4T7e0nH5fr+r/LOBFM7Of1
 g5C87Xyk1qKHfzp2DDjdmKqxsvxRlh4YgNwRBFknrl3jrNUw8GP6Vqcu7N44UuoN0Drf1VB7wVV
 FaMomcrW2snqT1TH8zaMhHHID6IdQUp+/l4fmwq3XbYqmoeZ3tDHPhL4FCvHUh7C3S/7yFHL2VO
 TtDeLc2P07fBLcg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Sat, 07 Nov 2026 03:02:40 +0000, Thomas Weißschuh wrote:
> kbuild: don't print DESCEND messages from tools/ build
> 
> kbuild itself does not print the directories it descends into, the
> tools/ build however does so. When kbuild executes the tools/ build
> these messages are out of place.
> 
> Forward kbuild's behavior to the tools/ build:
> Nothing is printed by default, the full command is printed with V=1.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/3] kbuild: drop the tools/ target
      https://git.kernel.org/kbuild/c/6766b341
[2/3] tools/build: Deduplicate the descend commands
      https://git.kernel.org/kbuild/c/746dfc4c
[3/3] tools/build: Don't print DESCEND messages when executed through kbuild
      https://git.kernel.org/kbuild/c/c9946f66

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



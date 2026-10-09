Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D81D4908CC;
	Fri,  9 Oct 2026 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578485; cv=none; b=Z8ANJ6tLVObFSulBncwViw75dTWxnO5sTYu6jDQ6Q3ztWp6trkfT/3c7ajpy3sV0DFADTXV1m6LTzX/c3lZQr88izSpxc72c9EFXmZqwpq8+MiTyXi0FY+JbQKIgiLdKgGnYOiARnhNAyv/NiMmCVku4jiJ4GxcWniyWBTeDpAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578485; c=relaxed/simple;
	bh=8g8XTeR78rkUDyJRUdnO7tHkrhiFCZn3L+C1guYzEZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tu8ATkEcfxeg+ni3wwdnE2j16Jq1IpNfiUpb1Yn1PgTy7/nrFDrkg8awZmJuMzXc6pdBzy5JApWnoV/cCvq+1IaJ0VjWMDmHyMvCRmeRVmB3U9avlTQOacyTOCHUt6sgHgAwdkrvzo7iSm1h6xyfhrOVI4E0Array/r6CtJwneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTtKC8bF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTtKC8bF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5A41F00893;
	Fri,  9 Oct 2026 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791578484;
	bh=8HIydR5MFFOLtdtn6opDtsslp75u5f+evgDMZffmqMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OTtKC8bFE/n4A9G8ZLATl5STfIc5BP+K5zAqhfxV/o+mals/+uUjPxRdQ2C5Sv0b6
	 15JVJnEeaeyKrmXEZydybvSvTdj1w99+tYLSQaEYWRMOVdrwNA9gQJKq3BNU2DuMjw
	 CCC4KHu5ql98M9vm/SRmTBtYkRB9BAd2jAkRrCuKb7xWKz/BtmFcL2r6G/8iV9MODg
	 a0kmPJQcQKfIeFIeOwXFmFa/Xm/nfpBV2f7kL+ELR1Jyc+1fEKSaM1ymXuRhkc9rEv
	 7l9bajCC7vaC2AwKW8ogMaRXv3b8uHBPu5IesGb0qNKQQwznlJ0C+wMwsJ96F6EduO
	 D8NWz+DCBT6Sg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Ting-Han Hou <ue081723@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261009175836.2277-1-ue081723@gmail.com>
References: <20261009175836.2277-1-ue081723@gmail.com>
Subject: Re: [PATCH v2] clang-tools: Import os for broken pipe handling
Message-Id: <179157847654.778396.2514393103937606279.b4-ty@b4>
Date: Fri, 09 Oct 2026 22:41:16 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=719; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8g8XTeR78rkUDyJRUdnO7tHkrhiFCZn3L+C1guYzEZI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFknAwucXl6fdlpCuYjPTiFZVnzSFa26bWU7FqUdOsXAY
 5D06vLijlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRzkBGhkeq3hss9x6wkp7k
 eyLf8X5pxYrVQQFvTwp4/2FhvcZzXpqRYcHCL5907Ne3MU5ffu35AwsdWcOLSy+5K53UP7u8/OC
 GBZwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sat, 10 Oct 2026 01:58:32 +0800, Ting-Han Hou wrote:
> clang-tools: Import os for broken pipe handling

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] clang-tools: Import os for broken pipe handling
      https://git.kernel.org/kbuild/c/d26ab84593e63

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



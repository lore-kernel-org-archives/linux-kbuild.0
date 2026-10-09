Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D284FDA60;
	Fri,  9 Oct 2026 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577634; cv=none; b=iKm0ZDCmyFBXlU1K/vfaZaN3yB3T+aJeRs49TIDmmIVhkPWIjmyWxVwctMTgoS2cbhlDBnO9zNMT7DWCWNE0KnyyoJxGI/mijwQA+hf52hiFkHKRVvQfrZAjzPLCwfiA/dZTFThTLUw95PN5UnBZmWaSPKFk4o6cG6uYM5GTQ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577634; c=relaxed/simple;
	bh=gl3BoHbabYB73phCiRs2xUGs44/d0Bt9GSYlWT3fXIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YVhiZ3B8yVzd0MlN7ymLcSP6XKC3UsciwAFPnxrYFIHHJ6AGsqI8dARc+IXZkK9rc5Ws2oQvxS8NlMkOsx2FEST6iGt/mPhQgJVyDsilMPIyIR/Twakbc0Dg4HBwPuG5z4EwWGkXxWP8TncmwAhcw2mHMa5/vx0gdYCMrNHHxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Npur2j63; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Npur2j63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211E91F000FF;
	Fri,  9 Oct 2026 20:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791577632;
	bh=12mjNF9n0R8cCzNOOrubBApcGk1pCG7If7+j3H0jr6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Npur2j63AFgtL5sn4ZUAOoTJuuaeq1/1l3w09diGZ0lX1K+6lfqNWmlrCwid6UIrt
	 i5EA/iqHcZgTn6n/eMXXNzCTqL0whfFyGEMP8l6jz96sUfE4EQxhT+tY4SJzAppJ4i
	 saxjsYmHbcR3wJGWVt/L079zD1+41DmHPmCIMICbqTbGG0+usnySqmFx8gYTGIM90U
	 6biejNpV0WhRZVZAjfQxMGaxMzFYWfnpNk0IddrnLWAaUI1wN0oWes9yvLG0CbdPD1
	 2bF49ggxsFn+aH0dcOBq9GXtQD8NRpxnVyOg3oFOjH1j1eV7e9dJS+8Hfk8F6fYRUN
	 WzqsCow9AgCwg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
Subject: Re: [PATCH 0/2] Initial ergonomic improvements to
 scripts/Kconfig.toolchain
Message-Id: <179157762044.770731.11190028488014391920.b4-ty@b4>
Date: Fri, 09 Oct 2026 22:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gl3BoHbabYB73phCiRs2xUGs44/d0Bt9GSYlWT3fXIo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkn/aS/Lql6sa/53g/7+F3azjsa32ycrdvY9Lvef3l9x
 fObx5+/6ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATMY1kZFi4wXF9bqHuz9jC
 9IaE4OO6YprL/WbxdRR7LI+we/XuxxlGhsakS7NOCoYdVM+6971w5Rm7zvQ3Tj+PbgrhqnC6fJO
 9iQsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 07 Oct 2026 17:22:20 +0200, Nathan Chancellor wrote:
> Initial ergonomic improvements to scripts/Kconfig.toolchain
> 
> Hi all,
> 
> This series includes a cleanup to scripts/Kconfig.toolchain around
> dependencies (the first patch) and improves the ergonomics of using
> cc-option and cc-option-str in Kconfig to disable warnings, making
> Kconfig and Kbuild more unified in their behavior (the second patch).
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-speedups

Thanks!

[1/2] scripts/Kconfig.toolchain: Drop compiler symbols from dependencies
      https://git.kernel.org/kbuild/c/c4c24fd63a8d5
[2/2] kconfig: Improve ergonomics around disabling warnings with cc-option
      https://git.kernel.org/kbuild/c/7202c08793a24

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



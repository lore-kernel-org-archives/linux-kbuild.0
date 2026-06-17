Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1830386550;
	Wed, 17 Jun 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736730; cv=none; b=KVt4/wsoz9StlYqAMBBQmn7j07mOlBRtMWypJ/Dt1u17uNixpJWLrqkmFt86ltSSFGwGcBS8wPejvr03EMggSkgT19BGQtBMditIW/zZq9idR01hG7SnG/4qBXtEAIoERGUGXOQM9u5ODXSw7MOS2L1XXP/E01N1EnABXlZhgis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736730; c=relaxed/simple;
	bh=2MpUmFCvercMyWgJxUKrxz4mENY54SJeqKq1FlIPMok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZRQ7ZQ99SgT3j7cOpeumePqs906S8C5Rm51CMGfHigyJoNGz1VapI13KNnCnFY/otBMDMzUIZ2p82L9rTcXrYJeSGwnoxVpiQ0I9vVLvyiNf0xuJp88H9zRwoFswYCk9Hd7AyEco9N2N4CVal6pK4S9/GGyHXKsj7RPYtrwuvp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYefd8iq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYefd8iq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902951F000E9;
	Wed, 17 Jun 2026 22:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781736729;
	bh=O2/MzD0viURZRefh0ngu3v2stOzm36kmloR6dLhAn1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cYefd8iq2A6E/Jtc88FalvpL4uHgPucX74yugUBIjhBrtcbrDjUpHXUR3zlodR55B
	 heq3MrCv2KCtR4bsHt3f3o1LjtW2CHX9sdNKv83uoPiXlHUI1eFyrYVM/w/qZ5Fdh7
	 4N021B4PQ++2BNFvKglwUYhkv40cHAQ+DA9IBPZ4dl9jAKHQ2crBJ1DlZb6f598ydO
	 //n0BWkgpdEa7zcSviMZlqPlNled1aFrB7y7/8+HG32WPwYMKQMgV/ZHEX/jf+3cGg
	 0wnpKvH3EcqjtyECYvKFqBvXmxk1CVH6CVyDfEqIkuqJsVfb5uDRd0Esi9Lb1R19cy
	 1Kj2xTA48k3rA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
In-Reply-To: <20260610-kbuild-use-lld-for-linking-hostprogs-v1-1-70396fe42ee3@kernel.org>
References: <20260610-kbuild-use-lld-for-linking-hostprogs-v1-1-70396fe42ee3@kernel.org>
Subject: Re: [PATCH] kbuild: Use ld.lld for linking host programs when LLVM
 is set
Message-Id: <178173672730.3916091.16459126105160972993.b4-ty@b4>
Date: Wed, 17 Jun 2026 15:52:07 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 10 Jun 2026 12:55:25 -0700, Nathan Chancellor wrote:
> Currently, host programs are linked with HOSTCC using the toolchain's
> default linker. This can result in confusing behavior when using the
> LLVM Kbuild variable (which states that the user would like to build
> with the LLVM toolchain instead of the GNU one), as clang's default
> linker is ld for most platforms, not ld.lld. The documentation mentions
> HOSTLD=ld.lld is set but this variable is not used by Kbuild proper,
> only within some tools/ projects. Kbuild provides the HOSTLDFLAGS
> variable, which allow users to provide the '-fuse-ld' or '--ld-path'
> flags to customize what linker is used, but this is not super obvious to
> folks not familiar with Kbuild.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kbuild: Use ld.lld for linking host programs when LLVM is set
      (no commit info)

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



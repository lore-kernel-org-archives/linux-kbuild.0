Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0663793D5;
	Tue,  7 Apr 2026 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591536; cv=none; b=TDOLU1qizlqWpP1edPIUFkikhMw0xwTXWTShdRbdnjEfdjde1RKRHR803RzPZqDpBLJlJAsRdTtbxTopGi713ZPz4TC1lADdTreXcBassgnlXxTImrdYJxRTvj94YhgqpfZqsJ2UPanfLHGEUGDI9ZXml51cK7IhqaipEg6TAP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591536; c=relaxed/simple;
	bh=Ai4s74zvRJ8wMKtbIKaF1+NNVvAsTgZzuoEHrn+HyUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QyfBy+EqP7rBKcV+lSvkcYyPa64VVrun+HPXohtqF0XDSQbus1nBz4umm6gbRYHZrVm7KTW+rlqwewFz1tM5m22En9z5JulnEPSsACSO23eYVjhSCw0Cd2b90HhhNm5ugU9i3cPphNl2IbvwHPS63XuLLwL4/NkbFsUtjzOD+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loHbBv6g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loHbBv6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D25C2BC9E;
	Tue,  7 Apr 2026 19:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775591536;
	bh=Ai4s74zvRJ8wMKtbIKaF1+NNVvAsTgZzuoEHrn+HyUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=loHbBv6gJRioyi41kF+ylFXoPg3wY1JkgWJCQZS7ZppUTUjUfNUKEQ+0aUcodKnum
	 zR4Utq+G34bE3rY74XiuMIt+a9uszoyiedRiGk3H6SkDlmKM0SH2nvWFPPmjz6Vo3m
	 Ac1dFDHhOJpnT6DOQTbF+prwzgog6mJjrYWF58hgdiULwd8Xw1iRwq598VciYS/alx
	 Ve5vNZu9tmN2AtrNpEYblk0PVVB4aU7X0jlQ+7zlygW6ng81bTI0odwojkSd8+NAQc
	 4AN7Gd5UymhZm4kX2z4cAL1y2BhJOwqjK1SPPBtqwzJFVo22u2eVHrD2F8IZS+VSd0
	 VRnAyhVErnzfA==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain
Date: Tue,  7 Apr 2026 21:52:08 +0200
Message-ID: <177559137514.1148500.9864469979134006736.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>
References: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 30 Mar 2026 17:09:08 -0700, Justin Stitt wrote:
> Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
> the visibility of inlining chains in diagnostics. This is particularly
> useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
> inlined functions.
> 
> Add this flag to KBUILD_CFLAGS under a cc-option so it is enabled if the
> compiler supports it. Note that GCC does not have an equivalent flag as
> it supports a similar diagnostic structure unconditionally.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain
      https://git.kernel.org/kbuild/c/40492775

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


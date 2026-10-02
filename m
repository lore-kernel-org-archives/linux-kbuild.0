Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A968F38D3F2;
	Fri,  2 Oct 2026 20:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972371; cv=none; b=h59pVCiWppYa5qOyd/7CXYRI5F+fW9fCq0z2UN3nRMzwaTSUsOVGYNIjIYshdPesAd0Dy6lJ8pad93E0vsy2oUFUKKUxDXeu4dDwNd7l2oHW0uDQa8wOyENzmYCQ6AsLGpl76WTXT6+Ka5mknjpsIDFJxwdiqang61Sbot5tuU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972371; c=relaxed/simple;
	bh=g7rNGrAsJTDEdwMsuYjMkXPPCcqnVd2UiKhkVDSqirU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S2c9c6buDFYDuniqSyvBvCsjjoQ4AoHOffA4Ve1jLzBbyPyhlyt6MYFMTIDQoe1yyQfFxD+ocOxsMpxtFPW7v76yImlF3lh93/q72Ciq+R/lXTAMhXzo/H1pSEWbiIDVBTxc9Xrs578D8igzvjudN+q01ztcACtWWKN/C4877MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYk8EPBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYk8EPBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC901F000FF;
	Fri,  2 Oct 2026 20:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790972370;
	bh=35Xwv7BZPQnyggW6757ajRfm/1WQTpJh9WES/GErkaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JYk8EPBldEOXI6qCse7WgDnOcWaiHkC+OzSw9IrDScSJAFXMW2GvUyLPcobuNcDEt
	 8/fFPTEJMlE+iaYuUbJpy03BJVCGeZ0CLyeAdD+ZEBrCZa/3jrjmaHpMBmK61eoKGZ
	 9Yen3IxTbD4AgJ+he8Qwtz81bgXucGy9nd43hOAPRHhRmLo82B3jic1y4/GpLrStBG
	 UJcpc72AX5BS87vml9qQyyk4N8uSHb8obei5DxvsZkQjAR8DWKpvyaUjUCYnxIaf/g
	 XNd0Cp5Do9EiGXM5R5r6GiscukcOqAZovp73u6e2SqGe7uqocPH4bbROCjpZjA8J5L
	 blKrTHZ0d2fFQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Guillaume Tucker <gtucker@gtucker.io>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org, 
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernelci@lists.linux.dev, 
 automated-testing@lists.yoctoproject.org
In-Reply-To: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
References: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
Subject: Re: [PATCH v4 1/3] scripts: add TOML config to container tool
Message-Id: <179097236327.311770.8165714745450922135.b4-ty@b4>
Date: Fri, 02 Oct 2026 22:19:23 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=nathan@kernel.org;
 h=from:subject:message-id; bh=g7rNGrAsJTDEdwMsuYjMkXPPCcqnVd2UiKhkVDSqirU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkHBM8+UN0mk+5qd2OSp13u/vh+Jf94eU7HDzPFgs59S
 birfOh1RykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZgIRwHDf/f5HsobIk5OiJFc
 v6n623blss9/ndmltgodTDW6Ocf5+n6Gv7I9uyb9YWPc8q1Y8/u6+K/57ssvP2OSNo3KY1ObKVo
 cyAsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Mon, 07 Sep 2026 13:10:04 +0200, Guillaume Tucker wrote:
> scripts: add TOML config to container tool

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/3] scripts: add TOML config to container tool
      https://git.kernel.org/kbuild/c/69cb84e259b16
[2/3] Documentation: dev-tools: update container.rst with config file
      https://git.kernel.org/kbuild/c/56a124338eab9
[3/3] Documentation: dev-tools: refer to user ID rather than id
      https://git.kernel.org/kbuild/c/fd1ef9b669e96

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



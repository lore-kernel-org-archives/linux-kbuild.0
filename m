Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852223FBB47;
	Fri, 17 Jul 2026 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293029; cv=none; b=NluYFIlO6YVewOHEynAfU7u/NOEzlvKlBUt2j3vSoyFmYqmFBn/iJNPOPzjLox0qRquu84OSinimfgIbscxSboGNmh6cOWXv2OqEGUltzEQc9nekKz3IBeSAJPZfji9W9Fv7cGg2cqGhu4FjeRg2PVWqO81Nw9g/dpF/NY5oqAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293029; c=relaxed/simple;
	bh=uGm1dD0hllx7J5A+PZcz/hBVa4TPv+HV7yqi/blkTds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bc4x7pc2adesIGOF4r35wXFk4jFR+9EHECukWI/WA7L8beyf9MkxoJJlxZj7i0ff3vLcBK1MY4ZJ0q1nWmERNcT1IOzS3W7+kouXhEOrPkKKbBxznnL9qlF/0cOoZ9YZDFj5WNeIVbyo8t5Em8UNcx6PeCB0Aqg1t0b0ncNzol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DySYTvnU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DySYTvnU"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B4D251F000E9;
	Fri, 17 Jul 2026 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784293028;
	bh=eJSiuVtIuxtECGcjXEZ1uHFjFO4eeXXGrOs1hRr0mNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DySYTvnU1r+4/SLAyFuPvkhtVsu5Y9GEK56KSPAGK8/76mPZI9DdtzoUUa+/ZMcbx
	 RS+jBUz8TOrBwCKcUrvp/Zz+dHw1qes0lpu+j22XUC+JsglQklYmsyMTeEYc6ZocrE
	 4I+GRi7zbjKSkDgkYPD2dSkkPVEbxANIvp9Gly2MucdI+mSiNTVXnsJoUjgyPhuwuC
	 GaMZsPe39Ls1kZidc+IwtO6YWUNVIoZ6k5zpWl15OiefqVSIUneoHeiIvi/WbzcM/B
	 AXNu0MRCpbJJQ0UtXf3JIGnl7lSPEXRnnSB3e8/XyudM2Y1fsksWqirDCMjlpT/r9X
	 iAsyN5cTXA9qQ==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kernel@vger.kernel.org,
	Martin Weiss <martin.githubacc@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Martin Weiss <Martin.weiss2410@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/4] scripts: fix spelling mistakes
Date: Fri, 17 Jul 2026 14:55:49 +0200
Message-ID: <178429289936.1083038.15159314533495342459.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
References: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 29 Jun 2026 15:28:06 +0700, Martin Weiss wrote:
> 


Applied to kbuild/linux.git (kbuild-next-unstable) with a minimal commit
message added, thanks!

[1/4] scripts: fix spelling mistakes
      https://git.kernel.org/kbuild/c/ab3f7f5e

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


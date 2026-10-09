Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74173EEAF4;
	Fri,  9 Oct 2026 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582305; cv=none; b=AZ7F26Jp13+GqTI+bLMOdaJTYkQnjwNMnR6HxMuKvGVQWpg5FPKf6QdQqNLtzzBNkTKjYPGvGRN4vdJs7ERiRtysEfVPfx4kNiBoHJ1EuEorrQYGm0YyDAV9fPe8LsMNdk+RGQIbDAhFIQaowGhBdQ9E3fUqLM5kFGRGt63i544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582305; c=relaxed/simple;
	bh=Mx+Fa3qwtiruTRAvxKYDaJtw/h36DYYsB+OVvBpksoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SthEbBwi6/hdISXuNpqiQxwi1vruQDsbNNkDFUq7B6yhHohJDxrismeyO6iey+7b8ttL98CQW+hgVjZ7owk7ahkRsaaXvWsA3Tszviwo/4+jkxXb44lnOlMLEd+u90kczmWI7EJlZIj8/M1NDQ5t/56t/85EpkVdC+keXKStnXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgOFAEQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgOFAEQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630E51F000FF;
	Fri,  9 Oct 2026 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582304;
	bh=+y+EbJegof4frOO48AQVjywih4C5zhgf/nF5m6CeXSs=;
	h=Date:From:To:Cc:Subject;
	b=kgOFAEQ8iV0QomKkcqjDKPJde3Ih42AbStErVhUAS4C0/efh4w4CWATRUgk1SMu6N
	 FfVu3Qq+BOhVDxJgysPfxKwUamojbrUOVNKTtRs8oRbuUqgLsDsYZJt+Adhr9/iFq6
	 ME0JHml+esVCzDhuVjCdPS1gjI5LdMY/4TLrFx31zz3D/lmqI1b5QF5U5Re6ptCFgd
	 BvRvL/ZHYlvXq/dd1ECthcsnYTVxO+Y0zgNl5Ew3yuakw37VN5k8Z87XkXJN125LnM
	 wrWwR1KDBQprvx1OxyLmnuYqUv/PvYo/vCLFu42gfwaLcpq/Ue9KIjrr1yj3gdtJyh
	 Py58K/RaT2vRA==
Date: Fri, 9 Oct 2026 22:45:01 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Build breakage from renamed '-split-machine-functions' plugin option
Message-ID: <20261009214501.GA905361@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rong and Han,

LLVM recently landed a commit renaming the '-split-machine-functions'
plugin option to '-function-splitting=all':

  https://github.com/llvm/llvm-project/commit/3e6acc87c58843e551d6e8e4bf06c26712b04622

This breaks builds with CONFIG_AUTOFDO and CONFIG_LTO_CLANG_THIN with:

  ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-split-machine-functions'.  Try: 'ld.lld --help'

Obviously, we can handle this rename but I noticed that the combination
of '-flto -fsplit-machine-functions' should add the corresponding
'-plugin-opt=' since LLVM 15:

  https://github.com/llvm/llvm-project/commit/72acd042bad35f78232f17addc02196a7af1a6e9

So is this even necessary? Should we just remove

  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions

from scripts/Makefile.autofdo and rely on '-fsplit-machine-functions' to
do the right thing or am I missing something here?

-- 
Cheers,
Nathan

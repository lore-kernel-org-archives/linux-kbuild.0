Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D71F8755;
	Thu,  5 Mar 2026 00:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671007; cv=none; b=q9GGmxBpzD/jtgO2UXapV6eDC1bEoSP49eMcbUw/ZMsyyxwlPEEuhcZIjdAFmaAzSuwN0cTM9tLzWRUQUt1oFDtVAIL/vR4Q+iFOpUwvNFqAvq126ZRcSwzaOXhykSPv/PU/GRGm5mVDXeLcA6gCQm08vSzQJD3s/ajQNv7TjsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671007; c=relaxed/simple;
	bh=YD8FUpa7/2pLVb4LtAEdgTwaIc8B5tVuTSKvkb8Xuj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JFw8l97VFrgYkySX5V4Z+FRIsa2yQpTYGgSqTyCOFZNovew7ZLJx6HOG4UjsriLC7nnDWEYKQ8sEh4tpy1uT/MQ1BtILsV6okdPDWE/UjtZ+E8wI/qkGlfgKysIvHmd7nkdlaawxgrH3LwT2LiBlB6xBiFO9Uo4uwLyJUXZ8JCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxi9b6Jm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxi9b6Jm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2FDC2BC87;
	Thu,  5 Mar 2026 00:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772671007;
	bh=YD8FUpa7/2pLVb4LtAEdgTwaIc8B5tVuTSKvkb8Xuj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dxi9b6JmExAggj1L+HzGaS26FpKJ6lEEEMsZW3/mDd8HdAGmMVCirQtXdkDsAJWP8
	 jOzPheqRE89h7scG47PZCVWSMrOsO3zTTM398iWa11ApS5KIIWM1rKNEm+upEHGXOC
	 sbPKzDa41i6oo2c0b6mgBiAH1y4CHvYjAS2LKYZuOPEdi8UXOX8OJq0Mof0Ke4udrd
	 yF9Xzm6g9dFLQvuI5OPxo65Lyh9Zpg0tjG5JibhIDbDz9Rg+Pld2V+HHqsw9XHglq6
	 29mqgl2p2StVqGq128sIYcmO2EpHpuHEmuIscCQFab3qh5XdAMIBWaZLbS56tahYtF
	 a3asGBLhJHj7A==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sun Jian <sun.jian.kdev@gmail.com>, Florian Westphal <fw@strlen.de>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
References: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
Subject: Re: [PATCH] genksyms: Fix parsing a declarator with a preceding
 attribute
Message-Id: <177267100491.1730256.722308315936869297.b4-ty@kernel.org>
Date: Wed, 04 Mar 2026 17:36:44 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Wed, 25 Feb 2026 15:07:17 -0700, Nathan Chancellor wrote:
> After commit 07919126ecfc ("netfilter: annotate NAT helper hook pointers
> with __rcu"), genksyms fails to parse the __rcu annotation when building
> with CONFIG_DEBUG_INFO_BTF=y, CONFIG_PAHOLE_HAS_BTF_TAG=y, and a version
> of clang that supports btf_type_tag.
> 
>   $ clang --version | head -1
>   ClangBuiltLinux clang version 22.1.0 (https://github.com/llvm/llvm-project.git 4434dabb69916856b824f68a64b029c67175e532)
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] genksyms: Fix parsing a declarator with a preceding attribute
      https://git.kernel.org/kbuild/c/d2395bb194ef2

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


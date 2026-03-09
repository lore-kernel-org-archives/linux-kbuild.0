Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F236C5AA;
	Mon,  9 Mar 2026 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089094; cv=none; b=Nbcxm8wXsMgraYlfUzJIdF6fHPeyV8zxDQ6TFRwabvO8R+OJJoZ++Pm77zYASgnaC4lrNq8G+aRojPwVyhJZr9waR6KHNbN1jE5FS/IWp44AotJTx7kJVvtdKMY9zofn0OaCqQ1FsJbMWg//P96ufbZepMH3n1SKrxytZu9c8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089094; c=relaxed/simple;
	bh=KMAsXJi/xnHgAkewg/8K0BayGesvDOrlVfMD4uKkkN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RlsIpFpNonl8VYXNpbWLZ/Yu1dmSOgiD8fwNnNku1F7msxi4mogMxuAnJG8vcIhQCPr57cbeETvwBxGJ1OpFDv59CgAYix4vgGmo7YsaYQJbqZX3cyIojVkzs1w5I9g8pEhqAsQLo9K5NAT0iG5T7XYnnw0syWgdqFShOeCGqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZEHbm07; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZEHbm07"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A405C2BC87;
	Mon,  9 Mar 2026 20:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773089094;
	bh=KMAsXJi/xnHgAkewg/8K0BayGesvDOrlVfMD4uKkkN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bZEHbm07d4vK1HrpKwNGZz034U5/wncLuybQq3rLbqRXrn8oiWv1tjfi1sL3HASE0
	 bs1mAhS6kWxzViW7YLoehZqqwYKIgwPsc3VJk52DbzQNS0Izqq8DGVHLx5TGX0HEHQ
	 wAIz4IcT96lbRIGcT8fONc5BSwxmf+OvZNfRuNI4dlLyX0Om58Cw94i4Sstv0w7XQD
	 eDBHbxgtSsn9pCyqMh0IEEIpFD8viq0PJQppdho9YgXaL6m+5nZadsPy4+UXR+5aJQ
	 TA5vDTkxuKSaEInbHDRVJdhfdNUTS5izT9etQkZl6YDemAju6tHudBLJysjj48A0wX
	 PKdaHspxvInMQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>, Daniel Gomez <da.gomez@samsung.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 Weizhao Ouyang <o451686892@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260309121505.40454-1-o451686892@gmail.com>
References: <20260309121505.40454-1-o451686892@gmail.com>
Subject: Re: [PATCH] scripts: kconfig: merge_config.sh: fix unexpected
 operator warning
Message-Id: <177308909202.2903875.13663071115217399607.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 13:44:52 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Mon, 09 Mar 2026 20:15:05 +0800, Weizhao Ouyang wrote:
> Fix a warning for:
> 
> $ ./scripts/kconfig/merge_config.sh .config extra.config
> Using .config as base
> Merging extra.config
> ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] scripts: kconfig: merge_config.sh: fix unexpected operator warning
      https://git.kernel.org/kbuild/c/3b4a3a00de877

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


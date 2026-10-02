Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3833F7AA8;
	Fri,  2 Oct 2026 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972513; cv=none; b=jnYBtUR6+minkSY4YR0BQZuJFcIKq5MipXS4zoLCYBIJD9Xz7lu9riQTNxV/T1XrSljRvcDA+/s6TM3I+wt74J5z/dBJNHtfDclyRN+Jp7GE/IwzInX7sMJg07lwznQUNBuWVeOcZFb9FxYB+S51jzzyBSktWF8Q7Xtb/lpaN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972513; c=relaxed/simple;
	bh=JAk1rcoC+ZKgLMQE76wJCQ/w8s40aZIErj5/Pn3wF/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sEWEYe9XfkF/+9H4kXJwVr4yurzOI/7FIBCEXecQLTbuiMqNUCFRyiiTzj7EVWndyGNkkfUo5WBzOZr/CO6q53eV/9q9gtaAhkTO63DAEmQf4VLYn/Nwgybt7VNnhDvwBfgtA176de/cNN0B/hfWohFoOnvFzqtFBW/KWrWGyi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf8TgO58; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf8TgO58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA1F1F000FF;
	Fri,  2 Oct 2026 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790972512;
	bh=+wpp3jBGp8t6vboPKVQE0NOIVTKFslcW2ycEOBymQCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cf8TgO58R18oB89s1sQqJpJWQVZ+bQHR7erXR4aJPnVVjFvMa8iDrd9UsBsW80Vnm
	 4Fh3N+Hl3H8UW7GucigAmDGpmZc/IZ5dqWSMM1erv5VK1hqQRO8eCTFAo4Q+HDMAkt
	 yZrrTdXfCmfgpcJClTi8HhBx6Wx51pww5ZxlYyagSu50ektLomyeOrLEh2gw4O1lNt
	 8OE+zuqy3GfgZTuYAI9WdFq8oY3KEgil2bvWx+D7OOzXljq7YsmPFDINBPqaRvlJed
	 CvvgW+ZhDx8zBS9JY6L7wvOT6/gnega5MGfVe097uDDU3e79BkDSO5VGWzK+EezYpr
	 ckXNrdhLLtgkA==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-kbuild@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
In-Reply-To: <20260915104331.255636-1-jani.nikula@intel.com>
References: <20260915104331.255636-1-jani.nikula@intel.com>
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
Message-Id: <179097250601.311770.12867462377142523689.b4-ty@b4>
Date: Fri, 02 Oct 2026 22:21:46 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=nathan@kernel.org;
 h=from:subject:message-id; bh=JAk1rcoC+ZKgLMQE76wJCQ/w8s40aZIErj5/Pn3wF/I=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkHhKI79IXLTHbt2PQo9FdXaNbJSWqnrp3p8taOthVhU
 BLZOqu7o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwk34jhv5/COgdl2XdbRFY/
 bpjkLyMcp7cjunDL1J85ZaI/+yc/vM/IcMdKxfb2uj6u9N6u1X5WN0SWtu92ZN/5psYwMGPzGuU
 iXgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 15 Sep 2026 13:43:31 +0300, Jani Nikula wrote:
> kbuild: add header check facility as a manually run static analyzer

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kbuild: add header check facility as a manually run static analyzer
      https://git.kernel.org/kbuild/c/26d665bef44fa

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



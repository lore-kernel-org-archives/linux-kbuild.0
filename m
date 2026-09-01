Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224526F2BF;
	Tue,  1 Sep 2026 00:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221664; cv=none; b=j6e46Qv+NzZNbr1mpGkyqRevAqLrDI+jEtSbRYWo8reBNNQTCT8KdopjpyCZaZJ3FbC2NsWw0tJAIXXkhObPPAlNitPq2tQdrHfc/cH5+aPCF4wKRNqZMZr5mJWYmgOrxV3MOoNsb6oRV5Uai7c234OhZ/b4T1lekVt2lyUkI5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221664; c=relaxed/simple;
	bh=hRTCODxnQ/f40msUM4jZ7NE9jLLGVbleYFWiIfqFtL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uQ6MVqB6GsFIJrV4nFbI1o+zM9iRFYlU2KVqUWPf6HYEp49nj1V8QqyJ3ES+JmThtFo08jIIEE3PKT3GxrcyT/gvun35X3FSWeu+A/jKK5Q0dDoOzNuT4W+FvceEQTdlGMonvVblD2r6onbLNI1aK0VfBz+KsVYTwabK3pBV9lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kM/jwHzn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kM/jwHzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8647C1F000E9;
	Tue,  1 Sep 2026 00:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788221662;
	bh=bviLXIgDMoT2/GST/1fkUG9q5AxpxHC0042/KPvmMqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kM/jwHznVzFw+BJSVrw4piz2uKlKRIfahRO7WiK0cf/2g2sJPjyjsEQwOET/7CxwK
	 4QNGVqvwiQ04t6p4hUKbqhWIt2FPPyDLUf/lZX7U1Se0Iv/tEDoptnQMALH691dI0R
	 xhM/aRkQByf/XPfQEw8UrACU62OU8x1PbhmtZJvs7BeXk7hNL/kZfSYPnuNLLldAIT
	 X7A4tW/Vg0DkU25Gz+4AZ+o6EbBKnEUjMcWN5kJxoMJ0gy80V9hl1XiQqd5uRwMhwl
	 cx1Uk4pSOZBRCPEl6rCR7Gz3noq9cWKJaP/cyP+jCXPA2hi7sY24c/YQOdl8unwGrv
	 t/gtAJi2IDPig==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: kees@kernel.org, vegard.nossum@oracle.com, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816215354.1499059-1-julianbraha@gmail.com>
References: <20260816215354.1499059-1-julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: error out for recursive range
Message-Id: <178822163468.4128818.4254191380004498781.b4-ty@b4>
Date: Mon, 31 Aug 2026 17:13:54 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=nathan@kernel.org;
 h=from:subject:message-id; bh=hRTCODxnQ/f40msUM4jZ7NE9jLLGVbleYFWiIfqFtL8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnTJG6s2pIosufTtcdqWW3+NXtXqf3Kbgoxs02vjfSzy
 0idszm5o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzEr4KR4Yf5+2czPqfPUva3
 v6ByN6LMQoWDrdH31bp5VUKHdW7G9zL8z11QfJP7VdvZ9YoX3e4fy671rHF/qTtVukNvak/m670
 pHAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sun, 16 Aug 2026 22:53:54 +0100, Julian Braha wrote:
> kconfig: error out for recursive range

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: error out for recursive range
      https://git.kernel.org/kbuild/c/f9f31f5f13b5e

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



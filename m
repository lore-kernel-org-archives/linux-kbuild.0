Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358937FF50;
	Wed, 16 Sep 2026 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541713; cv=none; b=HeTQw/dtqaUdTA4Wuvgw9PLAj/6QQ9Pzt6FKQY859k0Ia7elr7EB9g9L88Hgi3C9dezQRb8qyUSMYHI1iYihUmxGgVwcgJ6nlQriF7E0V7qG2E/XUlv6Aqgxq/d61mdEdvA43ufMYG31WyE72q2AcQqWflibO7NiLF8+4e+EZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541713; c=relaxed/simple;
	bh=gmCyq99m/Y2kjvxT53XUEfGSuXCbwQPwZ20ia3jEWTI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u9+8DMHoo5oV2QPUB1nju9Klb+UfIk/IyQgwnZjDsgH4Uwwr7Qb+TAy+5LbX4iQ+UN16gMNIiH/i9+U9NkyeFROL9pq+QcWtLtUAAJEYEv26CoYBIMYWMkI2FybqOpNdT/S+2HaPoeUu2aM4nkaIBpZxD4b9ERYM5jx9w0sQSSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqATvzKv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqATvzKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939EA1F000FF;
	Wed, 16 Sep 2026 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789541712;
	bh=pI3c7sR+lcohoH9PWKKSjyS/ad5hTcsa7OVIdMBndec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PqATvzKvFAkJzCYchF3ZBAYiBo5BBYWusuJb5FhLTVmuvK7MVGYLST6PFFFsW8bXF
	 tK794uJdp6KCYDMFPDkdSrlEKivuN8nuRXEmXnJJs7eoPdC13Qa45oHzXbOQvShbgs
	 eMq1wlHkw8t2cPomcsoMjrMwgr7x8eW5ehLQdoEMRN7DE+YBHigm8ou/oKgtRIUi4w
	 AgCuAQhGgpWhrP9S/gpyYNaK15wtB9BahZITR0jCYhvha2IESqWnIJeWJJH6lAgr2+
	 ZPYQH8Xk3jNWRoHOkwRvz7k0bkkZ0e9mvXkvkYsKKrjHcw49JEf9lZi9iamL9fWRVN
	 hQmrzbGjMGNcg==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Aayansh Ranjan <computergod47@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915062613.13761-1-computergod47@gmail.com>
References: <20260915062613.13761-1-computergod47@gmail.com>
Subject: Re: [PATCH] kbuild: fix grammar in output Makefile .gitignore
 generation comment
Message-Id: <178954166847.3651306.5651675539464102219.b4-ty@b4>
Date: Tue, 15 Sep 2026 23:54:28 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=842; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gmCyq99m/Y2kjvxT53XUEfGSuXCbwQPwZ20ia3jEWTI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmrbL2aVF+9/vm9T/2Dm7873/3F2omXl25LfBL3YvP3o
 wynTpRO6yhlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATUdJmZJi41sLtsZHI6Str
 9Ezr1locva5T7/IxR92AU/zxrwDRyZqMDDPufba+slj15LLXdi/2Oi059tauYfbVVQUaln2Pi3V
 /L+MDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 15 Sep 2026 11:56:13 +0530, Aayansh Ranjan wrote:
> kbuild: fix grammar in output Makefile .gitignore generation comment

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kbuild: fix grammar in output Makefile .gitignore generation comment
      https://git.kernel.org/kbuild/c/322b0463f30b0

I adjusted "when" to "the" in the comment to make it flow a little
better.

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



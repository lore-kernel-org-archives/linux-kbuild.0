Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA341E6C9;
	Tue,  4 Aug 2026 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872047; cv=none; b=kGTaK5aXLNteqa/adaw+GQEP2LdA96CM14JPpZcsL6rDu7b8wMWPEtyA7rdz7fKnqonSPFjh8DPeeWP6B9yHGn/+fJM3SUlamof6kgO9MXyYd/GvSW1fQxaEMjPU9xOHRjV7DVfP8/ypLAW0X3Y4RWD8oOI7lzd1n3yn039Hmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872047; c=relaxed/simple;
	bh=VIG63k0rs9r0n53eFlmc2tdQ0gxQH/Irz3qO8YG/XkI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KQUyU+Q1Uq69HbvMVRwYqyQ6eVDBke2nPpPYIsDISHCqY3FXR73f6FxjsEKHngY6Oh7aoWFgurMIpYtbNcDoBLmXj9gkZOplj3yQK/lc5KUgmQHyUJW708bONmBjMyGpYGGOOLXUKo2wGFYW335HDWvbmsare1x9SbCj5KrZ+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SilVc4yy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SilVc4yy"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ADCA01F000E9;
	Tue,  4 Aug 2026 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785872046;
	bh=SrgwJzyWnS+D+ogS1+oSUDFEj7u5tHrmyXpSA9SdxOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SilVc4yykBI4dRywjYr4hy1pjJJpbogXApZTY2//MFV6iCFMvw9DVn5UmgrAskmVm
	 mXeDveF6Ie4CE81/vyOMi5KmeyoPqjymiCavKCNwNv765A0TAGZVZ0VBVbrfZJHmD6
	 sbU32wfeFKebzLDX2eiogdGWW/7Hd7M061LTAcHtaFbb0KR+SPAUCvn48X1M49vVXJ
	 tbiWqhZ6Cs9m+9ClieC+4ta9RygRROo/sDi7uh7jwrP5tiYKhaBD0kGIb0kejULwfG
	 MeB7Zqf3elTG5IjWHFqr7qHdCSenyyK2sCZ/0tka1Vw3nryQDW3Dx/Zdf6SIr1EgQ1
	 kC5BJTTli0D+w==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260804141436.1451211-1-julianbraha@gmail.com>
References: <20260804141436.1451211-1-julianbraha@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Julian Braha as Kconfig reviewer
Message-Id: <178587105478.3634570.4794228405980131361.b4-ty@b4>
Date: Tue, 04 Aug 2026 21:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=VIG63k0rs9r0n53eFlmc2tdQ0gxQH/Irz3qO8YG/XkI=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqcjrSOyyVkJh8tgF+DXR76Xu8jpIkzdhCl/x6O
 VOQbFMvLHKJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCanI60gAKCRAHUgpwFiYS
 aU9lD/wLCpiRqET0ln+9rgNEPzUm5deR5N1bQJIhDFlGyWDtLByZWhjLHkIpBnHBFMIeok4qWH2
 Q9pjvzEQZRQ4johKeoTxa/gSlLKWgqNgFWMKRcIu9gQJW/UX+bP7ncfpqKqHFgUiqD3HWdDddef
 411tLqoYlhIdL4Jq8H5qRWw88fIi3BWL1x4h6uzMwd3OtxLD+BfjTdytNDzG4/xc5f6GWGVo4WI
 81o8DxaF/0vYHsPgftFrxR3m3INh3SRTsvgjVzooKgQl1asR2U22m20VrpjLgu1G4lq3cayRAG9
 4nPBhppN4rTBP/YIUGFPrhwpWN+RzQ5SpjwZ719QDLcVrWDtI5OQsH+Y9OG4GLTlPe0P8ydeZTn
 xz2qXjl5wim4QpNeClfHd/3eFz/kwylDc+exkEC2JbA01Xc6ibXep/JbN6FIdbt0k9UChPCqA8R
 /0pzXnaTNiguVlczCpZFTeBybV4IRpeZ0mxK6ducxeavx26t7pn+Ojlrx9tak9nB0MjGaJwbj8P
 6QfMGgKSr6iJoO7DOUUVsqAi7uktqViNqJ5DX3+EYHuoXBfqTW51WptPsOdKRdm/FkC56oPreyF
 kA+HG7fKF2zQpkyxf2HSEJmmJpB5zTunB7sjAJ1d5RPuCELTev55zePd/cXGcHEBTbbaGa/2Oxl
 RHrxUndQ7OjY+7A==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Tue, 04 Aug 2026 15:14:36 +0100, Julian Braha wrote:
> MAINTAINERS: add Julian Braha as Kconfig reviewer

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] MAINTAINERS: add Julian Braha as Kconfig reviewer
      https://git.kernel.org/kbuild/c/40b2656b

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas



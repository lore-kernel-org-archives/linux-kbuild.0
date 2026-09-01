Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBDD26F2BF;
	Tue,  1 Sep 2026 00:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221685; cv=none; b=V8U6mOSaPUrE7KDje85OSDEaj7sKg6qUXFEQK0LZTK0zHpLFGho+yW66PSIsXsEV6FbOu/po6ETunf9yfD7RkW6iExQDelujqPNePklh+vksgDL7UwbXm8NDPY0/kznWWNqowKUcTGh09DQfUT3hD280X6yZNlkCiNZObJdN0lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221685; c=relaxed/simple;
	bh=6QnRCJxzQeewA/WLp/sa7oVJCBvRnBeW9f0afWYhGGk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Siy4FS4d0Vl0FauWKHdogiaHILCCndCDNB2fivo1WVZbq+UBjYRKqwdSWje53H/EV7ZmCpQm2t5w9if2Lz0yvCbkiIj8pO2OI7c6geZymaGVTxYdaZ8iZi9ATvvzRgStsmCqPxqx76udocS0NS8NmKfrRxMB9Ec4x6mh5K3Jeyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APAO9Kna; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APAO9Kna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB9D1F000E9;
	Tue,  1 Sep 2026 00:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788221684;
	bh=i527FF4t9w1qQ9Kovh9C3scZJG3zs+tYyxEjs3kSdVg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=APAO9KnaOibOBOWy0GAnSaLNSb7dVA7zHVtstImno6YM7uyTlFu72gPnZspg+V1zk
	 8Uja/dg9eDAwsEk8yaiCiirdghE/v2lSnf50didR/8xNLU3mX1r1cOrcxrkKRziRev
	 wTPZgs8OkChweSM8kWTDiiXiJhlLA3TQ6jWd1IjnkW7nIdONjzBCJw+A2JX4ayUFHK
	 +hW/0Ul1sUegI7UKlMiSMAmDKxDB7WaxbDuLAaHhW7cYEAiwjPWxfHliNyN6XeAjHo
	 j1yDlMiLD7CzH59QQEmvxnCAvos0BF3xfFNcnkXIPcgG22f4zHnVDZjG1WsKqqaU4I
	 T9vx4Lu+Dvxsw==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
In-Reply-To: <20260818204804.2985008-1-unixbhaskar@gmail.com>
References: <20260818204804.2985008-1-unixbhaskar@gmail.com>
Subject: Re: [PATCH V2] scripts/mkcompile_h: Update LINUX_COMPILE_HOST
 command substitution syntax
Message-Id: <178822167451.4128818.6332235796128056658.b4-ty@b4>
Date: Mon, 31 Aug 2026 17:14:34 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=778; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6QnRCJxzQeewA/WLp/sa7oVJCBvRnBeW9f0afWYhGGk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnTJN5fEhJwstbeklhZeX1Co/aMlAjj25O18ib6fFgts
 kPtThhDRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiIUCsjwyojvXmHq1+Jrluw
 fO+8Zazr/+5aGbnbge/Me1Zvz7Ara0MY/rt9fyITb3zN4/6D0pX6ev9CNyWfXXD7Su5vIe7kpz6
 L3nEAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 19 Aug 2026 02:13:51 +0530, Bhaskar Chowdhury wrote:
> scripts/mkcompile_h: Update LINUX_COMPILE_HOST command substitution syntax

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] scripts/mkcompile_h: Update LINUX_COMPILE_HOST command substitution syntax
      https://git.kernel.org/kbuild/c/72c442e5bad35

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



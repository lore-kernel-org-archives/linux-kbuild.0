Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABEF35F5E5;
	Thu, 24 Sep 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264476; cv=none; b=gguysLI1ZQYbpvfesOPDnWIrl//p3q7ZLUyD/L/1LInshNWsm9q2iKHKJhvBD6ik68zywUo5ByzIgQKq7WDCXEwzT1kjncgMeqfyBqgG0WitML2nZIrq93RF5ZmrVL9wOYK+FZlNcoGXxJrLFHohsYEIVbmo2FiMFm3+bIRH92k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264476; c=relaxed/simple;
	bh=H4TUq6rKUUid0N5u4yF7JAwv/s2/Ils3gg5pC//BOc0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rXCNvGXcTbPauxLUtJzVjpJWHVRUSOumhS1IeCjTL8AyGQ6YnZeOWlqxGUdsOkac4cYqXNMTSr8XF9NGqXnRovsVS5KhypiDCUaKutp7sihrv1cHlr552g8hhSNuh4wn3hkIQK9oDK9kw+8yaWqWAgH2v1teo86foM7hPsrNtT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZ4sJoIw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZ4sJoIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89EC1F00893;
	Thu, 24 Sep 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264474;
	bh=5GIFrNA3YjFb71GWK7/owSFpiu+yV6iJ0FkdF+To4go=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LZ4sJoIwrqC2GMQ06yooCB2XSFczyDJU5yjSylI+pyRjdaDIYUYUX6ku59wJjYNXT
	 Q+jVkJcrkHF/uQi6n7kofkp2Ob3AP/fjW32/4obokekWlLK++eNS0w0skIIk4jFGun
	 cn/P3gf0E3mTNUl80nLdq+2OoTO6ewFfI4PnSbwgyTZN6kfMgShUbvqZ02k1jebFoG
	 HIxFmtg4aFwjDRvLabtYqlfoOiXnrEzZ2389yYvl/F/0DqTpwxOqeP+wisH7Df2szX
	 O75Q1lSjOb0yyGn+K2q82ovW7qG2KNVtP5o+qow7h/6aTJ77l13OhZJpmOINHzjntE
	 8IMBaao51mcnQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Dmitrii Tulnov <tulnov.dl@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Peter Korsgaard <jacmet@uclibc.org>, 
 "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918213430.3-1-tulnov.dl@gmail.com>
References: <20260918213430.3-1-tulnov.dl@gmail.com>
Subject: Re: [PATCH v6] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
Message-Id: <179026446065.3085989.16924161759237399526.b4-ty@b4>
Date: Thu, 24 Sep 2026 11:41:00 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=739; i=nathan@kernel.org;
 h=from:subject:message-id; bh=H4TUq6rKUUid0N5u4yF7JAwv/s2/Ils3gg5pC//BOc0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlbXSY6yP57J3+/69xRX45Lwe8XTKq0K2eTZ8wUrrZK/
 7DyxWTHjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARuT0Mf/il/O4cUuT5dTmL
 lansUurdhfU11fZ95qteimuHLQu+yMnIMDtcffWEt2YtBRq9S9VPlTQf82PcdKFoksb8FXGrE2P
 NWAE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sat, 19 Sep 2026 00:34:30 +0300, Dmitrii Tulnov wrote:
> kconfig: warn about malformed KCONFIG_PROBABILITY values

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: warn about malformed KCONFIG_PROBABILITY values
      https://git.kernel.org/kbuild/c/9f01cd3a32439

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D806324113D;
	Thu, 30 Apr 2026 01:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777511280; cv=none; b=BHX44g/BJbIPlmEMC+t8IcMaSnHBUhzmseMu16o/jcDATYgPoMNS2xFr2IMGFHWHYlAe2f9DAqpl60OL37ppJ/Rr5hc5XRRadQYFvCpFGG0Vvh3pdEpeH7NWyuQnQNx0Y9Ow7+470hmXD6Ck2vmx2ao1KvkNdVpWIxuyb5RsJIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777511280; c=relaxed/simple;
	bh=gYOeEX7WvEeLpMuFmH6ci2beICy6Duy68V2is6dz5cQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VstWc9SDnIV4H0EnXIrj/GADoHgwD7hpBtenRxTFG9R40vmttR8iTvi58jXVZ+s8sBMemz1hFXcnOWmh9+2iPILHK5sE+hoj4aqqLxe3VRJUi7gjObOpHYJY9dwz+ylFDhq9vXceyLKl/8NNjpyABhyN8kJA7YcKHas7GztdlJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGktBMQP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGktBMQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAB8C19425;
	Thu, 30 Apr 2026 01:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777511280;
	bh=gYOeEX7WvEeLpMuFmH6ci2beICy6Duy68V2is6dz5cQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PGktBMQPOxLpqZriUUb3W/qGA3npC06zbEhqm6XaBnUXHOeYXIDM2PMBsZvV4fCBT
	 rVlxsxAmwu4jd2Vb4k3Ys8xntjafy+qtKKDd3xxQR5d4YbmeFwUeNhbGT4rXkWfQ1i
	 95yX4Ry0nwkQzZdoRVAEsSrGEB2AuJM2CfnVTpEMldtXVcpL9jGbDHCobZIjIh5U3Y
	 Tf7RSn/YcxPecNlP45j6ykig0TsL7imJ6t3pMbuzDyJXSmdwIc1eLhdKBVJmCvgE4d
	 oR0Lcn8I1ajV1AH7NRid7aVGzo4Xfrq8sb7BhZ1NLVg0f8mAPHtG/klUApZXUKiBz0
	 tV9ASHMVN823Q==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org, 
 Xingjing Deng <micro6947@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306021709.27068-1-micro6947@gmail.com>
References: <20260306021709.27068-1-micro6947@gmail.com>
Subject: Re: [PATCH v3] kconfig: fix potential NULL pointer dereference in
 conf_askvalue
Message-Id: <177751125362.3341838.5274655367405314917.b4-ty@b4>
Date: Wed, 29 Apr 2026 18:07:33 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=754; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gYOeEX7WvEeLpMuFmH6ci2beICy6Duy68V2is6dz5cQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfVudZWoUrif3cNKX/My9n/IOPbNZ9fixLE/0S7kVuf
 7AxoDOko5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkz5/hD5eSZN3VzqSa6q9d
 Tp++75whYStzZwpP6KOt/hoxxgf2qDMyXA3TPiHdt79PzDGh79ap0qkhCz1maCca3f6qpFzGyyb
 DBAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Fri, 06 Mar 2026 02:17:09 +0000, Xingjing Deng wrote:
> kconfig: fix potential NULL pointer dereference in conf_askvalue

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: fix potential NULL pointer dereference in conf_askvalue
      https://git.kernel.org/kbuild/c/b9d21c32dca21

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



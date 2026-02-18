Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DC33EB0A;
	Wed, 18 Feb 2026 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447743; cv=none; b=DB9ZJ8AfKISFbkWRln3xAP7RUZidxwHwKcIoV1bZgfjPWLIad8FXG3o9Y/Gn1FmLd/2W9jaUIZiGSreN6GworAMQlECt+fOQ7CkZAxQeTZwl0SG8NgvdQYq5ximo+Yxlk4C9KyzfWBkMbm5gR3hcWeKod/79KpaCdjU7ElSXwIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447743; c=relaxed/simple;
	bh=xPKarhfYNVUmKwtqpzWKYWhVmCSVV61ACu+zC5FJb7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TBhMDhglH/WVXmuywrb02IL3Lz2VybVzefy7Dh/iujtAQ62ZtfdOu3sLFIDx+oupxAQgIlmUb4hH0xsLiHS/4G0VjNhcxQZB4kn2lFUOrDt+z+DmzZiAaJej6IGHSU09Hv5rHdOX2AZIX3wdEzYSRDB3ybVsRJhYbzPOw7r/IM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AB55RHTv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AB55RHTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9903DC19422;
	Wed, 18 Feb 2026 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447743;
	bh=xPKarhfYNVUmKwtqpzWKYWhVmCSVV61ACu+zC5FJb7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AB55RHTvyh3+GzyD7XUxy1WRlKdmYrZnrM+R7wh73xWo2yLDQbTzMcWrszF7yk2uM
	 4bqenGLDf+j31DCxgTorpNoBB21EorspxQ4k1PDx7WQj9FHRUjGukI/a9klDtEbJWL
	 evvllJ0RVH0TNq2Dlce4SgtFah2dcScCAR035diarEoYxhIJ8OGEO/okj3IrwyFezh
	 332xmPlM/RNv31JWCTH9oOJ2M2k6TLfaj9Mp2zVhHVhrujIJU4ILt397PKmNI/p6wf
	 evkZKx3Q4kDp5zMIb6q5Oj6LrEyx9yQWtxhau9cAwXmbQVycaUcCEl3g7G8+prcelQ
	 FNW6dmCCkD2dA==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 stable@vger.kernel.org
In-Reply-To: <20260212133544.1331437-1-mic@digikod.net>
References: <20260212133544.1331437-1-mic@digikod.net>
Subject: Re: [PATCH v1] kbuild: Fix CC_CAN_LINK detection
Message-Id: <177144774134.1769768.8484959623764754517.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 13:49:01 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev

On Thu, 12 Feb 2026 14:35:43 +0100, Mickaël Salaün wrote:
> Most samples cannot be build on some environments because they depend
> on CC_CAN_LINK, which is set according to the result of
> scripts/cc-can-link.sh called by cc_can_link_user.
> 
> Because cc-can-link.sh must now build without warning, it may fail
> because it is calling printf() with an empty string:
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: Fix CC_CAN_LINK detection
      https://git.kernel.org/kbuild/c/be55899b71630

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


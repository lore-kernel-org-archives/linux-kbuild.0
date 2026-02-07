Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5634EF17;
	Sat,  7 Feb 2026 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770502330; cv=none; b=p+JW1SDQipsNpofwvSSW8cwjy1UBpo+818zGZRLjK62/K2vO1BEM59tKlAufgHDIVkjaLfSbx0QMp3V+5t5TNcgmLwWxFeEJbnopLF7jFKTQ4LKh+mxDdNGTBSXvQ63IlkFuYq1GEtExTPr1L9DriQXGzitcVZLutdkBAklfKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770502330; c=relaxed/simple;
	bh=1by01lhKvAfXwmqpP4UBh/t22fI6kyLP2lb1+Feb6bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nH5oWD8h/5/3YoDNFFjGzMFt54MFJwFSAPiN+S5fcMAOT3+mAzpjX1q8yMNCgLlIIJpxS9JXzO0hroa2/2gADeIPzb6voJBUt4b++jAuYQEDRyaHE6Y65+OtxEuRsB1DdCOI+fq+jG5cPQThNJk8TwzscVTrue38nh+K3BiJCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7+lF7DB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7+lF7DB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71B2C116D0;
	Sat,  7 Feb 2026 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770502329;
	bh=1by01lhKvAfXwmqpP4UBh/t22fI6kyLP2lb1+Feb6bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m7+lF7DBGWnibIOuahVzy8c14JzxUz9xWCLfj+Iqq7YZQpRXKZOZRNBLpdewzyhIs
	 adVe/Poovis8+JoqAxsbmFmxAIE6cm6v4xK3kwrRYyBbkUNWwmRvOqpH7qmLZvJbSR
	 kMEfRUqbayhdX65qbh3gG/GX7mIdnkeGLfarRMwjEYwggc+/ykKTgKHlclJU3FMmo8
	 RPC1sB6u715cGXqeHK97qujIUK9bMNhLirJHNxpMuqj0y5a2ApKj6B9rq7odJhLPtz
	 EWFoBeBByzkksU9uY3MDjm8TtmLYv9KWjG4lPivoyma0URtydvKNQD7oUrmbvddOHj
	 07mh7v6BBKj9g==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260205-kbuild-run-command-v1-1-b8cbbc3db270@weissschuh.net>
References: <20260205-kbuild-run-command-v1-1-b8cbbc3db270@weissschuh.net>
Subject: Re: [PATCH] kbuild: remove dependency of run-command on config
Message-Id: <177050232853.438183.2849242193101976758.b4-ty@kernel.org>
Date: Sat, 07 Feb 2026 16:12:08 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev

On Thu, 05 Feb 2026 21:49:58 +0100, Thomas Weißschuh wrote:
> The run-command target does not always require a kernel configuration
> to be present.
> 
> Drop the dependency so it can be executed without one.
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: remove dependency of run-command on config
      https://git.kernel.org/kbuild/c/d8ad80a85b966

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


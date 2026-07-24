Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612119C54E;
	Fri, 24 Jul 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869988; cv=none; b=XUQ0loPJBicKJuve7pRhlNpRTN3HJBSAJ+pug3iz6QVtQsBrXcDnuvA13/SKicnc7Z0hxyZNKKcdaPDWt0okiNAqzFOVLiAVfFD4OPB+rFCGN/fOMa2dfii+/4qLrq6UF0q5Pbz4PPT1M5fD5CEj/9CL+gi0o/r4dZDA5KK1Xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869988; c=relaxed/simple;
	bh=TgtKngEpilMd54yyDtKWiOjJYBDP+igJbUMGlI0i6qQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=InrdNrEzzhyXQKLUseLhLPz4Y52F896+B1hYEx3gZauQlsBqqynNRitnWFhAsIGypRuolqAyxtegXCUy7yfU5BbA9/mydaDuEYmCFozvCLNTNTOjgStNklGXwCJRzn3I2qk5Wr8eFD6V8glxKLlE4TVUVuUk43qcLpH/0cEuins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STkTxWeP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STkTxWeP"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D252F1F000E9;
	Fri, 24 Jul 2026 05:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784869986;
	bh=U3xKA8bd0zjEScpqvohK39ADERhuhwrqVGmM3MikYz0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=STkTxWePvUFyV5vCwyYUUBkn+lA0Ct0ZNhAc5aG6C+t6ts2Jghlxx0Qrvdb5FHTNY
	 /K53HJgPzo49gY98u4m11kOxK3/KgLqV/8ZAUW90JGgXx7GBOjsuWP8XOu91cmbRvS
	 ms6aIOW4LA7/yyCNBaXdPWCXgfNyCkIsGRt/63yjAYnCtWftGT2uloaEn+bnGx6cXP
	 XQbEaTSzAdAGSbHkAH12oj4hA4jSHJsi5/0+c1tBwQ6H9pgoOgY+WNzxOkj0TnXjmr
	 Z/BTMDEeteG0s4tDZsqmc5FNK8fKV90QsnKcqwZp8Q9Xegh5GeoRZK7Ay3ek3BdgJK
	 fwRvM2ZSKw5/g==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260722-config-sed-v2-0-9f2c4b164666@rong.moe>
References: <20260722-config-sed-v2-0-9f2c4b164666@rong.moe>
Subject: Re: [PATCH v2 0/2] scripts/config: Use ERE (-E) and in-place
 editing (-i) in sed portably
Message-Id: <178486989881.1795696.1026826281219622287.b4-ty@b4>
Date: Fri, 24 Jul 2026 07:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=TgtKngEpilMd54yyDtKWiOjJYBDP+igJbUMGlI0i6qQ=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqYvQUWqxgsNypblF5tSQN8w8BH8x+ZZGg7e/kg
 Y/Kj0TUzamJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCamL0FAAKCRAHUgpwFiYS
 aaoBD/47f5gvbiN4Vj6nLQuOywkH/4gewqNISKtjLSZSMMynyB8sQVg7+D58keymNtw40nfD7mo
 R/9laTMFP7EOia/H+66zPm89D9qtKUv6Z7vLbZ2HZY+wsSO4Hg33HR/mSpb2vtZ8ltmeDCw0aQp
 03WS+cT3yZQN3hKQc5BGwx1CWfzm7SjcP9P9t+GjEgMrTqrjOB4KuotmgiM6iHdNYtPCRv5apmJ
 ekynvXkuNLgBS+bGRIlD7NaodzHliO0ZezlXhW8lf9k/lUN6TzK4Z8ZzV9iheBpeGurw7+p0QLU
 ALpnZbVQH7/oXWrda5D2XfPvkBtRUx9w3UUB8OfRu0gztsWTFCdu0R8jnBeWHnv6GqudO6GlRnV
 0wKNTcCmVZpi2jf6/NAGcTAB34ysT3/eCG55z8bwggI2skiiZuY38l4KDKOoVapNkR4SaH3PrOK
 7xKoETHj54Y0/oMlY8RzgNIKEjF5lMdTAF8obkJ2PWyleFQfQseU6MG+HY+PAZl4nUiD58sHQi3
 HDdnUjTgjFdYs4u/ptmByNLDEEPkCUuMzavj5KCNqlItqpKruoBl6HPS4AQxD/agFlU8RPycOh9
 yNM5P3Z/9cLz9L/rE6VPU3IKUYWaT///YFKF1H8otHzs6kmHqRm5VjHANuiwOGCwKNi8x6hRnBU
 +aa3SsCnS7BnNAg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 22 Jul 2026 01:50:47 +0800, Rong Zhang wrote:
> scripts/config: Use ERE (-E) and in-place editing (-i) in sed portably
> 
> The use of Extended Regular Expressions and in-place editing was removed
> by commit 83e8b90e1d2c ("scripts/config: use sed's POSIX interface").
> 
> Before that, the script used `-r' to enable ERE, which is indeed
> non-portable. However, POSIX.1-2024 [1][2] has accepted `-E' as a
> standard option to use ERE for matching, and major sed implementations
> (GNU, FreeBSD, OpenBSD, NetBSD, macOS) have supported `-E' for over two
> decades, so it makes no sense to use Basic Regular Expressions any more.
> Hence, we can safely take the advantage of ERE and merge chained calls
> to sed.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/2] scripts/config: Use POSIX standard ERE (-E) in sed
      https://git.kernel.org/kbuild/c/1d553517
[2/2] scripts/config: Use in-place editing (-i) in sed portably
      https://git.kernel.org/kbuild/c/005d6382

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



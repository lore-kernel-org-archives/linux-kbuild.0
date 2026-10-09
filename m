Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF45012B5;
	Fri,  9 Oct 2026 20:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577808; cv=none; b=ukWs7No5mY52KrOEIOcx2oSkHpgg66NV4wvGLUnctQdKl5N05TR4CqzSgZz2S5xcUkDXvd9zM/yhIoFgJi3MZ6s8zmCIk0jnBoksY1z4Jw2Smf7MLl90JWoDotuQQT9lSL5suJV/2BQqLyn1fziwTkEt/QOW8TnlXUTeL3+V8Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577808; c=relaxed/simple;
	bh=ZCo79MmkHvTFcX4WG2PhGvEyS/mzmk0jHNesZg4W7jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pwf2lCX6cm3IZ4VkRhQQ3K5M73TfN84aI3WPIwM2MswQb2Zznin9I/SzRCByGq2xp4OjF95UiVtw6HZo+Fta1V9Y3Uf9/qWSZBRMnZttlZJGO4xvLswy93cxAyjtfKbRwqGkRu1amYPIDw9Avq7UoroeF+2jf64rY0Y3rfWT0hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtDxBXMf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtDxBXMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E3E1F000FF;
	Fri,  9 Oct 2026 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791577806;
	bh=3qIlc6o9p4799Ngk5cCt7uX/+W8cGIRC5gP5FgwHgYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NtDxBXMfSPHbP2I+rzaTFYAldd4mVNBqfvEPn3yl/nNmOSEHZZs69dgOYK9QcoOrW
	 hE5emFVR7PfPMCzCN27GMMj1BukpBF2apWT+7dXEmrvH2vCDu+bZqpxOuZZ3XgCvh2
	 mNPQN5LjZ6XJVvmPb4UJu/JRBkuvkOAXnNfyI2TEWqzzxK7vEaaS2FOpoqQcuJfimv
	 qMdDhq5WE/X6qlWNOF3z0y1RRyhBbfWy+zabzrnAnNVxqwVGWMhDE1YQ3NeJyhn9Ut
	 OM7qiuJjqNPqKDWybH1T3k89BnMDXEFrms3+CtM/mCH59bsJU6t1F8RxwOfHaoVjXD
	 WmRqC/W5eSjqw==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261009094617.17322-1-julianbraha@gmail.com>
References: <20261009094617.17322-1-julianbraha@gmail.com>
Subject: Re: kconfig: cleanup stale comment about 'keys' array
Message-Id: <179157780046.772474.17247617840025551450.b4-ty@b4>
Date: Fri, 09 Oct 2026 22:30:00 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=723; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZCo79MmkHvTFcX4WG2PhGvEyS/mzmk0jHNesZg4W7jk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkn/U5t78qKZuN4o7cvxkRZZfGnUu8VKVvV/xZGaix+2
 yK3rnBTRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIk3KG/7lr9S/cPtt2VZ0p
 eb3s4/ZJfLee13vtXfOt+FC9yL1lbZyMDPvEN1SaynK5MIXL65rrGF1p5D75/XhuasyD67OD1/n
 v4gQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Fri, 09 Oct 2026 10:46:17 +0100, Julian Braha wrote:
> kconfig: cleanup stale comment about 'keys' array

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: cleanup stale comment about 'keys' array
      https://git.kernel.org/kbuild/c/2160297cabd4b

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



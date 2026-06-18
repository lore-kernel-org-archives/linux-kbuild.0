Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E6C347BDC;
	Thu, 18 Jun 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808667; cv=none; b=Q2MPm+CrBsNWwo5T+gwQiRRTDLGUobJPjyIEUOfBWGBT0wDXnhrS5Prz2zLBp5dvGWKS1Qdmk/kpqoBrG/6doCZQnLZqbQjTwfFvYkwH4nF+OYtrqIVYKnWxFuJzy2L6ELHfXRJlolIH/H5iRYCdg85VliLaUinwMDCrtwm9QIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808667; c=relaxed/simple;
	bh=z5dzaGE1bIjSu6i8OcL04A5Jv+nYrY3tX62F5pdi34E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jaok8JI4gwGnZxrWn9lBlYctpIhavr7T2IGRuLQXQn4sB+Y2nF1J5nTrirJpp2AOeFNQHSOfn7DVaaR2HG7BwstkTzQhIIq6eyIVVxvXj7/DKnIvCsydfaGPRAAPLZPgYzD5Y+52A/XkcaKMTkyhmSlh0Wk2ZX/4hgqhiRtMwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRx+MTGV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRx+MTGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FD61F000E9;
	Thu, 18 Jun 2026 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781808666;
	bh=dwRfkHC8DkJS1kGW8yqIdp81ODlrAnQEl1KxsX2hQYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SRx+MTGVScAfdcmEYlVYlW9r5w1vw1CWhyo4eUOhd+7tLB9Sj/ag58ov5ca+EIjiZ
	 YAhVaphlS5Jlw1wGHEv3EL2eMP7+wi9xZDRvQ3mIfjycKqt5QlOlihKFV7kKR8Gzub
	 MIrLWdFtOWxbViOWonX7p9rcdIMb54x5/8JEuXqI7j1OfCjTyg/+6VB7hxl8ebFteO
	 +Xkb3brmu8rBnnSsffU6ushRRVnACO0EJU9Y43lCleHSGsrBCrcPumH1ZnO0T8Xu7p
	 OdRZu6TzTbDLHTP4rbifPOIk52RZ6MT5eBl7b2jdkqWLimIooTsjyjtYHUqFx0dv2X
	 SH3JlVfUq44+Q==
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260611060000.23858-1-pengpeng@iscas.ac.cn>
References: <20260611060000.23858-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v3] kconfig: add optional warnings for changed input
 values
Message-Id: <178180851654.3916864.10753634214480238939.b4-ty@b4>
Date: Thu, 18 Jun 2026 11:48:36 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=nathan@kernel.org;
 h=from:subject:message-id; bh=z5dzaGE1bIjSu6i8OcL04A5Jv+nYrY3tX62F5pdi34E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkmdhI/S+K8pE78ma2x/8ZczVVt0fvzHq8TPMLR+6q9c
 7vSsQOGHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAidhMYGY68vWI677bubL4g
 ZfOHXU/y3/5YPmtG6WG2Le/fi+mdO7OXkaHrjpH8et5/nm/mc+f7lneLyWWw/rq7ZoWhw5W59Wf
 KgnkB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Thu, 11 Jun 2026 14:00:00 +0800, Pengpeng Hou wrote:
> kconfig: add optional warnings for changed input values

Since v2 was nearly there over a month ago and it is a genuine quality
of life improvement hidden behind an off-by-default option, I am going
to take this for my late 7.2 Kbuild pull request.

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: add optional warnings for changed input values
      https://git.kernel.org/kbuild/c/645323a7f4e55

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



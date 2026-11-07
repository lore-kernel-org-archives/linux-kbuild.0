Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018308;
	b=p+O6O+U7o2SypOXyt87EOpebT2hwCqHzwNGUFlO8a94pC1721aqVanFSvA3PQkfXGfM5
	 DaNsuiQjVY9+czU2Kg4tEvDLcZttoKjpE7rluexj6EI22QS2YQ8q9WrVVtK6OBEplhjEa
	 UQeHG61wgETyb3pnBWbolsZUaRKv0G1lSlHBWbBlEffZZITpeKBptGtxL93WPBV6e5t8V
	 YV5dZq9JcX57kH1RELWYHZWIjp3yyhklwRSPjpl9Rm/MsfJ5Do8KWHLFmR+k+3NERs3jc
	 1NpW/7JdCgd5NnWJwVq3paBIS5GF4sZHrDlLeenj/novjl00QRSfqA5cpnhDPVe9eWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018308;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=r7I0ZPKoyK57lrWRAjn8hzItvyN2aZVtTjY91KDbjSY=;
	b=2EB1XbE4FO94QisirYu6L5bvpZFxBRvbrK2wrNXHWhFyFCz26jAadIPYpc/wLRyD4F2v
	 bhPljS89CvHUg5EP83AzBgUwxprq8Jt14b4zTyJn5r+pYHFU1UySkFJgR1vsBayNc+VyU
	 qO6XORC5v3rAQG1/4kPwC8aYdz8EQmKTFt618dSB/gRGKea31uKGmIkI8Ql5iwDS2xK0Q
	 OEIxdzt+cG1EmUYih3SKgshcgoAQyqB1PXKe/6N/iUNYd/3LPw5SqrMVBpr3+e2DYY/hT
	 MMe+Crgn7R3DIlLEygRccz1aphGE4FuVTFs0TSWWfLcIkkDDBsBsEHNchhubllGlytA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YUJS+hj5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0B606A333;
	Sat,  7 Nov 2026 02:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YUJS+hj5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5101F008A1;
	Sat,  7 Nov 2026 02:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018308;
	bh=r7I0ZPKoyK57lrWRAjn8hzItvyN2aZVtTjY91KDbjSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YUJS+hj5TFcL5/TKbQEA9NxrVYeNF6w/LGL5nrgq4JG8qBz02SdiQPf9zMPbNeOmD
	 7mcaDsB6+HszsPcF1EmzZetLRryyGMD5SbJURSYOYeYq0Yy4kKOwJDiI4MkyynYnrq
	 LXc/9k4GMW0oHb6i1TpodyJK2k4tFnDnU6Pmv3kxT05rHnL/WOHvkU63yYpDioZyCd
	 lZD165z126DxcYFwu6uaxh3wLVaxG2ec4fWPVyavyAem++GRYJFRUTbeo7V/e02XBQ
	 NJlV2nZTTC3CfZHxADusN+v89U6CgUfIYO1q/LB3+WO1qkqZekin7/xkpq3pArnV3M
	 KgKpRx28S8gQg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Vineet Gupta <vineet.gupta@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
 Jakub Jelinek <jakub@redhat.com>, Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20261105175748.3057520-1-vineet.gupta@linux.dev>
References: <20261105175748.3057520-1-vineet.gupta@linux.dev>
Subject: Re: [PATCH v2] kbuild: move gcc's -Wconstant-logical-operand to
 W=2
Message-Id: <179401823380.3455564.6991992300630125115.b4-ty@b4>
Date: Fri, 06 Nov 2026 19:23:53 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=nathan@kernel.org;
 h=from:subject:message-id; bh=eu6pW09wQo8caXmBvKqCiifq927nBl7uH0wBtnSNVxA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnvur8ntNjGbNQ9FVRbX7x56p4vhor150+Frl58zMrz9
 n3JCM+ajlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRuSUM/5TuxfOrf3YybL4k
 l6Igc+T6F713zGdUDoUL/N3Bx3ens4vhf5r+8gm9X3v6RHbdktPZpR2x12A2j2jOuqwbx/6wXbG
 XYwAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Thu, 05 Nov 2026 09:57:45 -0800, Vineet Gupta wrote:
> kbuild: move gcc's -Wconstant-logical-operand to W=2

I added a 'Cc: stable' to help older trees.

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes-unstable

Thanks!

[1/1] kbuild: move gcc's -Wconstant-logical-operand to W=2
      https://git.kernel.org/kbuild/c/4d8996081dd19

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



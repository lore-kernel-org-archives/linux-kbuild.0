Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863914;
	b=Y+P06K+LTitwqeZ2Roiy6Zd04mQX2O/h4WrM0lhKV4FJg36pPq/NYSgU6wsv5Zt8PxbY
	 79MsLFHR1+ADU5kxYmaInl9b/LLeS6yOQfYDxQNHyiyW0HZ2SKAgj5rwFdE1ekfVWHpgO
	 xLTyYy83rV8hkTxhOIZGefJKce4CsKyAeaquKHrymvyKGBEgV5ErExHyq4jCnZEaEGPzw
	 fpoxdnemU6HV23SCHawAjwAzw83+yQRP6HLc4JRUh3gLvupY27zs9XsoOz7G9P41sqAEB
	 3uTzkmjpR8/pRglLEBBO6si0xblSmFOrrbFQS+8W9PFjRK33cqBlnr/APLRQKr1onBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863914;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UUK0k7ftIBU6S8/ZmsdUGZl/pEe+AnTYPxOxq06IjAE=;
	b=tAJcn2NkBkHrZlj6xjuLfAnV+dxuLP7q05SJQSYi8Ylw995l4e482oPPsi3dn7tmOP1c
	 f2MZuJOPK3TrThn6+5hOZV4jCOCpAzgZ0RlvfU3kYTJQAlYDRpaUKte+o4EuSNmYDVlfh
	 24LGvxUX3hAqTn1b9izK6Gkg+3SiD2Txmf9qpaKgoJsB5/J+LJU+c+NR+6MkhTNk8xZ6v
	 Z2trvQFdmCnt6CqXirH/NGUyOPmC5QM5W09uqf6a2AxIT78s9EDUhq8czhPIIbuSvpBj/
	 8Wyf2olxR2T8lwjol/FCd+q5hapdbAI68rObvvqm7q6UGnD6B1/hw0vje+GaHBKk/tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+TlFwlu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3C606A31B;
	Thu,  5 Nov 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+TlFwlu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7561F000C1;
	Thu,  5 Nov 2026 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863913;
	bh=UUK0k7ftIBU6S8/ZmsdUGZl/pEe+AnTYPxOxq06IjAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H+TlFwlucj3qrnsQ8Bn0qopX8prNV+klVQvJbcR8jQfmXWPYIHC6hbMWQlBGqy2UY
	 SVd82my+vYN4BATnWDVZ9pgAU6w3sPwLemBYkVY/tpq21XwkTHzk10eLldAiXeWr+G
	 A/qO7h8+fCxPelSQPwIm1QY1SAJ/rggrP8kGdBVAsIjQb0MqAPWGDB99p4wHfpFVyT
	 ucCCRNBHeVdRlpzFTwc3la0SPuXe35bd3SUTKwDVvsqzG4ptfqwxi4WdPfBdI3XNIP
	 vep0CYymSpRDrhrXVB29A7dz6QKfRvPVn+hK4gOKvgTfwb6XKwOrd9uIL3x4g3kfNY
	 V+GNICqnTlWWw==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	n.schier@fritz.com,
	grahamr@qti.qualcomm.com,
	rdunlap@infradead.org,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] kconfig: error on reverse range
Date: Thu,  5 Nov 2026 08:31:39 +0100
Message-ID: <179386358247.407677.15073107092140658288.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014134017.2310819-1-julianbraha@gmail.com>
References: <20261014134017.2310819-1-julianbraha@gmail.com>
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
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 14:40:15 +0100, Julian Braha wrote:
> This series adds more input validation to Kconfig, specifically checking
> that ranges for numeric options are properly ordered. This check was
> originally introduced as part of kconfirm [1], but there are no findings
> for this across the tree, so the check can be added directly into Kconfig.
> 
> Patch 1/2 adds a prop_err() function to match the existing prop_warn(),
> which is then used in patch 2/2 where the check is introduced.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/2] kconfig: add prop_err function to simplify property error handling
      https://git.kernel.org/kbuild/c/cff21174
[2/2] kconfig: error on reverse range
      https://git.kernel.org/kbuild/c/fa68f88e

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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C55D3ACEFB;
	Sat,  1 Aug 2026 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614770; cv=none; b=HTgzr8o8yuWyp6CXAPGomr7MDBWdosZ6wzuOfneArA1LDza4Av57x8JE/0jFsreYAQPmM1GhZEUrqxAeCsQst9dp5hZzJLzjaR6hA9+0TGh/L1aorlqGcFKiuEOj8oLkJ5zR6TXqi7TfM0jksCFWDnZ7dhnRbX+7jDlHE4uPQfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614770; c=relaxed/simple;
	bh=S0NzN29wXnDZRiRTWKkTWJdLJ1hdUUNPely/OeOe5L0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iNR9yqn3jKjQHCVXeB12sJXGd8DyDvT4jJ6e3tbkNb/h8i0q/saow1X5hVDiovPvLxSqCfWSTHJU8IWjZsx5Xmc+KhKxFizp/UV1u3jxCApqRCiY9J3ZMGV9jfV8WfVWAJVkPMQvyGkFlDTUmbJEZIupg39826rNCSzm8HjXsuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heeptTWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heeptTWP"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2D83D1F00AC4;
	Sat,  1 Aug 2026 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785614768;
	bh=aidYsIHRJim1LgD3p1HfAIKOzzmsZIBpwJ1lVubQUn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=heeptTWPog7Gd03JaoaFDm7AW5yZw4oS6zLAUrG17Etjbq2TWa5iMSt8yMI4R5c9e
	 8yRLLtPB1dar1/gCzJuo6exdnrVbYRY12Vi6SiM+HVS5DezXIrBCd2VoUlDsmCCcVZ
	 21NrpZ0eGE86U3uyt1I0LjXcnd/Ch1uV/X4Obrc2Mk3UG0bA2RBmfRi0o6u+IdIjD3
	 TTKw0C4yWdcnLxFTukH9BDxauMLsxxPg1Z+UC9L6yqzzhpctYBOF6+ZN7TJPvcu68o
	 cTknYLftBcspsx4/bwqnIxnKBiJBlK70Hsmw0MCxX22vYwhCBFIvBQyFtDvtPLuMAM
	 GAoQS0fqLanFA==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Yuntao Wang <yuntao.wang@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Luis Augenstein <luis.augenstein@tngtech.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>, Alexey Gladkov <legion@kernel.org>
In-Reply-To: <20260729071737.818007-1-yuntao.wang@linux.dev>
References: <20260729071737.818007-1-yuntao.wang@linux.dev>
Subject: Re: [PATCH] kbuild: fix modules.builtin(.modinfo) targets in the
 top-level Makefile
Message-Id: <178561458195.3105729.12750383920323475886.b4-ty@b4>
Date: Sat, 01 Aug 2026 22:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=759; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=S0NzN29wXnDZRiRTWKkTWJdLJ1hdUUNPely/OeOe5L0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqblD6PyFyR+bYUXJ+DR+Lt11Rbcl22Otpq66sR
 WlQnXt5CuiJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCam5Q+gAKCRAHUgpwFiYS
 adeXD/41mDy+wFWgGoaxUC/LdffiSW1qd4Eoecfi9K/BqCOv99jRS9RtgIDrn5NYGdl2zsnTx+V
 k5K5x7SXHSp3Df8jDhLKQRSfMDFf5U0BPSPndIPrefDwcauVGLnsxUz/gdiZtQDaOdQ9ULLdSYB
 DytoxM5aBQh7IuZbIApR7qSbcMxFcLlK6+a91he+LNyLdvMLWHVqqCbcqe4Zcc5TTJ8kHsj8dpf
 b4lzifLfWeZwQbmo6a6TpVcEDvjrq+uScmlyT2B0eG1LnDG+fKOEzsUBXos6ToYY3rnso1479wj
 /+8s81OELk6OcJe9xFx75ce9vweGtKcjnU7/WKv1LKXH/rOqRtkhy2LCoqomLHL0KBi8PAopC7b
 6+zhatzVadOBVAJ0OnSnxnYwncyqrd7qLfPjihcZbEYnZG7e1rOWFKV0hkD/WWfTkY9bm+369mD
 NJKH3f/CJBlFBlo+I7YVLFOg7NgSqDT/TeguT5cT6I4bR2igxba5849bHnhKccmXiSS2dwtp1Pm
 BFPdjlHcxr6D8DoDmOXThSM/Mdrp5mw3S8TPsPV9PjukUZYqprhtBVscZBR81FBI1h41wR41JpB
 ktcLI9rx0ByAPTJhRQS2Y34yCNQf6uLsGCEaOrgXrQuIPlZkJqgdILZpLeNXYq9nTd9SwAwf0S3
 0ZWgN8bq42JRZDg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 29 Jul 2026 15:17:37 +0800, Yuntao Wang wrote:
> kbuild: fix modules.builtin(.modinfo) targets in the top-level Makefile

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: fix modules.builtin(.modinfo) targets in the top-level Makefile
      https://git.kernel.org/kbuild/c/fc0a2ef3

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



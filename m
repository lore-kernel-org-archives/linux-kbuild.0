Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4884F3BD22C;
	Fri, 17 Jul 2026 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293027; cv=none; b=MkqADoBBMwlEs7O/gUXsWWk7Ctxl2h52SKiZchOm7rm+JWMjD9xQ3Vx69Bz7wYoRqUYjjCosT+ulcfW0rokjhQB5gUxyhpJBb7FMqx6S7oTJX5ryIKA04c7F8F9tIKekENJQTBpVv0Na3JAMbh87CcwsA0jYzB6SvS1+gGZyhkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293027; c=relaxed/simple;
	bh=PxnDocnD9vdqFt4QXMIfMXqJ/qL9s73tgzS/h4wMJXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A20ACz9RUUQu9nmzzrYE4E8rKJCzDyC/BiqPDynh/x3YzrQdY+nQTsoNctebXT4lkfME924G5QgTBpmG7uYAz02hcRiHD1scgna0mH5er4rpXDxIaiuti9yloFFXmtrIojOQkP+BbfvurnjE28K/jsD3ZSuDgtCIvUr1NYsSriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNdT9+fG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNdT9+fG"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 64B3C1F00A3A;
	Fri, 17 Jul 2026 12:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784293025;
	bh=3/vQTR/mA+mB+6f26loAhD4gVyWN203Yu2SD2mDIs2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HNdT9+fGadryAswWVQDFqOdal1LBOc6TdryJNT9c+eGXVzm6H2USw7zOJDTbuoFHS
	 l0lfIceJMVolscewS0YwMVEd0cu9vL9lv89zLYxBE3kunxoqvXvoZ0G213oDVUgthU
	 6VQnt/zIC9BaGg7cDV35IZCS3Gnrw/GG3jzmKP0+VGvuINfvqtyseoc/RhCBIUqiO/
	 558J11HkSwP934fZGbG7VhA+8saoHN6G5cpn/9IFamVoxk/N4BCtLudK7ejsPSBarq
	 gBjcnjf0xPIOtG6BLbxii5CadOsbpVH4Xlpt7sMSSWySgJvBrOkfCmuygbkFJfozxF
	 suZ/YbaSHOrmg==
From: Nicolas Schier <nsc@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Xingjing Deng <micro6947@gmail.com>, linux-kbuild@vger.kernel.org
In-Reply-To: <20260714133545.3294648-1-sjg@chromium.org>
References: <20260714133545.3294648-1-sjg@chromium.org>
Subject: Re: [PATCH] kconfig: abort rather than loop for ever on EOF
Message-Id: <178429243591.892424.16900332762546960932.b4-ty@b4>
Date: Fri, 17 Jul 2026 14:47:15 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=PxnDocnD9vdqFt4QXMIfMXqJ/qL9s73tgzS/h4wMJXk=;
 b=owEBbAKT/ZANAwAKAQdSCnAWJhJpAcsmYgBqWiRdxaU+k+pH9SGMr39mv6EXnFDhuUKeYuMzr
 4rZ1+1/PxyJAjIEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCalokXQAKCRAHUgpwFiYS
 afRYD/YjcLJezeExHPjy9oe6PlX0jdf2BWJe3trDwO4vp7U7RQk6mqWLQ3BBGzdw3pgXlHX2ECO
 IzQOvMHdLea84FRFKd/mh1fJcaegz1HzTyMJzol2JFPRlOClsGFgKUaGLy57sHYJBiiAACVs1dY
 jRGWu98/5XjCjmlp+wI1ob4LaUMyfNlar/Gk1gBl5dWVnOdqpVUuHNgJO9bVmqOyZon754fb+Bc
 a9oJCbrUcsK36UN3v5EI0Gvv/RO493F/72wmWFC23xZrKMthH2+kCQ5TjeXXAA3tQMwBZZZ9W79
 X5mTMC2olUBD60Ua/4SpCliJ1asayGBI2JIr8tmHM1ayM083AjiKzC5QFsnxIt8eJLQxHlJJpZX
 F9uNuv/J286khBgec8pkvNX+oFTYlk7Ars0J1JMnygVq17uqdveO3KtipIHGGe1XGY31bhWPjsB
 rfS4ZBytWJw9tW1fTIaxp+2cMgGGWRJ55ggcyLrnQGbC67lSUiY0IJVSuwbncCfb6dwLz0UDFso
 HFCb+rRjf79mnnAU8DQEBq8AIERYwGgdTHM1i/95Bf6M5Jzt4Kmt438P7F9EsjNPrfN/LVxrUAR
 FkxKKTyU1n9Hjr3ujNhfeZXmXbtJRmovEME906KAylP7dDr6PEy3Ku5GfKFWuC28UyX9k58IUvX
 DpM91rFUzl7sm
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Tue, 14 Jul 2026 07:35:42 -0600, Simon Glass wrote:
> kconfig: abort rather than loop for ever on EOF

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kconfig: abort rather than loop for ever on EOF
      https://git.kernel.org/kbuild/c/7b406f92

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas



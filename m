Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592638;
	b=2WliTlk4+KgczOvblmP/pEWj/pP59HjV2MXztlhmlDlLShOf+SLIAY7AMIVyHLvuKNlo
	 5xlveUCj6sYyQtKiVhT8jX5ndf/AIUiE819NhOxoj6rfo+k/TfzXu2nOK3LKmeLVqcaZS
	 vhRjajfkWzBov9J7Gaqnu6n8cagrnwx2auwQj80w6knPXUgyq0K5YMypIFdwW6VVqx7YN
	 nvSadvEy7bj3bBUvcvY24FniS8OJ14gGOq5lcZQ3KyJpjieh1eNRg08ANwm0YzPXgID/x
	 WM6p9+4A4LNN+tNV3jFwkQ5VGbwe6pIKx77mOAkqQHUGTsKpybwMlQaHGnTJB/mrbQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592638;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=an3TW83ZdtfT2MwoqXi8iWyGphn95qAGXKqfNkWAXfk=;
	b=jySZ+pEMRH0JHteCcW9eVaFwuPWx37spf2A0Uqkd15QYc0i5pK7ikKFo02CNvaFYP78B
	 llozas3TPnnRTiLB9thd2jVgBc3qw+kCWnZtp8DOOaHU+0LBhx8p19WQQLv0sqEkLixXN
	 VXZ+5hdSyXP2bSr9tTeCPiFMDuG+OZ1HLA6f8WjAsa8OaWPYeU2OsvAu0Ql+xqxFTOH4k
	 x+xAun5qDFwzHxSg9dMz/M531bTtJvZIy6RfulTlG6fCkFtu+s6Y9I2mE4EbvBfA6Mo0d
	 u3uC+Sa/CO05gb5LRhge3qFFkFauuDUuVf3g5WEUQ1AIwEhyI4/xQTGab901QAyWdXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUVTzdTO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CD606B224;
	Fri, 13 Nov 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUVTzdTO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C891F000C5;
	Fri, 13 Nov 2026 17:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592638;
	bh=an3TW83ZdtfT2MwoqXi8iWyGphn95qAGXKqfNkWAXfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HUVTzdTObPbrQD+EOn05mAd+BTMQFwEc/ZUvuZCKcd/vf7lKJq0kT7ZcH9NLnyaGm
	 KaXuz7PSAr01AJvL5lqregQzuCk0kfb1MoZcWUfkQCCT1GxQZaC9MGOs5i8Xgt00U5
	 a4aNzIoYwq/RWI7UUe7DkFlY4w+PSkVYpJX3RMt5CVX31DNu9luDTvNtk4jT8kOANr
	 2p+8kQ8JeWiCfQrEY5XY/1Ic26E5QoYcdoHKFxP0ztOYXbqQFLeCqn//b2L5mXkIwf
	 Q+auTfQ57M3bAcYsUGGZHyy41SMNimO7MnfZgERORhM6TK1PaJqXz9D45kiBEAoXsv
	 z+AN0vOtgs7nQ==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Fri, 13 Nov 2026 18:57:05 +0100
Subject: [PATCH v2 1/3] kbuild: make rq-offsets-file an explicit
 preparation dependency
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
Message-Id: <20261113-reduce-single-build-dependencies-v2-1-93ba1f6c4e46@kernel.org>
References: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
In-Reply-To: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=9viEUNJwwz+O3SrkICAMO/5gG9D0++zxZl0+mSGfRXs=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFnf/asiZ97qY9KoyitVDOGw2ayxcpLW+olKsTVXJnz6P
 WG13ibGjoksDGJcDJZiiizLyjm5FToKvcMO/bWEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 gQwdIwYuTgGY6qtsDP9UhTxqeKseBt48o+rCHR+wqWPj7bWzxYsmhLks/7aA8/hFRoY9VovEFhy
 ctHLZuVfn77VeNambqOLypnypxltbV6/vu/dxAgA=
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The generated rq-offsets.h header is included by linux/sched.h and must
exist before compiling ordinary objects. Currently that header is
prepared indirectly through the missing-syscalls target.

Make prepare depend directly on rq-offsets-file. Because rq-offsets-file
depends on offsets-file, that other dependency can be removed.

Keep the rq-offsets-file dependency in missing-syscalls so that the
check can still run independently.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 Kbuild | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Kbuild b/Kbuild
index a6a0192dea08..5a65be2d51b0 100644
--- a/Kbuild
+++ b/Kbuild
@@ -87,7 +87,7 @@ $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
 # A phony target that depends on all the preparation targets
 
 PHONY += prepare
-prepare: $(offsets-file) missing-syscalls $(atomic-checks)
+prepare: $(rq-offsets-file) missing-syscalls $(atomic-checks)
 	@:
 
 # Ordinary directory descending

-- 
2.56.1


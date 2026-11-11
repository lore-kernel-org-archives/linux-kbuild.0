Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404481;
	b=Yd0RncS5I1hysY2r0PzUb9m81dHKVNEi0R2QvshMeW9ZSZyom2qr+v/aaJzv/InfJPf4
	 0K8/it0lMPChsmoerxSUxKJFiIzxw8mMZFJHYZty7w0z/nDqVQYjROv1zs34Z90gvh2Gu
	 R62gYjtQkuEEpjcnz7wzUwUR/PxW2HKnWtrZGjY2BeIu9abH+etYXbZo8v+DCvL9o74RW
	 mTGm+eVCflXtGL2TN9NdIv1Egfl2vmkL6hSpr87tltFOLC1rVnece60UocahnnH36VF1k
	 BPylrbz5P7Bh75Iw1HemlIDFwFEnnQdEARdYFlplELzYwFrq+c3HvxycisJ0OKjBz7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404481;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CWLTIs+hni+fvoY6mrigTluRycmFyDv/vZwkFpYXWa8=;
	b=LmsmDat00c6BAMklIvUL5r3CN2GYpuz0/XpWcrQXnUEwTkn6Pl/8Xr3qJpZE/tOB8/Of
	 LJvXgs1sURHc/L7nrJW3gBQIvAzSWRzvViNcSz9lwp7uRz1MuzKDKs3c6XE2YXYqzfv8B
	 K3XhMiHLPlEtPbxkBsllm2Ym3/O8goilhRvflmKg48veoqMuBcOoG6TR19o7VUFZ4GY7t
	 heIHA/sGpJ4r73UcGPy1vCrYm+vfKCGyZy/9S6UV0Ej9mNKjINHiWzYRcgcJ2Yw3Nxvkw
	 rroNor7HoE1rnftV//8BraLQBT+do35zR46YH/xZ5amD57qWV46P1B/x1o5sjRMQQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HU5ZhD+V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A4B606A886;
	Wed, 11 Nov 2026 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HU5ZhD+V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0717D1F00A06;
	Wed, 11 Nov 2026 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404481;
	bh=CWLTIs+hni+fvoY6mrigTluRycmFyDv/vZwkFpYXWa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HU5ZhD+V9B384SxzSafmdgNVqtG7/1MKEtQ8/V8Lw+9qZV3wF2jHkucArjBvMumni
	 w8dMwXgxmFDt2GBqz+qCrgujnHXARoqylq285P5pXXpN3oZ5XzOmS7dRrDnFlEyLUJ
	 23FSBTyKPo7ryAor0QbL7zs1OlmVfi6QyeNG70YMzWeTEI7PKUe/Zd0oFM6YOHNm/O
	 VicYhuQw1gw4oLIu+mBXeREomulT307Eqvxq+fMTuNZzKufRTDAtw4yb5+SLtgX2/h
	 40PIAZ+MZ3ILCjeK1hkw3ePM3olakQ0OiinhgF3LsV+/MZ4gVt++4NCpL9pQHMNBdR
	 0Cfp9sw5/oUFw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Wed, 11 Nov 2026 14:41:04 +0100
Subject: [PATCH 2/3] kbuild: move preparation checks out of single-build
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
Message-Id: <20261111-reduce-single-build-dependencies-v1-2-7196ca986a85@kernel.org>
References: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
In-Reply-To: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=J60Bfg5rnG38+O4wzyuXYBV9jjEM5OMi/wZayVk+IsQ=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlfCmocrk+t+XDspM3ShTOMnnD4lpz3+uMk+vTmTbsNz
 a41d5Y4dkxkYRDjYrAUU2RZVs7JrdBR6B126K8lzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGDFwcQrAVD8+xvDPqHt3zZ6HoaJLXpzr2jT/1M8jF0+IvmB5vOns3/11M07Wz2BkeKHgnrJ
 lnbrrsmVbHboSF+8szrz/Ny0oNmT9O4XzLr93cQEA
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The missing-syscalls check and the atomic-checks are currently set as
preparation dependencies. However, these are not needed to compile, for
example, a single object.

Add a new prepare_checks target to group those checks and call it
conditionally only if we are not doing a single-build so that the
prepare target does not trigger that dependency anymore.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 Kbuild   | 7 +++++--
 Makefile | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Kbuild b/Kbuild
index 5a65be2d51b0..5151e32985c6 100644
--- a/Kbuild
+++ b/Kbuild
@@ -86,8 +86,11 @@ $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
 
 # A phony target that depends on all the preparation targets
 
-PHONY += prepare
-prepare: $(rq-offsets-file) missing-syscalls $(atomic-checks)
+PHONY += prepare prepare_checks
+prepare: $(rq-offsets-file)
+	@:
+
+prepare_checks: missing-syscalls $(atomic-checks)
 	@:
 
 # Ordinary directory descending
diff --git a/Makefile b/Makefile
index f895752d4b05..2c1289a44c56 100644
--- a/Makefile
+++ b/Makefile
@@ -1413,8 +1413,8 @@ archprepare: outputmakefile archheaders archscripts scripts include/config/kerne
 	include/generated/rustc_cfg remove-stale-files
 
 prepare0: archprepare
+	$(Q)$(MAKE) $(build)=. prepare $(if $(single-build),,prepare_checks)
 	$(Q)$(MAKE) $(build)=scripts/mod
-	$(Q)$(MAKE) $(build)=. prepare
 
 # All the preparing..
 prepare: prepare0

-- 
2.56.1


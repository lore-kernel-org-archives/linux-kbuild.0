Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404480;
	b=FyITnKvTGRMn4zr5dglUQSC/SlIlHMdP9335XNOX6Ej7qn9j2cBzScsfmE8+qMrro8E0
	 n9h0i1a4F4sepsTsaK+HjSKsAGizdhiegT7tF8ITKvO4QQC9w1+BOZa5dZkWTQy2TOLF/
	 /UqBHGrFxmopdGl+PVkR8PjYHuVj8K37Wj50TfKQ4bu98i3g1qwJYXxKSpLEAUEbCA6pV
	 a+Rkx7t/MaKsY8dOEjGxjXvu3meq+f+ciKY4kvS8YIg5qF8IPDLBBGl5IoZ8gmq9p3hlA
	 MRnkmMzc5T/vvF/DIOb7EjKeC+5pDKXUgtJbygEa097FcIzlakakxO99wJGIs93ijVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404480;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=an3TW83ZdtfT2MwoqXi8iWyGphn95qAGXKqfNkWAXfk=;
	b=N0MD1Ijq0DchNygKWzoFeiyaeujBpepS2W+XEw9U+Izojty2HMZemiTRHDwgKGejWrYv
	 QL8kTHJIK20Rt4yP2oq5iT0gbqoDBNuVjO/Q6aGE7TbczgW+SW/ueNR+X5ktAERBtxeat
	 bH0yo5H5hnTS1r0Ww0fnGQYOkQVc7HehcqECycqZuROaGgrTCGumFoOGjiE0dOuavXsjo
	 jCHzHOmUSH8cUL6HsXtdRsfefN0XWXuBLErHJRLgC4Hu7typGgzZRWHlw4h9Aa/JO+f80
	 LjDUoS7xww8TOpE3i4UaLYde8bhg51n+LdEjCBcho7F2ISFTUbsournTBYoFmbYrMMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mDJvm9DZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0B1606A333;
	Wed, 11 Nov 2026 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mDJvm9DZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBFE1F00A05;
	Wed, 11 Nov 2026 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404479;
	bh=an3TW83ZdtfT2MwoqXi8iWyGphn95qAGXKqfNkWAXfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mDJvm9DZo1HkrE3pb8UCSA3HTwc2O3eGKShLigUsy39u8UoL6dT8TYhhobrj5mSBo
	 cYQQDh9xYuJNXpA6roxseht8LDxS7o4UxHz55+q+HLubW46ExnF6z3cRKWd40800z6
	 XierzCbiApwgYjar1swKIIFnmSb/k8DTdtaCAU5sh1edx20Nno8Dde+kUzxTzVhzmL
	 isrtH8ONsH915dmf7NKJuu9pD/tKNZZMWpvgqxfDMjEOAe+AISKKq3pVJ0B1mUmSE8
	 7p94DLjyzPxQVV/zQ2NgzyQoLowGNUpvULcAjQrW6/cqKuCXsuLSaz8Y/8dtTvjLHb
	 uw/UzzkHNQfIA==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Wed, 11 Nov 2026 14:41:03 +0100
Subject: [PATCH 1/3] kbuild: make rq-offsets-file an explicit preparation
 dependency
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
Message-Id: <20261111-reduce-single-build-dependencies-v1-1-7196ca986a85@kernel.org>
References: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
In-Reply-To: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=9viEUNJwwz+O3SrkICAMO/5gG9D0++zxZl0+mSGfRXs=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlfCmrqZldFaTzamsztvWfKlz9uEQb9rVMmb5uzy07bR
 HHnqlntHRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RgxcnAIw1VptjAz7g4yfaszYIe3TOuuNg9TML29lvmwV2j0v4Y3Ol/+2mvOeMzK0vGRbvV1
 n1e5L8qVdqpPWrVp0M+zwwuen3ty1LLpq+lqVHQA=
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

